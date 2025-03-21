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
import 'package:pacapaca/models/dto/comment_dto.dart';
import 'package:pacapaca/models/dto/user_dto.dart';

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
  final _logger = GetIt.instance<Logger>();

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

  void _refreshComments(String sortBy) {
    ref.invalidate(
        commentReplyListProvider(sortBy, widget.articleId, widget.commentId));
  }

  void _loadMoreComments(String sortBy) {
    ref
        .read(
            commentReplyListProvider(sortBy, widget.articleId, widget.commentId)
                .notifier)
        .loadMore(sortBy, widget.articleId, widget.commentId);
  }

  void _toggleLike(String sortBy, int commentId) async {
    final response = await ref
        .read(
            commentReplyListProvider(sortBy, widget.articleId, widget.commentId)
                .notifier)
        .toggleLike(commentId);

    if (response != null) {
      ref
          .read(commentListProvider(widget.articleId).notifier)
          .updateToggleLike(commentId, response.isLiked, response.likeCount);
    }
  }

  void _toggleParentCommentLike(int commentId) {
    ref
        .read(commentListProvider(widget.articleId).notifier)
        .toggleLike(commentId);
  }

  Future<void> _deleteComment(String sortBy, int commentId) async {
    await ref
        .read(
            commentReplyListProvider(sortBy, widget.articleId, widget.commentId)
                .notifier)
        .delete(widget.articleId, commentId);
  }

  Future<void> _addComment(String sortBy, String content) async {
    try {
      await ref
          .read(commentReplyListProvider(
                  sortBy, widget.articleId, widget.commentId)
              .notifier)
          .addComment(sortBy, widget.articleId, widget.commentId, content);

      _commentController.clear();
      _focusNode.unfocus();
    } catch (e) {
      _logger.e('댓글 추가 실패: $e');
      // 에러 처리 (예: 스낵바 표시)
    }
  }

  void _updateSortOrder(String value) {
    ref.read(commentSortProvider.notifier).setSort(value);
    _refreshComments(value);
  }

  @override
  Widget build(BuildContext context) {
    final sortBy = ref.watch(commentSortProvider);
    final repliesAsync = ref.watch(
        commentReplyListProvider(sortBy, widget.articleId, widget.commentId));
    final currentUser = ref.watch(authProvider).value;
    final parentCommentAsync = ref.watch(commentListProvider(widget.articleId));

    // 두 비동기 상태를 결합하여 하나의 로딩 상태로 처리
    final isLoading =
        parentCommentAsync is AsyncLoading || repliesAsync is AsyncLoading;

    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: PageTitle(
          title: 'comment.replies'.tr(),
        ),
        body: isLoading
            ? const Center(child: RotatingPacaLoader())
            : RefreshIndicator(
                onRefresh: () async {
                  _refreshComments(sortBy);
                  return Future.delayed(const Duration(milliseconds: 1000));
                },
                child: Column(
                  children: [
                    Expanded(
                      child: _buildCommentList(
                        context,
                        sortBy,
                        repliesAsync,
                        parentCommentAsync,
                        currentUser,
                      ),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
        bottomSheet: currentUser != null
            ? ChatInput(
                controller: _commentController,
                focusNode: _focusNode,
                onSubmit: (content) => _addComment(sortBy, content),
                hintText: 'comment.write_reply'.tr(),
                canSend: _canSend,
              )
            : null,
      ),
    );
  }

  Widget _buildCommentList(
    BuildContext context,
    String sortBy,
    AsyncValue<List<ArticleCommentDTO>?> repliesAsync,
    AsyncValue<List<ArticleCommentDTO>?> parentCommentAsync,
    UserDTO? currentUser,
  ) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels >=
            scrollInfo.metrics.maxScrollExtent * 0.8) {
          _loadMoreComments(sortBy);
        }
        return false;
      },
      child: CustomScrollView(
        slivers: [
          _buildParentComment(context, sortBy, parentCommentAsync, currentUser),
          _buildDivider(context),
          _buildSortDropdown(context, sortBy, repliesAsync),
          _buildRepliesList(context, sortBy, repliesAsync, currentUser),
        ],
      ),
    );
  }

  Widget _buildParentComment(
    BuildContext context,
    String sortBy,
    AsyncValue<List<ArticleCommentDTO>?> parentCommentAsync,
    UserDTO? currentUser,
  ) {
    return SliverToBoxAdapter(
      child: parentCommentAsync.when(
        data: (comments) {
          if (comments == null) return const SizedBox.shrink();

          final parentCommentList = comments
              .where(
                (comment) => comment.id == widget.commentId,
              )
              .toList();

          if (parentCommentList.isEmpty) return const SizedBox.shrink();

          final parentComment = parentCommentList.first;

          return Container(
            padding: const EdgeInsets.all(12),
            color: Theme.of(context).colorScheme.surface,
            child: CommentItem(
              comment: parentComment,
              isCurrentUser: parentComment.userId == currentUser?.id,
              isWriter: widget.articleUserId == parentComment.userId,
              onDelete: (commentId) {
                _deleteComment(sortBy, commentId);
              },
              onUpdate: (commentId, commentContent) => {
                _updateParentComment(sortBy, commentId, commentContent),
              },
              onReply: (commentId) {
                FocusScope.of(context).requestFocus(_focusNode);
              },
              onToggleLike: (commentId) => _toggleParentCommentLike(commentId),
            ),
          );
        },
        error: (error, stackTrace) {
          _logger.e('부모 댓글 로딩 오류: $error\n$stackTrace');
          return const SizedBox.shrink();
        },
        loading: () => const Center(child: RotatingPacaLoader()),
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return SliverToBoxAdapter(
      child: Divider(
        height: 1,
        color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
      ),
    );
  }

  Widget _buildSortDropdown(
    BuildContext context,
    String sortBy,
    AsyncValue<List<ArticleCommentDTO>?> repliesAsync,
  ) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            repliesAsync.when(
              data: (replies) => replies != null && replies.isNotEmpty
                  ? _buildSortButton(context, sortBy)
                  : const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
              loading: () => const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSortButton(BuildContext context, String sortBy) {
    return PopupMenuButton<String>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'latest',
          child: Text('article.sort.latest'.tr()),
        ),
        PopupMenuItem(
          value: 'oldest',
          child: Text('article.sort.oldest'.tr()),
        ),
      ],
      onSelected: _updateSortOrder,
      child: Row(
        children: [
          Text(sortBy == 'latest'
              ? 'article.sort.latest'.tr()
              : 'article.sort.oldest'.tr()),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }

  Widget _buildRepliesList(
    BuildContext context,
    String sortBy,
    AsyncValue<List<ArticleCommentDTO>?> repliesAsync,
    UserDTO? currentUser,
  ) {
    return repliesAsync.when(
      data: (replies) {
        if (replies == null || replies.isEmpty) {
          return SliverFillRemaining(
            child: Center(
              child: Text('comment.no_replies'.tr()),
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
                return _buildReplyItem(context, sortBy, reply, currentUser);
              },
              childCount: replies.length + 1,
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        _logger.e('답글 목록 로딩 오류: $error\n$stackTrace');
        return SliverFillRemaining(
          child: Center(
            child: Text('error.generic'.tr()),
          ),
        );
      },
      loading: () => const SliverFillRemaining(
        child: Center(
          child: RotatingPacaLoader(),
        ),
      ),
    );
  }

  Widget _buildReplyItem(
    BuildContext context,
    String sortBy,
    ArticleCommentDTO reply,
    UserDTO? currentUser,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: CommentItem(
        comment: reply,
        isCurrentUser: reply.userId == currentUser?.id,
        isWriter: widget.articleUserId == reply.userId,
        isReply: true,
        onDelete: (commentId) {
          _deleteComment(sortBy, commentId);
        },
        onUpdate: (commentId, commentContent) => {
          _updateComment(sortBy, commentId, commentContent),
        },
        onReply: (commentId) {
          FocusScope.of(context).requestFocus(_focusNode);
        },
        onToggleLike: (commentId) => _toggleLike(sortBy, commentId),
      ),
    );
  }

  Future<void> _updateComment(
      String sortBy, int commentId, String commentContent) async {
    _logger.i('updateComment: $sortBy, $commentId, $commentContent');
    await ref
        .read(
            commentReplyListProvider(sortBy, widget.articleId, widget.commentId)
                .notifier)
        .updateComment(widget.articleId, commentId, commentContent);
  }

  Future<void> _updateParentComment(
      String sortBy, int commentId, String commentContent) async {
    await ref
        .read(commentListProvider(widget.articleId).notifier)
        .updateComment(widget.articleId, commentId, commentContent);
  }
}
