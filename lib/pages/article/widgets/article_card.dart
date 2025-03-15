import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/widgets/shared/user_avatar.dart';
import 'package:pacapaca/widgets/shared/interaction_button.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pacapaca/models/enums/article_category.dart';
import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:easy_localization/easy_localization.dart';

class ArticleCard extends ConsumerWidget {
  final ArticleDTO article;
  final VoidCallback? onTap;
  final logger = GetIt.instance<Logger>();

  ArticleCard({
    super.key,
    required this.article,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    // 캐시에서 최신 상태의 게시글 가져오기
    final cachedArticle =
        ref.watch(articleCacheProvider.select((cache) => cache[article.id]));

    // 캐시에 있는 게시글 또는 원래 게시글 사용
    final displayArticle = cachedArticle ?? article;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      elevation: 0.5,
      clipBehavior: Clip.antiAlias,
      color: Theme.of(context).colorScheme.primary.withAlpha(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colorScheme.outline.withAlpha(30),
          width: 0.5,
        ),
      ),
      child: InkWell(
        onTap: onTap ?? () => context.push('/articles/${displayArticle.id}'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 썸네일이 있는 경우 상단에 표시
            if (displayArticle.thumbnailUrl != null)
              _buildThumbnail(displayArticle),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 헤더 (프로필 + 카테고리)
                  _buildHeader(context, displayArticle),

                  const SizedBox(height: 12),

                  // 제목
                  if (displayArticle.title.isNotEmpty)
                    _buildTitle(context, displayArticle),

                  const SizedBox(height: 8),

                  // 내용
                  _buildContent(context, displayArticle),

                  const SizedBox(height: 16),

                  // 상호작용 버튼 (좋아요, 댓글, 조회수)
                  _buildInteractions(context, ref, displayArticle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ArticleDTO displayArticle) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        // 프로필 아바타
        UserAvatar(
          imageUrl: displayArticle.displayUser.profileImageUrl ?? '',
          profileType: displayArticle.displayUser.profileType,
          userId: displayArticle.displayUser.id,
        ),

        const SizedBox(width: 12),

        // 사용자 정보
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                displayArticle.displayUser.nickname,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                timeago.format(DateTime.parse(displayArticle.createTime),
                    locale: context.locale.countryCode),
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurface.withAlpha(150),
                ),
              ),
            ],
          ),
        ),

        // 카테고리 이모지
        if (displayArticle.category != null)
          _buildCategoryChip(context, displayArticle),
      ],
    );
  }

  Widget _buildCategoryChip(BuildContext context, ArticleDTO displayArticle) {
    final emoji = categoryEmojis[displayArticle.category] ?? '📝';

    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 15),
      child: Text(
        emoji,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }

  Widget _buildTitle(BuildContext context, ArticleDTO displayArticle) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      displayArticle.title,
      style: textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
        height: 1.3,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildThumbnail(ArticleDTO displayArticle) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: CachedNetworkImage(
        imageUrl: displayArticle.thumbnailUrl!,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: Colors.grey[200],
          child: const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
        errorWidget: (context, error, stackTrace) => Container(
          color: Colors.grey[200],
          child: const Icon(
            Icons.image_not_supported,
            size: 40,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, ArticleDTO displayArticle) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Text(
      displayArticle.content,
      style: textTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurface.withAlpha(200),
        height: 1.5,
        fontSize: 16,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildInteractions(
      BuildContext context, WidgetRef ref, ArticleDTO displayArticle) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        // 좋아요 버튼
        Expanded(
          child: InteractionButton(
            icon:
                displayArticle.isLiked ? Icons.favorite : Icons.favorite_border,
            count: displayArticle.likeCount,
            color: displayArticle.isLiked ? colorScheme.primary : null,
            size: 20,
            textSize: 14,
            defaultText: 'article.like'.tr(),
            onTap: () {
              logger.i('좋아요 버튼 클릭 - articleId=${displayArticle.id}');

              // 낙관적 UI 업데이트를 위한 게시글 복사본 생성
              final optimisticArticle = displayArticle.copyWith(
                isLiked: !displayArticle.isLiked,
                likeCount: displayArticle.isLiked
                    ? displayArticle.likeCount - 1
                    : displayArticle.likeCount + 1,
              );

              // 캐시 업데이트 (낙관적 UI 업데이트)
              ref
                  .read(articleCacheProvider.notifier)
                  .updateArticle(optimisticArticle);

              ref
                  .read(articleCacheProvider.notifier)
                  .toggleLike(displayArticle.id);
            },
          ),
        ),

        // 댓글 버튼
        Expanded(
          child: InteractionButton(
            icon: Icons.chat_bubble_outline_rounded,
            count: displayArticle.commentCount,
            size: 20,
            textSize: 14,
            defaultText: 'article.comments'.tr(),
          ),
        ),

        // 조회수 버튼
        Expanded(
          child: InteractionButton(
            icon: Icons.visibility_outlined,
            count: displayArticle.viewCount,
            size: 20,
            textSize: 14,
            defaultText: 'article.views'.tr(),
          ),
        ),

        // 당근 받은 수 버튼
        Expanded(
          child: InteractionButton(
            customIcon: displayArticle.carrotCount > 0
                ? Image.asset(
                    'assets/icon/carrot.png',
                    width: 20,
                    height: 20,
                  )
                : const SizedBox(width: 20, height: 20),
            count: displayArticle.carrotCount,
            size: 20,
            textSize: 14,
            defaultText: '',
            showCount: displayArticle.carrotCount > 0,
          ),
        ),
      ],
    );
  }
}
