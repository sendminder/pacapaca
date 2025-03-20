import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:pacapaca/pages/article/widgets/article_detail_content.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'package:pacapaca/widgets/shared/chat/chat_input.dart';
import 'package:pacapaca/models/dto/comment_dto.dart';
import 'package:pacapaca/providers/comment_provider.dart';
import 'package:pacapaca/pages/article/widgets/article_action_menu.dart';
import 'package:pacapaca/widgets/shared/comment/comment_list.dart';
import 'package:pacapaca/widgets/shared/rotating_paca_loader.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/widgets/page_title.dart';
import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/utils/block_check_util.dart';

class ArticleDetailPage extends ConsumerStatefulWidget {
  final int articleId;

  const ArticleDetailPage({
    super.key,
    required this.articleId,
  });

  @override
  ConsumerState<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends ConsumerState<ArticleDetailPage> {
  final TextEditingController _commentController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _canSend = false;
  int? _replyingCommentId;
  final logger = GetIt.instance<Logger>();

  @override
  void initState() {
    super.initState();
    _commentController.addListener(_updateCanSend);
  }

  void _updateCanSend() {
    final canSend = _commentController.text.isNotEmpty;
    if (canSend != _canSend) {
      setState(() {
        _canSend = canSend;
      });
    }
  }

  @override
  void dispose() {
    _commentController.removeListener(_updateCanSend);
    _commentController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 게시글 데이터 가져오기 (캐시 또는 API)
    final articleAsync = ref.watch(articleProvider(widget.articleId));

    // 캐시에서 최신 데이터 확인 (UI 업데이트 최적화)
    final cachedArticle = ref
        .watch(articleCacheProvider.select((cache) => cache[widget.articleId]));

    // 실제 표시할 데이터 (캐시 우선)
    final displayArticleAsync =
        cachedArticle != null ? AsyncValue.data(cachedArticle) : articleAsync;

    final commentsAsync = ref.watch(commentListProvider(widget.articleId));
    final currentUser = ref.watch(authProvider).value;

    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: PageTitle(
          title: 'article.title'.tr(),
          actions: [
            displayArticleAsync.when(
              data: (article) =>
                  _buildArticleActions(context, ref, article, currentUser),
              error: (error, _) =>
                  Text('article.error'.tr(args: [error.toString()])),
              loading: () => const SizedBox.shrink(),
            ),
          ],
        ),
        body: displayArticleAsync.when(
          loading: () => const Center(child: RotatingPacaLoader()),
          error: (error, _) => Center(
            child: Text('article.error'.tr(args: [error.toString()])),
          ),
          data: (article) {
            if (article == null) {
              return Center(child: Text('article.not_found'.tr()));
            }

            return RefreshIndicator(
              onRefresh: () async {
                // 새로고침 시에는 articleProvider를 invalidate하여 데이터 다시 로드
                ref.invalidate(articleProvider(widget.articleId));
                ref.invalidate(commentListProvider(widget.articleId));
                return Future.delayed(const Duration(milliseconds: 1000));
              },
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  // 스크롤이 80% 이상 내려가면 더 많은 댓글 로드
                  if (scrollInfo.metrics.pixels >=
                      scrollInfo.metrics.maxScrollExtent * 0.8) {
                    ref
                        .read(commentListProvider(widget.articleId).notifier)
                        .loadMore(widget.articleId);
                  }
                  return false; // RefreshIndicator가 작동하도록 false 반환
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      ArticleDetailContent(
                        article: article,
                        onReply: (commentId) {
                          setState(() {
                            _replyingCommentId = null;
                          });
                          FocusScope.of(context).requestFocus(_focusNode);
                        },
                      ),
                      const SizedBox(height: 16),
                      Divider(
                        height: 1,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withAlpha(20),
                      ),
                      const SizedBox(height: 8),
                      _buildCommentSection(
                          context, ref, commentsAsync, currentUser, article),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        bottomSheet: currentUser != null
            ? ChatInput(
                controller: _commentController,
                focusNode: _focusNode,
                onSubmit: (content) async {
                  // 차단 상태 확인
                  if (await BlockCheckUtil.canPerformAction(context, ref)) {
                    await ref
                        .read(commentListProvider(widget.articleId).notifier)
                        .addComment(
                            widget.articleId, content, _replyingCommentId);

                    // 댓글 카운트 증가
                    ref
                        .read(articleCacheProvider.notifier)
                        .incrementCommentCount(widget.articleId);

                    _commentController.clear();
                    _focusNode.unfocus();
                    setState(() {
                      _replyingCommentId = null; // 답글 작성 완료 후 초기화
                    });
                  }
                },
                hintText: _replyingCommentId != null
                    ? 'comment.write_reply'.tr()
                    : 'comment.hint'.tr(),
                canSend: _canSend,
              )
            : null,
      ),
    );
  }

  Widget _buildCommentSection(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<List<ArticleCommentDTO>?> commentsAsync,
    UserDTO? currentUser,
    ArticleDTO article,
  ) {
    final commentSort = ref.watch(commentSortProvider);

    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              commentsAsync.when(
                data: (comments) => comments != null && comments.isNotEmpty
                    ? PopupMenuButton<String>(
                        child: Row(
                          children: [
                            Text(commentSort == 'latest'
                                ? 'article.sort.latest'.tr()
                                : 'article.sort.oldest'.tr()),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 'latest',
                            child: Text('article.sort.latest'.tr()),
                          ),
                          PopupMenuItem(
                            value: 'oldest',
                            child: Text('article.sort.oldest'.tr()),
                          ),
                        ],
                        onSelected: (value) {
                          ref.read(commentSortProvider.notifier).setSort(value);
                        },
                      )
                    : const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
                loading: () => const SizedBox.shrink(),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildCommentList(ref, commentsAsync, currentUser, article),
          if (currentUser != null) const SizedBox(height: 70),
        ],
      ),
    );
  }

