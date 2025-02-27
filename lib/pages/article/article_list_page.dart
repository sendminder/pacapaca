import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/pages/article/widgets/article_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'package:pacapaca/models/enums/article_category.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/widgets/page_title.dart';
import 'package:pacapaca/widgets/shared/article_skeleton_item.dart';

class ArticleListPage extends ConsumerStatefulWidget {
  const ArticleListPage({super.key});

  @override
  ConsumerState<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends ConsumerState<ArticleListPage> {
  final _pageController = PageController();
  final _scrollController = ScrollController();
  late String _sortBy;
  late ArticleCategory _selectedCategory;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ref.invalidate(articleListProvider);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      ref
          .read(articleListProvider(
            sortBy: _sortBy,
            category: _selectedCategory,
            limit: 20,
          ).notifier)
          .loadMore(
            sortBy: _sortBy,
            limit: 20,
            category: _selectedCategory,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    _sortBy = ref.watch(articleSortProvider);
    _selectedCategory = ref.watch(articleCategoryProvider);

    return Scaffold(
      appBar: PageTitle(
        title: 'article.title'.tr(),
        trailing: _buildSortDropdown(),
        bottom: _buildCategoryFilter(),
      ),
      body: PageView(
        controller: _pageController,
        physics: const PageScrollPhysics(),
        clipBehavior: Clip.none,
        onPageChanged: (index) {
          final category = ArticleCategory.values[index];
          if (category != _selectedCategory) {
            ref.read(articleCategoryProvider.notifier).setCategory(category);
          }
        },
        children: ArticleCategory.values.map((category) {
          final articlesAsync = ref.watch(articleListProvider(
            sortBy: _sortBy,
            category: category,
            limit: 20,
          ));

          return RefreshIndicator(
            onRefresh: () async {
              await ref
                  .read(articleListProvider(
                    sortBy: _sortBy,
                    limit: 20,
                    category: category,
                  ).notifier)
                  .forceRefresh(
                    sortBy: _sortBy,
                    limit: 20,
                    category: category,
                  );
            },
            child: articlesAsync.when(
              data: (articles) => _buildArticleList(articles ?? []),
              error: (error, stackTrace) => const SizedBox.shrink(),
              loading: () => ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => const ArticleSkeletonItem(),
              ),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildSortDropdown() {
    final sortBy = ref.watch(articleSortProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: sortBy,
          icon: const Icon(Icons.arrow_drop_down),
          isDense: true,
          items: [
            DropdownMenuItem(
              value: 'latest',
              child: Text(
                'article.sort.latest'.tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            DropdownMenuItem(
              value: 'views',
              child: Text(
                'article.sort.views'.tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              ref.read(articleSortProvider.notifier).setSort(value);
            }
          },
        ),
      ),
    );
  }

  Widget _buildCategoryFilter() {
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Row(
        children: ArticleCategory.values.map((category) {
          final isSelected = category == _selectedCategory;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  final index = ArticleCategory.values.indexOf(category);
                  ref
                      .read(articleCategoryProvider.notifier)
                      .setCategory(category);

                  _pageController.jumpToPage(index);
                },
                borderRadius: BorderRadius.circular(20),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? colorScheme.primary
                        : colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.outline.withAlpha(10),
                      width: 0.5,
                    ),
                  ),
                  child: Text(
                    category.label,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.normal,
                      color: isSelected
                          ? colorScheme.onPrimary
                          : colorScheme.onSurface.withAlpha(200),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildArticleList(List<ArticleDTO> articles) {
    return ListView.builder(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 8),
      itemCount: articles.length,
      itemBuilder: (context, index) => ArticleCard(
        article: articles[index],
        onToggleLike: (articleId) async {
          try {
            final response = await ref
                .read(articleProvider(articleId).notifier)
                .toggleArticleLike(articleId);
            if (response != null) {
              ref
                  .read(articleListProvider(
                    sortBy: _sortBy,
                    category: _selectedCategory,
                    limit: 20,
                  ).notifier)
                  .updateArticleStatus(
                    articleId: articleId,
                    isLiked: response.isLiked,
                    likeCount: response.likeCount,
                  );
            }
          } catch (e) {
            rethrow;
          }
        },
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: 'ai_helper',
          onPressed: () => context.push('/articles/ai-helper'),
          child: Image.asset(
            'assets/profiles/pacappiface.png',
            width: 36,
            height: 36,
          ),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          heroTag: 'create_article',
          onPressed: () => context.push('/articles/new'),
          child: Icon(
            Icons.edit,
            color: Colors.white.withAlpha(200),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
