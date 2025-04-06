import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/widgets/shared/user_avatar.dart';
import 'package:pacapaca/widgets/shared/interaction_button.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/enums/article_category.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/utils/block_check_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleDetailContent extends ConsumerWidget {
  final ArticleDTO article;
  final logger = GetIt.instance<Logger>();
  final Function(int) onReply;

  ArticleDetailContent({
    super.key,
    required this.article,
    required this.onReply,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // // 캐시에서 최신 상태의 게시글 가져오기
    // final cachedArticle =
    //     ref.watch(articleCacheProvider.select((cache) => cache[article.id]));

    // 캐시에 있는 게시글 또는 원래 게시글 사용
    final displayArticle = article;

    return Container(
      color: colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 헤더 (프로필 + 시간)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
            child: _buildHeader(context, displayArticle),
          ),

          // 제목
          if (displayArticle.title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 20),
              child: Text(
                displayArticle.title,
                style: textTheme.headlineSmall?.copyWith(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                  letterSpacing: -0.5,
                ),
              ),
            ),

          const SizedBox(height: 16),

          // 썸네일
          if (displayArticle.thumbnailUrl != null) ...[
            _buildThumbnail(displayArticle),
            const SizedBox(height: 20),
          ],

          // 내용
          _buildContent(context, displayArticle),

          const SizedBox(height: 24),

          // 태그
          if (displayArticle.tags != null &&
              displayArticle.tags!.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildTags(context, displayArticle),
            ),
            const SizedBox(height: 24),
          ],

          // 상호작용 버튼 (좋아요, 댓글, 조회수)
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
            child: _buildInteractions(context, ref, displayArticle),
          ),
        ],
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

        // 사용자 정보 및 시간
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                displayArticle.displayUser.nickname,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                timeago.format(DateTime.parse(displayArticle.createTime),
                    locale: context.locale.countryCode),
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurface.withAlpha(153),
                ),
              ),
            ],
          ),
        ),

        // 카테고리 표시
        if (displayArticle.category != null)
          _buildCategoryChip(context, displayArticle),
      ],
    );
  }

  Widget _buildContent(BuildContext context, ArticleDTO displayArticle) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        displayArticle.content,
        style: textTheme.bodyLarge?.copyWith(
          height: 1.6,
          color: colorScheme.onSurface.withAlpha(230),
          fontSize: 16.sp,
        ),
      ),
    );
  }

  Widget _buildCategoryChip(BuildContext context, ArticleDTO displayArticle) {
    final emoji = categoryEmojis[displayArticle.category] ?? '📝';

    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 15),
      child: Text(
        emoji,
        style: TextStyle(fontSize: 18.sp),
      ),
    );
  }

  Widget _buildThumbnail(ArticleDTO displayArticle) {
    return SizedBox(
      width: double.infinity,
      height: 250,
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

  Widget _buildTags(BuildContext context, ArticleDTO displayArticle) {
    final colorScheme = Theme.of(context).colorScheme;

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: displayArticle.tags!.map((tag) {
        return InkWell(
          onTap: () {
            // 태그 클릭 시 검색 페이지로 이동
            context.push('/tag-search', extra: {
              'searchQuery': tag,
            });
          },
          child: Text(
            '#$tag',
            style: TextStyle(
              color: colorScheme.primary,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildInteractions(
      BuildContext context, WidgetRef ref, ArticleDTO displayArticle) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // 좋아요 버튼
        Expanded(
          child: InteractionButton(
            icon:
                displayArticle.isLiked ? Icons.favorite : Icons.favorite_border,
            count: displayArticle.likeCount,
            color: displayArticle.isLiked ? colorScheme.primary : null,
            onTap: () async {
              logger.i('상세 페이지: 좋아요 버튼 클릭 - articleId=${displayArticle.id}');
              // 차단 상태 확인
              if (await BlockCheckUtil.canPerformAction(context, ref)) {
                ref
                    .read(articleCacheProvider.notifier)
                    .toggleLike(displayArticle.id);
              }
            },
            size: 20,
            textSize: 14,
            defaultText: 'article.like'.tr(),
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
            onTap: () {
              onReply(displayArticle.id);
            },
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
