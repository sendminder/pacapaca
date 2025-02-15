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
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(provider);
          ref.invalidate(articleCommentsProvider(articleId));
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildArticleContent(ref, articleAsync),
              const Divider(height: 1),
              _buildCommentSection(context, ref, commentsAsync, currentUser),
            ],
          ),
        ),
      ),
    );
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
        return ArticleDetailContent(
          article: article,
          onToggleLike: (articleId) async {
            try {
              final response = await ref
                  .read(articleServiceProvider)
                  .toggleArticleLike(articleId);
              if (response != null) {
                // 상세 페이지의 상태 업데이트
                ref.invalidate(articleProvider(articleId));

                // 목록 페이지의 상태도 함께 업데이트
                ref
                    .read(articleListProvider(
                      sortBy: 'latest',
                      limit: 20,
                    ).notifier)
                    .updateArticleLikeStatus(
                      articleId: articleId,
                      isLiked: response.isLiked,
                      likeCount: response.likeCount,
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
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'article.comments'.tr(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          if (currentUser != null) ...[
            CommentInput(
              onSubmit: (content) async {
                await ref
                    .read(articleCommentsProvider(articleId).notifier)
                    .addComment(content);
              },
            ),
            const SizedBox(height: 16),
          ],
          _buildCommentList(ref, commentsAsync, currentUser),
        ],
      ),
    );
  }

  Widget _buildCommentList(
    WidgetRef ref,
    AsyncValue<List<ArticleCommentDTO>?> commentsAsync,
    UserDTO? currentUser,
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
