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
import 'package:pacapaca/widgets/shared/article_skeleton_item.dart';
import 'package:pacapaca/pages/article/widgets/article_action_menu.dart';
import 'package:pacapaca/widgets/shared/comment/comment_list.dart';

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
    final provider = articleProvider(widget.articleId);
    final articleAsync = ref.watch(provider);
    final commentsAsync = ref.watch(commentListProvider(widget.articleId));
    final currentUser = ref.watch(authProvider).value;

    // 게시글 상세 페이지에서 좋아요 버튼 클릭 시 목록 업데이트
    _updateArticleList(ref, provider);

    return Scaffold(
      appBar: AppBar(
        title: Text('article.title'.tr()),
        actions: [
          articleAsync.when(
            data: (article) =>
                _buildArticleActions(context, ref, article, currentUser),
            error: (error, _) =>
                Text('article.error'.tr(args: [error.toString()])),
            loading: () => const SizedBox.shrink(),
          ),
        ],
      ),
      body: articleAsync.when(
        data: (article) => GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(provider);
              ref.invalidate(commentListProvider(widget.articleId));
            },
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels >=
                    scrollInfo.metrics.maxScrollExtent * 0.8) {
                  ref
                      .read(commentListProvider(widget.articleId).notifier)
                      .loadMore(widget.articleId);
                }
                return true;
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildArticleContent(ref, article),
                    Divider(
                      height: 0.5,
                      color:
                          Theme.of(context).colorScheme.onSurface.withAlpha(10),
                    ),
                    _buildCommentSection(
                        context, ref, commentsAsync, currentUser, article),
                  ],
                ),
              ),
            ),
          ),
        ),
        error: (error, stack) => const SizedBox.shrink(),
        loading: () => const ArticleSkeletonItem(),
      ),
      bottomSheet: currentUser != null
          ? ChatInput(
              controller: _commentController,
              focusNode: _focusNode,
              onSubmit: (content) async {
                await ref
                    .read(commentListProvider(widget.articleId).notifier)
                    .addComment(widget.articleId, content, _replyingCommentId);

                _commentController.clear();
                FocusScope.of(context).unfocus();
                setState(() {
                  _replyingCommentId = null; // 답글 작성 완료 후 초기화
                });
              },
              hintText: 'comment.hint'.tr(),
              canSend: _canSend,
            )
          : null,
    );
  }

  void _updateArticleList(
    WidgetRef ref,
    ArticleProvider provider,
  ) {
    ref.listen(provider, (previous, next) {
      next.whenData((article) {
        if (article != null) {
          final currentSortBy = ref.read(articleSortProvider);
          ref
              .read(articleListProvider(
                sortBy: currentSortBy,
                limit: 20,
              ).notifier)
              .updateArticleStatus(
                articleId: article.id,
                isLiked: article.isLiked,
                likeCount: article.likeCount,
                viewCount: article.viewCount,
              );
        }
      });
    });
  }

  Widget _buildArticleContent(
    WidgetRef ref,
    ArticleDTO? article,
  ) {
    if (article == null) {
      return Center(child: Text('article.not_found'.tr()));
    }
    final currentSortBy = ref.read(articleSortProvider);
    final selectedCategory = ref.read(articleCategoryProvider);

    return ArticleDetailContent(
      article: article,
      onToggleLike: (articleId) async {
        try {
          final response = await ref
              .read(articleProvider(articleId).notifier)
              .toggleArticleLike(articleId);
          if (response != null) {
            ref
                .read(articleListProvider(
                  sortBy: currentSortBy,
                  category: selectedCategory,
                  limit: 20,
                ).notifier)
                .updateArticleStatus(
                  articleId: articleId,
                  isLiked: response.isLiked,
                  likeCount: response.likeCount,
                  viewCount: article.viewCount,
                );
            // 상세 페이지 상태 갱신
            ref.read(articleProvider(articleId).notifier).updateArticleStatus(
                  response.isLiked,
                  response.likeCount,
                  article.viewCount,
                  article.commentCount,
                );
          }
        } catch (e) {
          rethrow;
        }
      },
    );
  }

  Widget _buildCommentSection(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<List<ArticleCommentDTO>?> commentsAsync,
    UserDTO? currentUser,
    ArticleDTO? article,
  ) {
    if (article == null) {
      return const SizedBox.shrink();
    }
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
                            if (commentSort == 'latest')
                              Text('article.sort.latest'.tr()),
                            if (commentSort == 'oldest')
                              Text('article.sort.oldest'.tr()),
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
    ArticleDTO? article,
  ) {
    if (article == null) {
      return const SizedBox.shrink();
    }

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
          onLoadMoreReplies: (parentId) {},
          onReply: (parentId) async {
            setState(() {
              _replyingCommentId = parentId;
            });
            _focusNode.requestFocus();
          },
        );
      },
      error: (error, _) => Center(
        child: Text('article.error'.tr(args: [error.toString()])),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
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
