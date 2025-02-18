import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/widgets/shared/chat/chat_input.dart';

class ArticleAiHelperPage extends ConsumerStatefulWidget {
  const ArticleAiHelperPage({super.key});

  @override
  ConsumerState<ArticleAiHelperPage> createState() =>
      _ArticleAiHelperPageState();
}

class _ArticleAiHelperPageState extends ConsumerState<ArticleAiHelperPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _chatHistory = [];
  String? _draftTitle;
  String? _draftContent;
  bool _isLoading = false;
  final FocusNode _focusNode = FocusNode();
  bool _canSend = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _messageController.addListener(_updateCanSend);
    _focusNode.addListener(_onFocusChange);
    // 시작할 때 자동으로 첫 메시지 표시
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _chatHistory.add({
          'assistant':
              '안녕하세요! 저는 파카예요 🦙\n\n어떤 주제의 고민이 있으신가요? 제가 이야기를 들어드리고 글로 정리해드릴게요!'
        });
      });
    });
  }

  void _updateCanSend() {
    final canSend = _messageController.text.isNotEmpty;
    if (canSend != _canSend) {
      setState(() {
        _canSend = canSend;
      });
    }
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      // 키보드가 올라올 때 스크롤을 아래로 이동
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  Future<void> _sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    _messageController.clear();

    setState(() {
      _chatHistory.add({'user': message});
      _isLoading = true;
    });

    // 새 메시지가 추가된 후 스크롤을 부드럽게 아래로 이동
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });

    try {
      // TODO: 서버 통신 구현
      await Future.delayed(const Duration(seconds: 1));

      if (!mounted) return;

      if (_chatHistory.length >= 9) {
        // 사용자 메시지 포함 총 10개가 되면
        setState(() {
          _isLoading = false;
        });

        // 임시 초안 데이터
        final draftTitle = "고민 상담 결과";
        final draftContent = _chatHistory
            .map((msg) => msg['user'] ?? msg['assistant'])
            .join('\n\n');

        _showDraftPreview(draftTitle, draftContent);
      } else {
        setState(() {
          String response;
          if (_chatHistory.length >= 7) {
            response = "이제 충분한 이야기를 나눈 것 같아요. 한 번 더 이야기를 나누면 글로 정리해드릴게요!";
          } else {
            response = "네, 자세히 말씀해 주세요. 어떤 상황이신가요?";
          }
          _chatHistory.add({'assistant': response});
          _isLoading = false;
        });

        // 응답 메시지가 추가된 후 다시 스크롤을 아래로 이동
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('error.common'.tr())),
      );
    }
  }

  void _showDraftPreview(String title, String content) {
    setState(() {
      _draftTitle = title;
      _draftContent = content;
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: DraftPreviewBottomSheet(
          title: title,
          content: content,
          onPost: () {
            // TODO: 포스팅 구현
            context.pop(); // 바텀시트 닫기
            context.pop(); // AI 헬퍼 페이지 닫기
          },
          onEdit: () async {
            // 먼저 바텀시트를 닫고
            context.pop();
            // 그 다음 AI 헬퍼 페이지를 새 페이지로 교체
            if (context.mounted) {
              context.pushReplacement('/articles/new', extra: <String, String>{
                'title': title,
                'content': content,
              });
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/profiles/pacapee.jpeg',
                  width: 40,
                  height: 40,
                ),
              ),
              const SizedBox(width: 8),
              Text('파카와 대화하기'.tr()),
            ],
          ),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => context.pop(),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(bottom: 100),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withAlpha(30),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  itemCount: _chatHistory.length + (_isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == _chatHistory.length && _isLoading) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/profiles/pacapee.jpeg',
                                  width: 35,
                                  height: 35,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ChatBubble(
                                    message: '생각하고 있어요...',
                                    isUser: false,
                                    isLoading: true,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 40),
                          ],
                        ),
                      );
                    }

                    final message = _chatHistory[index];
                    final isUser = message.containsKey('user');
                    final isFirstMessage = index == 0;
                    final isLastMessage = index == _chatHistory.length - 1;

                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: isLastMessage ? 16.0 : 12.0,
                        top: isFirstMessage ? 8.0 : 0.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: isUser
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          if (!isUser) ...[
                            Container(
                              margin: const EdgeInsets.only(right: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/profiles/pacapee.jpeg',
                                  width: 35,
                                  height: 35,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ChatBubble(
                                    message: message[
                                            isUser ? 'user' : 'assistant'] ??
                                        '',
                                    isUser: isUser,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 40),
                          ] else ...[
                            const SizedBox(width: 50),
                            Flexible(
                              child: ChatBubble(
                                message:
                                    message[isUser ? 'user' : 'assistant'] ??
                                        '',
                                isUser: isUser,
                              ),
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomSheet: ChatInput(
          controller: _messageController,
          focusNode: _focusNode,
          onSubmit: _sendMessage,
          hintText: '파카에게 고민을 이야기해보세요'.tr(),
          canSend: _canSend,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _focusNode.removeListener(_onFocusChange);
    _messageController.removeListener(_updateCanSend);
    _messageController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;
  final bool isLoading;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isUser,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isUser
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.8),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
          bottomLeft: Radius.circular(isUser ? 20 : 4),
          bottomRight: Radius.circular(isUser ? 4 : 20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              message,
              style: TextStyle(
                color: isUser
                    ? Colors.white
                    : Theme.of(context).colorScheme.onSecondaryContainer,
                fontSize: 15,
              ),
            ),
          ),
          if (isLoading) ...[
            const SizedBox(width: 8),
            SizedBox(
              width: 12,
              height: 12,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class DraftPreviewBottomSheet extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onPost;
  final VoidCallback onEdit;

  const DraftPreviewBottomSheet({
    super.key,
    required this.title,
    required this.content,
    required this.onPost,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/profiles/pacapee.jpeg',
                  width: 30,
                  height: 30,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '파카가 정리한 글'.tr(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          Text(content),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onEdit,
                  child: Text('수정하기'.tr()),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: onPost,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('이대로 올리기'.tr()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
