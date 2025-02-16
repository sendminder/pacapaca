import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/pages/article/widgets/article_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'package:pacapaca/models/enums/article_category.dart';

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
    final selectedCategory = ref.watch(articleCategoryProvider);
    final provider = articleListProvider(
      sortBy: sortBy,
      category: selectedCategory,
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
        child: ListView(
          controller: _scrollController,
          children: [
            _buildCategoryFilter(),
            _buildSortHeader(),
            articlesAsync.when(
              data: (articles) {
                if (articles == null || articles.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('article.no_articles'.tr()),
                    ),
                  );
                }

                return Column(
                  children: articles
                      .map((article) => ArticleCard(
                            article: article,
                            onToggleLike: handleToggleLike,
                          ))
                      .toList(),
                );
              },
              error: (error, stackTrace) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('article.error'.tr(args: [error.toString()])),
                ),
              ),
              loading: () => const Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryFilter() {
    final selectedCategory = ref.watch(articleCategoryProvider);

    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: ArticleCategory.values.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = ArticleCategory.values[index];
          return _categoryButton(
            label: category.label,
            isSelected: selectedCategory == category,
            onTap: () => ref
                .read(articleCategoryProvider.notifier)
                .setCategory(category),
          );
        },
      ),
    );
  }

  Widget _categoryButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.surfaceVariant,
        foregroundColor: isSelected
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.onSurfaceVariant,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(label),
    );
  }

  Widget _buildSortHeader() {
    final sortBy = ref.watch(articleSortProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                if (sortBy == 'latest') Text('article.sort.latest'.tr()),
                if (sortBy == 'views') Text('article.sort.views'.tr()),
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
              ref.read(articleSortProvider.notifier).setSort(value);
              ref.invalidate(articleListProvider(
                sortBy: value,
                category: ref.read(articleCategoryProvider),
                limit: 20,
              ));
            },
          ),
        ],
      ),
    );
  }
}
