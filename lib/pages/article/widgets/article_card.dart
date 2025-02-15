import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/widgets/shared/user_avatar.dart';
import 'package:pacapaca/widgets/shared/tag_list.dart';
import 'package:pacapaca/widgets/shared/interaction_button.dart';
import 'package:go_router/go_router.dart';

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
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
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
              if (article.title?.isNotEmpty ?? false) ...[
                const SizedBox(height: 16),
                _buildTitle(),
              ],
              if (article.thumbnailUrl != null) ...[
                const SizedBox(height: 12),
                _buildThumbnail(),
              ],
              const SizedBox(height: 12),
              _buildContent(),
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
          imageUrl: article.profileImageUrl,
          fallbackText: article.nickname,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.nickname,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                timeago.format(DateTime.parse(article.createTime),
                    locale: 'ko'),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
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
        InteractionButton(
          icon: article.isLiked ? Icons.favorite : Icons.favorite_border,
          count: article.likeCount,
          color: article.isLiked ? Theme.of(context).colorScheme.primary : null,
          onTap: () async {
            try {
              await onToggleLike(article.id);
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('좋아요 처리 중 오류가 발생했습니다: $e')),
                );
              }
            }
          },
        ),
        const SizedBox(width: 24),
        InteractionButton(
          icon: Icons.chat_bubble_outline,
          count: article.commentCount,
        ),
        const SizedBox(width: 24),
        InteractionButton(
          icon: Icons.remove_red_eye_outlined,
          count: article.viewCount,
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      article.title!,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
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

  Widget _buildContent() {
    return Text(
      article.content,
      style: TextStyle(
        fontSize: 15,
        color: Colors.grey[800],
        height: 1.4,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
