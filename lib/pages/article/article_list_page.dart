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
import 'package:pacapaca/widgets/notification/notification_bell.dart';
import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/utils/block_check_util.dart';

class ArticleListPage extends ConsumerStatefulWidget {
  const ArticleListPage({super.key});

  @override
  ConsumerState<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends ConsumerState<ArticleListPage> {
  final _pageController = PageController();
  final Map<ArticleCategory, ScrollController> _scrollControllers = {};
  late String _sortBy;
  late ArticleCategory _selectedCategory;
  final logger = GetIt.instance<Logger>();

  @override
  void initState() {
    super.initState();
    for (final category in ArticleCategory.values) {
      _scrollControllers[category] = ScrollController()
        ..addListener(() => _onScroll(category));
    }

    Future.microtask(() {
      _sortBy = ref.read(articleSortProvider);
      _selectedCategory = ref.read(articleCategoryProvider);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _onScroll(ArticleCategory category) {
    final controller = _scrollControllers[category];
    if (controller != null &&
        controller.position.pixels >=
            controller.position.maxScrollExtent * 0.8) {
      ref
          .read(articleListProvider(
            sortBy: _sortBy,
            category: category,
            limit: 20,
          ).notifier)
          .loadMore(
            sortBy: _sortBy,
            limit: 20,
            category: category,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    _sortBy = ref.watch(articleSortProvider);
    _selectedCategory = ref.watch(articleCategoryProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: PageTitle(
        title: 'article.title'.tr(),
        actions: const [
          NotificationBell(),
        ],
        bottom: _buildCategoryAndSortBar(),
        hasBackButton: false,
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
              data: (articles) => _buildArticleList(articles ?? [], category),
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

  PreferredSizeWidget _buildCategoryAndSortBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategoryFilter(),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 8),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: _buildSortDropdown(),
            ),
          ),
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
      padding: const EdgeInsets.only(left: 10, right: 16, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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

  Widget _buildArticleList(
      List<ArticleDTO> articles, ArticleCategory category) {
    if (articles.isEmpty) {
      return _buildEmptyState(category);
    }

    return ListView.builder(
      controller: _scrollControllers[category],
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 8),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return ArticleCard(
          article: article,
          onTap: () => context.push('/articles/${article.id}'),
        );
      },
    );
  }

  Widget _buildEmptyState(ArticleCategory category) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: primaryColor.withAlpha(30),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.article_outlined,
                  size: 60,
                  color: primaryColor.withAlpha(200),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'article.no_articles'.tr(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: 'ai_helper',
          onPressed: () async {
            if (await BlockCheckUtil.canPerformAction(context, ref)) {
              context.push('/articles/ai-helper');
            }
          },
          child: Image.asset(
            'assets/profiles/pacappiface.png',
            width: 36,
            height: 36,
          ),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          heroTag: 'create_article',
          onPressed: () async {
            if (await BlockCheckUtil.canPerformAction(context, ref)) {
              context.push('/articles/new');
            }
          },
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
    for (final controller in _scrollControllers.values) {
      controller.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }
}
