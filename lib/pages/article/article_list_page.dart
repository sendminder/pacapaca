import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleListPage extends ConsumerWidget {
  const ArticleListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = articleListProvider(
      sortBy: 'latest',
      limit: 20,
    );

    final articlesAsync = ref.watch(provider);

    Future<void> handleToggleLike(int articleId) async {
      try {
        final response =
            await ref.read(articleServiceProvider).toggleArticleLike(articleId);

        if (response != null) {
          ref.read(provider.notifier).updateArticleLikeStatus(
                articleId: articleId,
                isLiked: response.isLiked,
                likeCount: response.likeCount,
              );
        }
      } catch (e) {
        rethrow;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/articles/new'),
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(provider);
        },
        child: articlesAsync.when(
          data: (articles) {
            if (articles == null || articles.isEmpty) {
              return const Center(
                child: Text('게시글이 없습니다.'),
              );
            }

            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return ArticleListItem(
                  article: articles[index],
                  onToggleLike: handleToggleLike,
                );
              },
            );
          },
          error: (error, stackTrace) => Center(
            child: Text('에러가 발생했습니다: $error'),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

class ArticleListItem extends StatelessWidget {
  final ArticleDTO article;
  final Future<void> Function(int articleId) onToggleLike;

  const ArticleListItem({
    super.key,
    required this.article,
    required this.onToggleLike,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => context.push('/articles/${article.id}'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: article.profileImageUrl.isNotEmpty
                        ? NetworkImage(article.profileImageUrl)
                        : null,
                    child: article.profileImageUrl.isEmpty
                        ? Text(article.nickname[0])
                        : null,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.nickname,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          timeago.format(
                            DateTime.parse(article.createTime),
                            locale: 'ko',
                          ),
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (article.title?.isNotEmpty ?? false) ...[
                Text(
                  article.title!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
              ],
              if (article.thumbnailUrl != null) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    article.thumbnailUrl!,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
              ],
              Text(
                article.content,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[800],
                  height: 1.4,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      try {
                        await onToggleLike(article.id);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('좋아요 처리 중 오류가 발생했습니다: $e')),
                        );
                      }
                    },
                    child: Row(
                      children: [
                        Icon(
                          article.isLiked
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 24,
                          color: article.isLiked
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${article.likeCount}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  Row(
                    children: [
                      Icon(
                        Icons.chat_bubble_outline,
                        size: 22,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${article.commentCount}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 24),
                  Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        size: 22,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${article.viewCount}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (article.tags != null && article.tags!.isNotEmpty) ...[
                const SizedBox(height: 12),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: article.tags!.map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '#$tag',
                        style: TextStyle(
                          fontSize: 13,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
