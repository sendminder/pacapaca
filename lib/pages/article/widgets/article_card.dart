import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/widgets/shared/user_avatar.dart';
import 'package:pacapaca/widgets/shared/tag_list.dart';
import 'package:pacapaca/widgets/shared/interaction_button.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';

class ArticleCard extends StatelessWidget {
  final ArticleDTO article;
  final Future<void> Function(int articleId) onToggleLike;

  const ArticleCard({
    super.key,
    required this.article,
    required this.onToggleLike,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary.withAlpha(20),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => context.push('/articles/${article.id}'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              if (article.title.isNotEmpty ?? false) ...[
                const SizedBox(height: 16),
                _buildTitle(context),
              ],
              if (article.thumbnailUrl != null) ...[
                const SizedBox(height: 12),
                _buildThumbnail(),
              ],
              const SizedBox(height: 6),
              _buildContent(context),
              const SizedBox(height: 16),
              _buildInteractions(context),
              if (article.tags != null && article.tags!.isNotEmpty) ...[
                const SizedBox(height: 12),
                TagList(tags: article.tags!),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        UserAvatar(
          imageUrl: article.displayUser.profileImageUrl ?? '',
          profileType: article.displayUser.profileType,
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
                          .withOpacity(0.7),
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInteractions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          // 1/3 차지
          child: InteractionButton(
            icon: article.isLiked ? Icons.favorite : Icons.favorite_border,
            count: article.likeCount,
            color:
                article.isLiked ? Theme.of(context).colorScheme.primary : null,
            onTap: () async {
              try {
                await onToggleLike(article.id);
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text('article.error'.tr(args: [e.toString()]))),
                  );
                }
              }
            },
          ),
        ),
        Expanded(
          // 1/3 차지
          child: InteractionButton(
            icon: Icons.chat_bubble_outline,
            count: article.commentCount,
          ),
        ),
        Expanded(
          // 1/3 차지
          child: InteractionButton(
            icon: Icons.remove_red_eye_outlined,
            count: article.viewCount,
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      article.title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildThumbnail() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        article.thumbnailUrl!,
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Text(
      article.content,
      style: TextStyle(
        fontSize: 15,
        color: Theme.of(context).colorScheme.onSurface,
        height: 1.4,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
