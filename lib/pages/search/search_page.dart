import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/pages/article/widgets/article_card.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/widgets/page_title.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final _searchController = TextEditingController();
  final _focusNode = FocusNode();
  final _scrollController = ScrollController();
  String _currentQuery = '';

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    final searchResults = _currentQuery.isEmpty
        ? const AsyncValue.data(<ArticleDTO>[])
        : ref.watch(articleSearchProvider(_currentQuery));
    final recentSearches = ref.watch(recentSearchesProvider);

    return Scaffold(
      appBar: PageTitle(
        title: 'search.title'.tr(),
        bottom: _buildSearchField(),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: _currentQuery.isEmpty
          ? _buildEmptySearch(recentSearches)
          : searchResults.when(
              data: (articles) => _buildSearchResults(articles),
              error: (error, stackTrace) => _buildError(),
              loading: () => _buildLoading(),
            ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildSearchField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: _searchController,
        focusNode: _focusNode,
        textInputAction: TextInputAction.search,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          hintText: 'search.hint'.tr(),
          filled: true,
          fillColor: Theme.of(context).colorScheme.surfaceContainerLow,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _onSearch('');
                  },
                )
              : null,
        ),
        onSubmitted: _onSearch,
      ),
    );
  }

  Widget _buildEmptySearch(List<String> recentSearches) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (recentSearches.isNotEmpty) ...[
          _buildRecentSearchesHeader(),
          _buildRecentSearchesList(recentSearches),
        ] else
          const Spacer(),
      ],
    );
  }

  Widget _buildRecentSearchesHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'search.recent'.tr(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          TextButton(
            onPressed: () {
              ref.read(recentSearchesProvider.notifier).clearSearches();
            },
            style: TextButton.styleFrom(
              foregroundColor:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
            ),
            child: Text('search.clear'.tr()),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentSearchesList(List<String> recentSearches) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: recentSearches.length,
        itemBuilder: (context, index) =>
            _buildRecentSearchItem(recentSearches[index]),
      ),
    );
  }

  Widget _buildRecentSearchItem(String query) {
    return InkWell(
      onTap: () {
        _searchController.text = query;
        _onSearch(query);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            const Icon(
              Icons.history,
              size: 18,
              color: Colors.grey,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                query,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.2,
                ),
              ),
            ),
            _buildDeleteButton(query),
          ],
        ),
      ),
    );
  }

  Widget _buildDeleteButton(String query) {
    return IconButton(
      icon: Icon(
        Icons.close,
        size: 18,
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
      ),
      onPressed: () {
        ref.read(recentSearchesProvider.notifier).removeSearch(query);
      },
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      visualDensity: VisualDensity.compact,
    );
  }

  Widget _buildSearchResults(List<ArticleDTO>? articles) {
    if (articles == null || articles.isEmpty) {
      return _buildNoResults();
    }

    return RefreshIndicator(
      onRefresh: () async {
        ref
            .read(articleSearchProvider(_currentQuery).notifier)
            .refresh(_currentQuery);
      },
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.only(top: 8),
        itemCount: articles.length,
        itemBuilder: (context, index) => _buildArticleCard(articles[index]),
      ),
    );
  }

  Widget _buildArticleCard(ArticleDTO article) {
    return ArticleCard(
      article: article,
      onToggleLike: (articleId) async {
        final response = await ref
            .read(articleProvider(article.id).notifier)
            .toggleArticleLike(article.id);
        if (response != null) {
          ref
              .read(articleSearchProvider(_currentQuery).notifier)
              .updateArticleStatus(
                articleId: article.id,
                isLiked: response.isLiked,
                likeCount: response.likeCount,
              );
        }
      },
    );
  }

  Widget _buildNoResults() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 80,
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
          ),
          const SizedBox(height: 16),
          Text(
            'search.no_results'.tr(),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.5),
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildError() {
    return Center(
      child: Text('error.common'.tr()),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
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
            'assets/profiles/pacappi_origin.png',
            width: 40,
            height: 40,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref
          .read(articleSearchProvider(_currentQuery).notifier)
          .loadMore(_currentQuery);
    }
  }

  void _onSearch(String query) {
    if (query.trim().isEmpty) {
      setState(() {
        _currentQuery = '';
      });
      return;
    }

    ref.read(recentSearchesProvider.notifier).addSearch(query.trim());
    setState(() {
      _currentQuery = query.trim();
    });
    _focusNode.unfocus();
  }
}
