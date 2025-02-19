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
  final _pageController = PageController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      final sortBy = ref.read(articleSortProvider);
      final category = ref.read(articleCategoryProvider);
      ref
          .read(articleListProvider(
            sortBy: sortBy,
            category: category,
            limit: 20,
          ).notifier)
          .loadMore(
            sortBy: sortBy,
            limit: 20,
            category: category,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final sortBy = ref.watch(articleSortProvider);
    final selectedCategory = ref.watch(articleCategoryProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildCategoryFilter(selectedCategory),
          ],
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        physics: const PageScrollPhysics(),
        onPageChanged: (index) {
          // 페이지 전환이 완료된 후에만 카테고리 변경
          final category = ArticleCategory.values[index];
          if (category != ref.read(articleCategoryProvider)) {
            ref.read(articleCategoryProvider.notifier).setCategory(category);
          }
        },
        itemCount: ArticleCategory.values.length,
        itemBuilder: (context, index) {
          final category = ArticleCategory.values[index];
          final provider = articleListProvider(
            sortBy: sortBy,
            category: category,
            limit: 20,
          );
          final articlesAsync = ref.watch(provider);

          return RefreshIndicator(
            onRefresh: () async {
              await ref.read(provider.notifier).forceRefresh(
                    sortBy: sortBy,
                    limit: 20,
                    category: category,
                  );
            },
            child: _buildArticleList(articlesAsync),
          );
        },
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'article.title'.tr(),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          _buildSortDropdown(),
        ],
      ),
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
              value: 'oldest',
              child: Text(
                'article.sort.oldest'.tr(),
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

  Widget _buildCategoryFilter(ArticleCategory selectedCategory) {
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Row(
        children: ArticleCategory.values.map((category) {
          final isSelected = category == selectedCategory;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              selected: isSelected,
              showCheckmark: false,
              label: Text(
                category.label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: isSelected
                      ? colorScheme.onPrimary
                      : colorScheme.onSurface.withOpacity(0.75),
                ),
              ),
              labelPadding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              selectedColor: colorScheme.primary,
              backgroundColor: colorScheme.surfaceContainerLow,
              side: BorderSide(
                color: isSelected
                    ? colorScheme.primary
                    : colorScheme.outline.withOpacity(0.3),
                width: 1,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0,
              pressElevation: 0,
              visualDensity: VisualDensity.compact,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onSelected: (_) {
                final index = ArticleCategory.values.indexOf(category);
                ref
                    .read(articleCategoryProvider.notifier)
                    .setCategory(category);
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildArticleList(AsyncValue<List<ArticleDTO>?> articlesAsync) {
    return articlesAsync.when(
      data: (articles) {
        if (articles == null || articles.isEmpty) {
          return ListView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 200,
                child: Center(
                  child: Text('article.no_articles'.tr()),
                ),
              ),
            ],
          );
        }

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
                    .read(articleServiceProvider)
                    .toggleArticleLike(articleId);
                if (response != null) {
                  ref
                      .read(articleListProvider(
                        sortBy: ref.read(articleSortProvider),
                        category: ref.read(articleCategoryProvider),
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
      },
      error: (error, stackTrace) => ListView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 200,
            child: Center(
              child: Text('article.error'.tr()),
            ),
          ),
        ],
      ),
      loading: () => ListView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 200,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
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
