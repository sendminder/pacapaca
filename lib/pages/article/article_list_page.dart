import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/pages/article/widgets/article_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'package:pacapaca/models/enums/article_category.dart';
import 'package:pacapaca/models/dto/article_dto.dart';

class ArticleListPage extends ConsumerStatefulWidget {
  const ArticleListPage({super.key});

  @override
  ConsumerState<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends ConsumerState<ArticleListPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      final sortBy = ref.read(articleSortProvider);
      final selectedCategory = ref.read(articleCategoryProvider);
      ref
          .read(articleListProvider(
            sortBy: sortBy,
            category: selectedCategory,
            limit: 20,
          ).notifier)
          .loadMore(
            sortBy: sortBy,
            limit: 20,
            category: selectedCategory,
          );
    }
  }

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
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          final categories = ArticleCategory.values;
          final currentIndex = categories.indexOf(selectedCategory);

          // 스와이프 방향에 따라 이전/다음 카테고리 선택
          if (details.primaryVelocity! > 0) {
            // 왼쪽으로 스와이프
            if (currentIndex > 0) {
              ref
                  .read(articleCategoryProvider.notifier)
                  .setCategory(categories[currentIndex - 1]);
            }
          } else {
            // 오른쪽으로 스와이프
            if (currentIndex < categories.length - 1) {
              ref
                  .read(articleCategoryProvider.notifier)
                  .setCategory(categories[currentIndex + 1]);
            }
          }
        },
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(provider);
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                floating: true,
                snap: true,
                titleSpacing: 0,
                automaticallyImplyLeading: false,
                toolbarHeight: 120,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 8, bottom: 12),
                      child: Text(
                        'article.title'.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    _buildCategoryFilter(),
                  ],
                ),
                backgroundColor: Theme.of(context).colorScheme.surface,
                scrolledUnderElevation: 0,
                surfaceTintColor: null,
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    _buildSortHeader(),
                    _buildCardList(articlesAsync, handleToggleLike, provider),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'ai_helper',
            onPressed: () => context.push('/articles/ai-helper'),
            child: Image.asset(
              'assets/profiles/pacapee_origin.png',
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'create_article',
            onPressed: () => context.push('/articles/new'),
            child: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryFilter() {
    final selectedCategory = ref.watch(articleCategoryProvider);

    return Container(
      color: Theme.of(context).colorScheme.surface,
      height: 40,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4),
        scrollDirection: Axis.horizontal,
        itemCount: ArticleCategory.values.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
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
            : Theme.of(context).colorScheme.surface,
        foregroundColor: isSelected
            ? Colors.white
            : Theme.of(context).colorScheme.onSurfaceVariant,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Theme.of(context).colorScheme.surfaceContainerLow,
          ),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
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

  Widget _buildCardList(
    AsyncValue<List<ArticleDTO>?> articlesAsync,
    Future<void> Function(int articleId) handleToggleLike,
    ArticleListProvider provider,
  ) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: articlesAsync.when(
        data: (articles) {
          if (articles == null || articles.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 60),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'article.error'.tr(args: [error.toString()]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(provider),
                child: Text('article.retry'.tr()),
              ),
            ],
          ),
        ),
        loading: () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(
                'article.loading'.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
