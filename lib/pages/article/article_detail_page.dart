import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:pacapaca/widgets/shared/comment_item.dart';
import 'package:pacapaca/pages/article/widgets/article_detail_content.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'package:pacapaca/providers/block_provider.dart';
import 'package:pacapaca/providers/report_provider.dart';
import 'package:pacapaca/widgets/shared/chat/chat_input.dart';
import 'package:pacapaca/widgets/shared/carrot/send_carrot_button.dart';
import 'package:pacapaca/models/dto/comment_dto.dart';
import 'package:pacapaca/providers/comment_provider.dart';

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
      body: GestureDetector(
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
                  _buildArticleContent(ref, articleAsync),
                  Divider(
                    height: 0.5,
                    color:
                        Theme.of(context).colorScheme.onSurface.withAlpha(10),
                  ),
                  _buildCommentSection(
                      context, ref, commentsAsync, currentUser, articleAsync),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomSheet: currentUser != null
          ? ChatInput(
              controller: _commentController,
              focusNode: _focusNode,
              onSubmit: (content) async {
                final comment = await ref
                    .read(commentListProvider(widget.articleId).notifier)
                    .addComment(widget.articleId, content);

                _commentController.clear();
                FocusScope.of(context).unfocus();
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
    AsyncValue<ArticleDTO?> articleAsync,
  ) {
    return articleAsync.when(
      data: (article) {
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
                ref
                    .read(articleProvider(articleId).notifier)
                    .updateArticleStatus(
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
      },
      error: (error, _) => Center(
        child: Text('article.error'.tr(args: [error.toString()])),
      ),
      loading: () => const SizedBox.shrink(),
    );
  }

  Widget _buildCommentSection(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<List<ArticleCommentDTO>?> commentsAsync,
    UserDTO? currentUser,
    AsyncValue<ArticleDTO?> articleAsync,
  ) {
    final commentSort = ref.watch(commentSortProvider);

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 50),
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
          _buildCommentList(ref, commentsAsync, currentUser, articleAsync),
          if (currentUser != null) const SizedBox(height: 70),
        ],
      ),
    );
  }

  Widget _buildCommentList(
    WidgetRef ref,
    AsyncValue<List<ArticleCommentDTO>?> commentsAsync,
    UserDTO? currentUser,
    AsyncValue<ArticleDTO?> articleAsync,
  ) {
    return commentsAsync.when(
      data: (comments) {
        if (comments == null || comments.isEmpty) {
          return const SizedBox.shrink();
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: comments.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final comment = comments[index];
            return CommentItem(
              comment: comment,
              isOwner: comment.userId == currentUser?.id,
              isWriter: articleAsync.value?.userId == currentUser?.id,
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
            );
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

    // 자신의 글이면 수정/삭제 메뉴
    if (article.userId == currentUser?.id) {
      return PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Text('article.edit'.tr()),
            onTap: () => context.push('/articles/${article.id}/edit'),
          ),
          PopupMenuItem(
            child: Text(
              'article.delete'.tr(),
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            onTap: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('article.delete_confirm'.tr()),
                  content: Text('article.delete_confirm_desc'.tr()),
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(false),
                      child: Text('article.cancel'.tr()),
                    ),
                    TextButton(
                      onPressed: () => context.pop(true),
                      child: Text(
                        'article.delete'.tr(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  ],
                ),
              );

              if (confirmed == true) {
                await ref
                    .read(articleEditorProvider.notifier)
                    .deleteArticle(article.id);
                if (context.mounted) {
                  context.pop();
                }
              }
            },
          ),
        ],
      );
    }

    // 다른 사람의 글이면 차단/신고 메뉴
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text('carrot.send'.tr()),
          onTap: () async {
            await SendCarrotButton(
              receiverId: article.userId,
              receiverName: article.displayUser.nickname,
              articleId: article.id,
              description: 'carrot.for_article'.tr(args: [article.title]),
            ).show(context, ref);
          },
        ),
        PopupMenuItem(
          child: Text(
            'block.title'.tr(),
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
          onTap: () async {
            final confirmed = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('block.title'.tr()),
                content: Text('block.confirm'.tr()),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text('block.cancel'.tr()),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text(
                      'block.submit'.tr(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                ],
              ),
            );

            if (confirmed == true) {
              await ref.read(blocksProvider.notifier).blockUser(
                    userId: article.userId,
                    reason:
                        'block.from_article'.tr(args: [article.id.toString()]),
                    articleId: article.id,
                  );
              if (context.mounted) {
                context.pop(); // 게시글 페이지 닫기
              }
            }
          },
        ),
        PopupMenuItem(
          child: Text(
            'report.title'.tr(),
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
          onTap: () async {
            final reason = await showDialog<String>(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('report.title'.tr()),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('report.reason'.tr()),
                    const SizedBox(height: 16),
                    TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'report.reason_hint'.tr(),
                        border: const OutlineInputBorder(),
                      ),
                      onSubmitted: (value) => Navigator.pop(context, value),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('report.cancel'.tr()),
                  ),
                  TextButton(
                    onPressed: () {
                      final textField =
                          context.findRenderObject() as RenderBox?;
                      if (textField != null) {
                        Navigator.pop(context, textField.toString());
                      }
                    },
                    child: Text(
                      'report.submit'.tr(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                ],
              ),
            );

            if (reason != null && reason.isNotEmpty) {
              await ref.read(userReportProvider.notifier).reportUser(
                    userId: article.userId,
                    reason: reason,
                    articleId: article.id,
                  );
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('report.submitted'.tr()),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            }
          },
        ),
      ],
    );
  }
}
