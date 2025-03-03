import 'package:flutter/material.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/widgets/shared/user_avatar.dart';
import 'package:pacapaca/widgets/shared/tag_list.dart';
import 'package:pacapaca/widgets/shared/interaction_button.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:cached_network_image/cached_network_image.dart';

class ArticleDetailContent extends StatelessWidget {
  final ArticleDTO article;
  final Future<void> Function(int) onToggleLike;

  const ArticleDetailContent({
    super.key,
    required this.article,
    required this.onToggleLike,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          if (article.title.isNotEmpty) ...[
            const SizedBox(height: 16),
            _buildTitle(context),
          ],
          if (article.thumbnailUrl != null) ...[
            const SizedBox(height: 12),
            _buildThumbnail(),
          ],
          const SizedBox(height: 8),
          _buildContent(context),
          const SizedBox(height: 16),
          if (article.tags != null && article.tags!.isNotEmpty) ...[
            const SizedBox(height: 12),
            _buildTags(context),
          ],
          const SizedBox(height: 16),
          _buildInteractions(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        UserAvatar(
          imageUrl: article.displayUser.profileImageUrl ?? '',
          profileType: article.displayUser.profileType,
          userId: article.displayUser.id,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Row(
            children: [
              Text(
                article.displayUser.nickname,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                timeago.format(DateTime.parse(article.createTime),
                    locale: 'ko'),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withAlpha(128),
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      article.title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  Widget _buildThumbnail() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: article.thumbnailUrl!,
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
        errorWidget: (context, error, stackTrace) => Container(
          width: double.infinity,
          height: 200,
          color: Colors.grey[300],
          child: const Icon(Icons.image_not_supported),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Text(
      article.content,
      style: TextStyle(
        fontSize: 16,
        color: Theme.of(context).colorScheme.onSurface,
        height: 1.4,
      ),
    );
  }

  Widget _buildTags(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: article.tags!.map((tag) {
        return InkWell(
          onTap: () {
            // 태그 클릭 시 해당 태그로 검색하거나 관련 페이지로 이동
          },
          child: Text(
            '#$tag',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildInteractions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InteractionButton(
            icon: article.isLiked ? Icons.favorite : Icons.favorite_border,
            count: article.likeCount,
            color:
                article.isLiked ? Theme.of(context).colorScheme.primary : null,
            onTap: () => onToggleLike(article.id),
          ),
        ),
        Expanded(
          child: InteractionButton(
            icon: Icons.chat_bubble_outline,
            count: article.commentCount,
          ),
        ),
        Expanded(
          child: InteractionButton(
            icon: Icons.remove_red_eye_outlined,
            count: article.viewCount,
          ),
        ),
      ],
    );
  }
}
