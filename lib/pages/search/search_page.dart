import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/pages/article/widgets/article_card.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/widgets/page_title.dart';
import 'package:pacapaca/widgets/shared/rotating_paca_loader.dart';
import 'package:pacapaca/widgets/notification/notification_bell.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends ConsumerStatefulWidget {
  final String? initialSearchQuery;
  final bool isTagSearch;

  const SearchPage({
    super.key,
    this.initialSearchQuery,
    this.isTagSearch = false,
  });

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  late final TextEditingController _searchController;
  final _focusNode = FocusNode();
  final _scrollController = ScrollController();
  String _currentQuery = '';
  bool _isTagSearch = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialSearchQuery);
    _isTagSearch = widget.isTagSearch;

    // 초기 검색어가 있으면 검색 실행
    if (widget.initialSearchQuery != null &&
        widget.initialSearchQuery!.isNotEmpty) {
      _currentQuery = widget.initialSearchQuery!;

      // 화면이 완전히 로드된 후 검색 실행
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (widget.isTagSearch) {
          // 태그 검색인 경우 최근 검색어에 추가하지 않음
          setState(() {});
        } else {
          _onSearch(_currentQuery);
        }
      });
    } else {
      _focusNode.requestFocus();
    }

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
        title: _isTagSearch ? '#${_currentQuery}' : 'search.title'.tr(),
        actions: const [
          NotificationBell(),
        ],
        bottom: _buildSearchField(),
        hasBackButton: false,
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

  PreferredSizeWidget _buildSearchField() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          controller: _searchController,
          focusNode: _focusNode,
          textInputAction: TextInputAction.search,
          style: const TextStyle(fontSize: 16),
          decoration: InputDecoration(
            hintText:
                _isTagSearch ? 'search.tag_hint'.tr() : 'search.hint'.tr(),
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
            prefixIcon:
                _isTagSearch ? const Icon(Icons.tag) : const Icon(Icons.search),
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _currentQuery = '';
                        _isTagSearch = false;
                      });
                    },
                  )
                : null,
          ),
          onSubmitted: _onSearch,
        ),
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
                  Theme.of(context).colorScheme.onSurface.withAlpha(128),
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
        color: Theme.of(context).colorScheme.onSurface.withAlpha(30),
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
      onTap: () => context.push('/articles/${article.id}'),
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
            color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
          ),
          const SizedBox(height: 16),
          Text(
            'search.no_results'.tr(),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(128),
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
      child: RotatingPacaLoader(),
    );
  }

  Widget _buildFloatingActionButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: 'search_ai_helper',
          onPressed: () => context.push('/articles/ai-helper'),
          child: Image.asset(
            'assets/profiles/pacappiface.png',
            width: 36,
            height: 36,
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
        _isTagSearch = false;
      });
      return;
    }

    // 태그 검색이 아닌 경우에만 최근 검색어에 추가
    if (!_isTagSearch) {
      ref.read(recentSearchesProvider.notifier).addSearch(query.trim());
    }

    setState(() {
      _currentQuery = query.trim();
      // # 기호로 시작하면 태그 검색으로 전환
      if (query.trim().startsWith('#')) {
        _isTagSearch = true;
        _currentQuery = query.trim().substring(1); // # 제거
      }
    });
    _focusNode.unfocus();
  }
}
