import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:pacapaca/widgets/shared/comment_item.dart';
import 'package:pacapaca/widgets/shared/comment/comment_input.dart';
import 'package:pacapaca/pages/article/widgets/article_detail_content.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/providers/settings_provider.dart';

class ArticleDetailPage extends ConsumerWidget {
  final int articleId;

  const ArticleDetailPage({
    super.key,
    required this.articleId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = articleProvider(articleId);
    final articleAsync = ref.watch(provider);
    final commentsAsync = ref.watch(articleCommentsProvider(articleId));
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
            loading: () => const CircularProgressIndicator(),
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
            ref.invalidate(articleCommentsProvider(articleId));
          },
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels >=
                  scrollInfo.metrics.maxScrollExtent * 0.8) {
                ref
                    .read(articleCommentsProvider(articleId).notifier)
                    .loadMore();
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
          ? Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(50),
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(10),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                    bottom: 30,
                  ),
                  child: CommentInput(
                    onSubmit: (content) async {
                      await ref
                          .read(articleCommentsProvider(articleId).notifier)
                          .addComment(content);
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
              ),
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
                  .read(articleServiceProvider)
                  .toggleArticleLike(articleId);
              if (response != null) {
                // 상세 페이지 상태 업데이트
                ref.read(articleProvider(articleId).notifier).state =
                    AsyncValue.data(article.copyWith(
                  isLiked: response.isLiked,
                  likeCount: response.likeCount,
                ));

                // 현재 정렬 상태의 목록만 업데이트
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
      loading: () => const Center(child: CircularProgressIndicator()),
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
                    .read(articleCommentsProvider(articleId).notifier)
                    .deleteComment(commentId);
              },
              onUpdate: (commentId, content) async {
                await ref
                    .read(articleCommentsProvider(articleId).notifier)
                    .updateComment(commentId, content);
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
    if (article?.userId != currentUser?.id) {
      return const SizedBox.shrink();
    }

    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text('article.edit'.tr()),
          onTap: () => context.push('/articles/$articleId/edit'),
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
                  .deleteArticle(articleId);
              if (context.mounted) {
                context.pop();
              }
            }
          },
        ),
      ],
    );
  }
}
