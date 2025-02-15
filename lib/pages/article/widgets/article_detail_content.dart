import 'package:flutter/material.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/widgets/shared/user_avatar.dart';
import 'package:pacapaca/widgets/shared/tag_list.dart';
import 'package:pacapaca/widgets/shared/interaction_button.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleDetailContent extends StatelessWidget {
  final ArticleDTO article;
  final Future<void> Function(int articleId) onToggleLike;

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
          Row(
            children: [
              UserAvatar(
                imageUrl: article.profileImageUrl,
                fallbackText: article.nickname,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.nickname,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      timeago.format(
                        DateTime.parse(article.createTime),
                        locale: 'ko',
                      ),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            article.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          if (article.imageUrl != null && article.imageUrl!.isNotEmpty) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                article.imageUrl!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
          ],
          Text(
            article.content,
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 16),
          if (article.tags != null && article.tags!.isNotEmpty) ...[
            TagList(tags: article.tags!),
            const SizedBox(height: 16),
          ],
          Row(
            children: [
              InteractionButton(
                icon: article.isLiked ? Icons.favorite : Icons.favorite_border,
                count: article.likeCount,
                color: article.isLiked
                    ? Theme.of(context).colorScheme.primary
                    : null,
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
                icon: Icons.comment,
                count: article.commentCount,
              ),
              const SizedBox(width: 24),
              InteractionButton(
                icon: Icons.remove_red_eye,
                count: article.viewCount,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
