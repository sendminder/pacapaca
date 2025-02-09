import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:pacapaca/models/dto/article_dto.dart';

class ArticleDetailPage extends ConsumerWidget {
  final int articleId;

  const ArticleDetailPage({
    super.key,
    required this.articleId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleAsync = ref.watch(articleProvider(articleId));
    final commentsAsync = ref.watch(articleCommentsProvider(articleId));
    final currentUser = ref.watch(authProvider).value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글'),
        actions: [
          articleAsync.when(
            data: (article) {
              if (article?.userId == currentUser?.id) {
                return PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: const Text('수정'),
                      onTap: () => context.push('/articles/$articleId/edit'),
                    ),
                    PopupMenuItem(
                      child: const Text(
                        '삭제',
                        style: TextStyle(color: Colors.red),
                      ),
                      onTap: () async {
                        final confirmed = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('게시글 삭제'),
                            content: const Text('정말 삭제하시겠습니까?'),
                            actions: [
                              TextButton(
                                onPressed: () => context.pop(false),
                                child: const Text('취소'),
                              ),
                              TextButton(
                                onPressed: () => context.pop(true),
                                child: const Text(
                                  '삭제',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );

                        if (confirmed == true) {
                          await ref
                              .read(articleEditorProvider.notifier)
                              .deleteArticle(articleId);
                          if (context.mounted) {
                            context.pop();
                          }
                        }
                      },
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
            error: (error, stackTrace) => Center(
              child: Text('에러가 발생했습니다: $error'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(articleProvider);
          ref.invalidate(articleCommentsProvider);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 게시글 내용
              articleAsync.when(
                data: (article) {
                  if (article == null) {
                    return const Center(
                      child: Text('게시글을 찾을 수 없습니다.'),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 작성자 정보
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  article.profileImageUrl.isNotEmpty
                                      ? NetworkImage(article.profileImageUrl)
                                      : null,
                              child: article.profileImageUrl.isEmpty
                                  ? Text(article.nickname[0])
                                  : null,
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
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // 이미지
                        if (article.imageUrl != null &&
                            article.imageUrl!.isNotEmpty) ...[
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
                        // 내용
                        Text(article.content),
                        const SizedBox(height: 16),
                        // 태그
                        if (article.tags != null &&
                            article.tags!.isNotEmpty) ...[
                          Wrap(
                            spacing: 4,
                            children: article.tags!.map((tag) {
                              return Chip(
                                label: Text(tag),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                visualDensity: VisualDensity.compact,
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 16),
                        ],
                        // 통계
                        Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              size: 16,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 4),
                            Text('${article.likeCount}'),
                            const SizedBox(width: 16),
                            Icon(
                              Icons.comment,
                              size: 16,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(width: 4),
                            Text('${article.commentCount}'),
                            const SizedBox(width: 16),
                            Icon(
                              Icons.remove_red_eye,
                              size: 16,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text('${article.viewCount}'),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Text('에러가 발생했습니다: $error'),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              // 댓글 목록
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '댓글',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // 댓글 입력
                    if (currentUser != null) ...[
                      CommentInput(articleId: articleId),
                      const SizedBox(height: 16),
                    ],
                    // 댓글 목록
                    commentsAsync.when(
                      data: (comments) {
                        if (comments == null || comments.isEmpty) {
                          return const Center(
                            child: Text('댓글이 없습니다.'),
                          );
                        }

                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: comments.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 16),
                          itemBuilder: (context, index) {
                            final comment = comments[index];
                            return CommentItem(
                              comment: comment,
                              articleId: articleId,
                              isOwner: comment.userId == currentUser?.id,
                            );
                          },
                        );
                      },
                      error: (error, stackTrace) => Center(
                        child: Text('댓글을 불러오는데 실패했습니다: $error'),
                      ),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommentInput extends ConsumerStatefulWidget {
  final int articleId;

  const CommentInput({
    super.key,
    required this.articleId,
  });

  @override
  ConsumerState<CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends ConsumerState<CommentInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: '댓글을 입력하세요',
              border: OutlineInputBorder(),
            ),
            maxLines: null,
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () async {
            final content = _controller.text.trim();
            if (content.isEmpty) return;

            await ref
                .read(articleCommentsProvider(widget.articleId).notifier)
                .addComment(content);
            _controller.clear();
          },
        ),
      ],
    );
  }
}

class CommentItem extends ConsumerWidget {
  final int articleId;
  final ArticleCommentDTO comment;
  final bool isOwner;

  const CommentItem({
    super.key,
    required this.articleId,
    required this.comment,
    required this.isOwner,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: comment.profileImageUrl.isNotEmpty
              ? NetworkImage(comment.profileImageUrl)
              : null,
          child: comment.profileImageUrl.isEmpty
              ? Text(comment.nickname[0])
              : null,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    comment.nickname,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    timeago.format(
                      DateTime.parse(comment.createTime),
                      locale: 'ko',
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  if (isOwner) ...[
                    const Spacer(),
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: const Text('수정'),
                          onTap: () async {
                            final content = await showDialog<String>(
                              context: context,
                              builder: (context) => CommentEditDialog(
                                initialContent: comment.content,
                              ),
                            );
                            if (content != null) {
                              await ref
                                  .read(articleCommentsProvider(articleId)
                                      .notifier)
                                  .updateComment(comment.id, content);
                            }
                          },
                        ),
                        PopupMenuItem(
                          child: const Text(
                            '삭제',
                            style: TextStyle(color: Colors.red),
                          ),
                          onTap: () async {
                            final confirmed = await showDialog<bool>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('댓글 삭제'),
                                content: const Text('정말 삭제하시겠습니까?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => context.pop(false),
                                    child: const Text('취소'),
                                  ),
                                  TextButton(
                                    onPressed: () => context.pop(true),
                                    child: const Text(
                                      '삭제',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            );

                            if (confirmed == true) {
                              await ref
                                  .read(articleCommentsProvider(articleId)
                                      .notifier)
                                  .deleteComment(comment.id);
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 4),
              Text(comment.content),
            ],
          ),
        ),
      ],
    );
  }
}

class CommentEditDialog extends StatefulWidget {
  final String initialContent;

  const CommentEditDialog({
    super.key,
    required this.initialContent,
  });

  @override
  State<CommentEditDialog> createState() => _CommentEditDialogState();
}

class _CommentEditDialogState extends State<CommentEditDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialContent);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('댓글 수정'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(
          hintText: '댓글을 입력하세요',
          border: OutlineInputBorder(),
        ),
        maxLines: null,
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('취소'),
        ),
        TextButton(
          onPressed: () {
            final content = _controller.text.trim();
            if (content.isNotEmpty) {
              context.pop(content);
            }
          },
          child: const Text('수정'),
        ),
      ],
    );
  }
}