  Widget _buildCommentList(
    WidgetRef ref,
    AsyncValue<List<ArticleCommentDTO>?> commentsAsync,
    UserDTO? currentUser,
    ArticleDTO article,
  ) {
    return commentsAsync.when(
      data: (comments) {
        if (comments == null || comments.isEmpty) {
          return const SizedBox.shrink();
        }

        return CommentListWidget(
          comments: comments,
          currentUser: currentUser,
          articleUserId: article.userId,
          onDelete: (commentId) async {
            await ref
                .read(commentListProvider(widget.articleId).notifier)
                .deleteComment(widget.articleId, commentId);
          },
          onUpdate: (commentId, content) async {
            await ref
                .read(commentListProvider(widget.articleId).notifier)
                .updateComment(widget.articleId, commentId, content);
          },
          onLoadMoreReplies: (parentId) {
            context.push(
              '/articles/${widget.articleId}/comment/$parentId/replies/${article.userId}',
            );
          },
          onReply: (parentId) async {
            setState(() {
              _replyingCommentId = parentId;
            });
            _focusNode.requestFocus();
          },
          onToggleLike: (commentId) async {
            // 차단 상태 확인
            if (await BlockCheckUtil.canPerformAction(context, ref)) {
              await ref
                  .read(commentListProvider(widget.articleId).notifier)
                  .toggleLike(commentId);
            }
          },
        );
      },
      error: (error, _) => Center(
        child: Text('article.error'.tr(args: [error.toString()])),
      ),
      loading: () => const SizedBox.shrink(),
    );
  }

  Widget _buildArticleActions(
    BuildContext context,
    WidgetRef ref,
    ArticleDTO? article,
    UserDTO? currentUser,
  ) {
    if (article == null) return const SizedBox.shrink();

    return ArticleActionMenu(
      article: article,
      currentUser: currentUser,
    );
  }
}
