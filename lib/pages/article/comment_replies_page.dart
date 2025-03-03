import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:pacapaca/providers/comment_reply_provider.dart';
import 'package:pacapaca/widgets/shared/rotating_paca_loader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/widgets/shared/chat/chat_input.dart';
import 'package:pacapaca/providers/comment_provider.dart';
import 'package:pacapaca/widgets/shared/comment_item.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pacapaca/widgets/page_title.dart';

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
  final logger = GetIt.instance<Logger>();

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
    final sortBy = ref.watch(commentSortProvider);
    final repliesAsync = ref.watch(
        commentReplyListProvider(sortBy, widget.articleId, widget.commentId));
    final currentUser = ref.watch(authProvider).value;
    final parentCommentAsync = ref.watch(commentListProvider(widget.articleId));

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: PageTitle(
        title: 'comment.replies'.tr(),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(commentReplyListProvider(
                sortBy, widget.articleId, widget.commentId));
            return Future.delayed(const Duration(milliseconds: 1000));
          },
          child: Column(
            children: [
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo.metrics.pixels >=
                        scrollInfo.metrics.maxScrollExtent * 0.8) {
                      ref
                          .read(commentReplyListProvider(
                                  sortBy, widget.articleId, widget.commentId)
                              .notifier)
                          .loadMore(sortBy, widget.articleId, widget.commentId);
                    }
                    return false;
                  },
                  child: CustomScrollView(
                    slivers: [
                      // 원본 댓글 표시
                      SliverToBoxAdapter(
                        child: parentCommentAsync.when(
                          data: (comments) {
                            final parentComment = comments?.firstWhere(
                              (comment) => comment.id == widget.commentId,
                            );
                            if (parentComment == null) return SizedBox.shrink();

                            return Container(
                              padding: const EdgeInsets.only(
                                left: 12,
                                right: 12,
                                top: 12,
                                bottom: 12,
                              ),
                              color: Theme.of(context).colorScheme.surface,
                              child: CommentItem(
                                comment: parentComment,
                                isCurrentUser:
                                    parentComment.userId == currentUser?.id,
                                isWriter: widget.articleUserId ==
                                    parentComment.userId,
                                onDelete: (commentId) {
                                  ref
                                      .read(commentReplyListProvider(
                                              sortBy,
                                              widget.articleId,
                                              widget.commentId)
                                          .notifier)
                                      .delete(widget.articleId, commentId);
                                },
                                onUpdate: (commentId, content) {},
                                onReply: (commentId) {
                                  FocusScope.of(context)
                                      .requestFocus(_focusNode);
                                },
                                onToggleLike: (commentId) {
                                  ref
                                      .read(commentReplyListProvider(
                                              sortBy,
                                              widget.articleId,
                                              widget.commentId)
                                          .notifier)
                                      .toggleLike(commentId);
                                },
                              ),
                            );
                          },
                          error: (_, __) => const SizedBox.shrink(),
                          loading: () =>
                              const Center(child: RotatingPacaLoader()),
                        ),
                      ),
                      // 구분선
                      SliverToBoxAdapter(
                        child: Divider(
                          height: 1,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(20),
                        ),
                      ),
                      // 정렬 드롭다운 추가
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              repliesAsync.when(
                                data: (replies) => replies != null &&
                                        replies.isNotEmpty
                                    ? PopupMenuButton<String>(
                                        child: Row(
                                          children: [
                                            if (sortBy == 'latest')
                                              Text('article.sort.latest'.tr()),
                                            if (sortBy == 'oldest')
                                              Text('article.sort.oldest'.tr()),
                                            const Icon(Icons.arrow_drop_down),
                                          ],
                                        ),
                                        itemBuilder: (context) => [
                                          PopupMenuItem(
                                            value: 'latest',
                                            child: Text(
                                                'article.sort.latest'.tr()),
                                          ),
                                          PopupMenuItem(
                                            value: 'oldest',
                                            child: Text(
                                                'article.sort.oldest'.tr()),
                                          ),
                                        ],
                                        onSelected: (value) {
                                          ref
                                              .read(
                                                  commentSortProvider.notifier)
                                              .setSort(value);
                                          ref.invalidate(
                                              commentReplyListProvider(
                                            value,
                                            widget.articleId,
                                            widget.commentId,
                                          ));
                                        },
                                      )
                                    : const SizedBox.shrink(),
                                error: (_, __) => const SizedBox.shrink(),
                                loading: () => const SizedBox.shrink(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // 답글 목록
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
                            padding: const EdgeInsets.only(left: 24, right: 12),
                            sliver: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  if (index == replies.length) {
                                    return const SizedBox(height: 70); // 입력창 여백
                                  }
                                  final reply = replies[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: CommentItem(
                                      comment: reply,
                                      isCurrentUser:
                                          reply.userId == currentUser?.id,
                                      isWriter:
                                          widget.articleUserId == reply.userId,
                                      isReply: true,
                                      onDelete: (commentId) {},
                                      onUpdate: (commentId, content) {},
                                      onReply: (commentId) {},
                                      onToggleLike: (commentId) {
                                        ref
                                            .read(commentReplyListProvider(
                                                    sortBy,
                                                    widget.articleId,
                                                    widget.commentId)
                                                .notifier)
                                            .toggleLike(commentId);
                                      },
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
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
      bottomSheet: currentUser != null
          ? ChatInput(
              controller: _commentController,
              focusNode: _focusNode,
              onSubmit: (content) async {
                await ref
                    .read(commentReplyListProvider(
                            sortBy, widget.articleId, widget.commentId)
                        .notifier)
                    .addComment(
                        sortBy, widget.articleId, widget.commentId, content);

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
