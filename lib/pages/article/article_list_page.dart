import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/pages/article/widgets/article_card.dart';
import 'package:easy_localization/easy_localization.dart';

class ArticleListPage extends ConsumerStatefulWidget {
  const ArticleListPage({super.key});

  @override
  ConsumerState<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends ConsumerState<ArticleListPage> {
  final ScrollController _scrollController = ScrollController();
  String sortBy = 'latest'; // 기본값은 최신순

  @override
  Widget build(BuildContext context) {
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
        title: Text('article.title'.tr()),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              sortBy = value;
              ref.invalidate(provider); // 정렬 변경 시 목록 새로고침
            },
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
          ),
        ],
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
              itemCount: articles.length,
              itemBuilder: (context, index) {
                if (index == articles.length - 1) {
                  Future.microtask(() {
                    ref.read(provider.notifier).loadMore(
                          sortBy: sortBy,
                          limit: 20,
                          lastArticle: articles.last,
                        );
                  });
                }

                return ArticleCard(
                  article: articles[index],
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
