import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:pacapaca/providers/comment_reply_provider.dart';
import 'package:pacapaca/widgets/shared/comment/comment_list.dart';
import 'package:pacapaca/widgets/shared/rotating_paca_loader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/widgets/shared/chat/chat_input.dart';
import 'package:pacapaca/providers/comment_provider.dart';
import 'package:pacapaca/models/dto/comment_dto.dart';

class CommentRepliesPage extends ConsumerStatefulWidget {
  final int articleId;
  final int commentId;
  final int articleUserId;

  const CommentRepliesPage({
    super.key,
    required this.articleId,
    required this.commentId,
    required this.articleUserId,
  });

  @override
  ConsumerState<CommentRepliesPage> createState() => _CommentRepliesPageState();
}

class _CommentRepliesPageState extends ConsumerState<CommentRepliesPage> {
  final TextEditingController _commentController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _canSend = false;

  @override
  void initState() {
    super.initState();
    _commentController.addListener(_updateCanSend);
  }

  void _updateCanSend() {
    final canSend = _commentController.text.isNotEmpty;
    if (canSend != _canSend) {
      setState(() {
        _canSend = canSend;
      });
    }
  }

  @override
  void dispose() {
    _commentController.removeListener(_updateCanSend);
    _commentController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final repliesAsync =
        ref.watch(commentReplyListProvider(widget.articleId, widget.commentId));
    final currentUser = ref.watch(authProvider).value;
    final parentCommentAsync = ref.watch(commentListProvider(widget.articleId));

    return Scaffold(
      appBar: AppBar(
        title: Text('comment.replies'.tr()),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  // 원본 댓글 표시 (replies 숨김)
                  SliverToBoxAdapter(
                    child: parentCommentAsync.when(
                      data: (comments) {
                        final parentComment = comments?.firstWhere(
                          (comment) => comment.id == widget.commentId,
                        );
                        if (parentComment == null)
                          return const SizedBox.shrink();

                        // replies를 제거한 새로운 댓글 객체 생성
                        final commentWithoutReplies = parentComment.copyWith(
                          replies: [],
                          replyCount: 0,
                          hasMore: false,
                        );

                        return Container(
                          padding: const EdgeInsets.all(16),
                          color: Theme.of(context).colorScheme.surface,
                          child: CommentListWidget(
                            comments: [commentWithoutReplies],
                            currentUser: currentUser,
                            articleUserId: widget.articleUserId,
                            onDelete: (commentId) {},
                            onUpdate: (commentId, content) {},
                            onLoadMoreReplies: (parentId) {},
                            onReply: (parentId) {},
                          ),
                        );
                      },
                      error: (_, __) => const SizedBox.shrink(),
                      loading: () => const Center(child: RotatingPacaLoader()),
                    ),
                  ),
                  // 구분선
                  const SliverToBoxAdapter(
                    child: Divider(height: 1),
                  ),
                  // 답글 목록 (대댓글 스타일 통일)
                  repliesAsync.when(
                    data: (replies) {
                      if (replies == null || replies.isEmpty) {
                        return const SliverFillRemaining(
                          child: Center(
                            child: Text('comment.no_replies'),
                          ),
                        );
                      }

                      return SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              if (index == replies.length) {
                                return const SizedBox(height: 70); // 입력창 여백
                              }
                              return Container(
                                margin: const EdgeInsets.only(top: 16),
                                child: CommentListWidget(
                                  comments: [replies[index]],
                                  currentUser: currentUser,
                                  articleUserId: widget.articleUserId,
                                  onDelete: (commentId) {},
                                  onUpdate: (commentId, content) {},
                                  onLoadMoreReplies: (parentId) {},
                                  onReply: (parentId) {},
                                  isReplyView: true,
                                ),
                              );
                            },
                            childCount: replies.length + 1,
                          ),
                        ),
                      );
                    },
                    error: (error, _) => SliverFillRemaining(
                      child: Center(
                        child: Text('error.generic'.tr()),
                      ),
                    ),
                    loading: () => const SliverFillRemaining(
                      child: Center(
                        child: RotatingPacaLoader(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: currentUser != null
          ? ChatInput(
              controller: _commentController,
              focusNode: _focusNode,
              onSubmit: (content) async {
                await ref
                    .read(commentListProvider(widget.articleId).notifier)
                    .addComment(widget.articleId, content, widget.commentId);

                _commentController.clear();
                FocusScope.of(context).unfocus();
              },
              hintText: 'comment.write_reply'.tr(),
              canSend: _canSend,
            )
          : null,
    );
  }
}
