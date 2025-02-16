import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/pages/article/widgets/article_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/providers/settings_provider.dart';

class ArticleListPage extends ConsumerStatefulWidget {
  const ArticleListPage({super.key});

  @override
  ConsumerState<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends ConsumerState<ArticleListPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final sortBy = ref.watch(articleSortProvider);
    final provider = articleListProvider(
      sortBy: sortBy,
      limit: 20,
    );
    final articlesAsync = ref.watch(provider);

    Future<void> handleToggleLike(int articleId) async {
      try {
        final response =
            await ref.read(articleServiceProvider).toggleArticleLike(articleId);
        if (response != null) {
          ref.read(provider.notifier).updateArticleStatus(
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
        title: Text('article.title'.tr()),
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
              return Center(
                child: Text('article.no_articles'.tr()),
              );
            }

            return ListView.builder(
              controller: _scrollController,
              itemCount: articles.length + 1, // +1 for the sort header
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      border: Border(
                        top: BorderSide(
                          color: Theme.of(context).dividerColor.withAlpha(10),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        PopupMenuButton<String>(
                          child: Row(
                            children: [
                              if (sortBy == 'latest')
                                Text('article.sort.latest'.tr()),
                              if (sortBy == 'views')
                                Text('article.sort.views'.tr()),
                              const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 'latest',
                              child: Text('article.sort.latest'.tr()),
                            ),
                            PopupMenuItem(
                              value: 'views',
                              child: Text('article.sort.views'.tr()),
                            ),
                          ],
                          onSelected: (value) {
                            ref
                                .read(articleSortProvider.notifier)
                                .setSort(value);
                            ref.invalidate(provider);
                          },
                        ),
                      ],
                    ),
                  );
                }

                final articleIndex = index - 1;
                if (articleIndex == articles.length - 1) {
                  Future.microtask(() {
                    ref.read(provider.notifier).loadMore(
                          sortBy: sortBy,
                          limit: 20,
                          lastArticle: articles.last,
                        );
                  });
                }

                return ArticleCard(
                  article: articles[articleIndex],
                  onToggleLike: handleToggleLike,
                );
              },
            );
          },
          error: (error, stackTrace) => Center(
            child: Text('article.error'.tr(args: [error.toString()])),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
