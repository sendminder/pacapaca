import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:pacapaca/pages/article/widgets/article_card.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/widgets/page_title.dart';
import 'package:pacapaca/widgets/shared/rotating_paca_loader.dart';

class LikedPostsPage extends ConsumerStatefulWidget {
  final int userId;

  const LikedPostsPage({
    super.key,
    required this.userId,
  });

  @override
  ConsumerState<LikedPostsPage> createState() => _LikedPostsPageState();
}

class _LikedPostsPageState extends ConsumerState<LikedPostsPage> {
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
          .read(likedPostsProvider(widget.userId).notifier)
          .loadMore(widget.userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncArticles = ref.watch(likedPostsProvider(widget.userId));
    final currentUser = ref.watch(authProvider).value;
    final isMyLikes = currentUser != null &&
        currentUser.id.toString() == widget.userId.toString();

    return Scaffold(
      appBar: PageTitle(
        title: isMyLikes
            ? 'profile.my_liked_posts'.tr()
            : 'profile.user_liked_posts'.tr(),
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
            return _buildEmptyList(isMyLikes);
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.read(likedPostsProvider(widget.userId).notifier).refresh();
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
      onToggleLike: (articleId) async {
        try {
          // 현재 게시글 상태 가져오기
          final currentArticle = ref.read(articleProvider(articleId)).value;
          if (currentArticle != null) {
            // 좋아요 상태 미리 반영 (optimistic update)
            final optimisticArticle = currentArticle.copyWith(
              isLiked: !currentArticle.isLiked,
              likeCount: currentArticle.isLiked
                  ? currentArticle.likeCount - 1
                  : currentArticle.likeCount + 1,
            );

            // 로컬 상태 업데이트
            ref.read(articleProvider(articleId).notifier).state =
                AsyncData(optimisticArticle);

            // 캐시 업데이트 (다른 화면과 동기화)
            ref
                .read(articleCacheProvider.notifier)
                .updateArticle(optimisticArticle);

            // 좋아요 취소 시 목록에서 즉시 제거
            if (currentArticle.isLiked) {
              // 현재 목록 상태 가져오기
              final currentArticles =
                  ref.read(likedPostsProvider(widget.userId));
              if (currentArticles.hasValue && currentArticles.value != null) {
                // 좋아요 취소된 게시글 제외한 새 목록 생성
                final updatedList = currentArticles.value!
                    .where((a) => a.id != articleId)
                    .toList();

                // 목록 상태 업데이트 (UI 즉시 반영)
                ref.read(likedPostsProvider(widget.userId).notifier).state =
                    AsyncData(updatedList);
              }
            }
          }

          // 백그라운드에서 API 호출 (UI 업데이트 후 실제 서버 반영)
          await ref
              .read(articleProvider(articleId).notifier)
              .toggleArticleLike(articleId);
        } catch (e) {
          // 에러 발생 시 상태 복구
          ref.invalidate(articleProvider(articleId));
          rethrow;
        }
      },
    );
  }

  Widget _buildEmptyList(bool isMyLikes) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 80,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
          ),
          const SizedBox(height: 16),
          Text(
            isMyLikes
                ? 'profile.no_my_liked_posts'.tr()
                : 'profile.no_user_liked_posts'.tr(),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(128),
                ),
          ),
        ],
      ),
    );
  }
}
