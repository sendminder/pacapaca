import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:pacapaca/pages/article/widgets/article_card.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/widgets/page_title.dart';
import 'package:pacapaca/widgets/shared/rotating_paca_loader.dart';
import 'package:go_router/go_router.dart';

class UserPostsPage extends ConsumerStatefulWidget {
  final int userId;

  const UserPostsPage({
    super.key,
    required this.userId,
  });

  @override
  ConsumerState<UserPostsPage> createState() => _UserPostsPageState();
}

class _UserPostsPageState extends ConsumerState<UserPostsPage> {
  final _scrollController = ScrollController();

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
        _scrollController.position.maxScrollExtent - 200) {
      ref
          .read(userArticlesProvider(widget.userId).notifier)
          .loadMore(widget.userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncArticles = ref.watch(userArticlesProvider(widget.userId));
    final currentUser = ref.watch(authProvider).value;
    final isMyPosts =
        currentUser != null && currentUser.id.toString() == widget.userId;

    return Scaffold(
      appBar: PageTitle(
        title: isMyPosts ? 'profile.my_posts'.tr() : 'profile.user_posts'.tr(),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: asyncArticles.when(
        loading: () => const Center(child: RotatingPacaLoader()),
        error: (error, _) => Center(
          child: Text(
            'error.common'.tr(),
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ),
        data: (articles) {
          if (articles == null || articles.isEmpty) {
            return _buildEmptyList(isMyPosts);
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref
                  .read(userArticlesProvider(widget.userId).notifier)
                  .refresh(widget.userId);
            },
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 8),
              itemCount: articles.length,
              itemBuilder: (context, index) =>
                  _buildArticleCard(articles[index]),
            ),
          );
        },
      ),
    );
  }

  Widget _buildArticleCard(ArticleDTO article) {
    return ArticleCard(
      article: article,
      onTap: () => context.push('/articles/${article.id}'),
    );
  }

  Widget _buildEmptyList(bool isMyPosts) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.article_outlined,
            size: 80,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
          ),
          const SizedBox(height: 16),
          Text(
            isMyPosts
                ? 'profile.no_my_posts'.tr()
                : 'profile.no_user_posts'.tr(),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(128),
                ),
          ),
        ],
      ),
    );
  }
}
