import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/widgets/shared/chat/chat_input.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/models/enums/article_category.dart';
import 'package:pacapaca/providers/paca_helper_provider.dart';
import 'package:pacapaca/models/dto/paca_helper.dart';
import 'package:pacapaca/pages/article/widgets/chat_bubble.dart';
import 'package:pacapaca/pages/article/widgets/draft_preview_bottom_sheet.dart';
import 'package:pacapaca/pages/article/widgets/ai_helper_app_bar.dart';
import 'package:pacapaca/providers/settings_provider.dart';

class ArticleAiHelperPage extends ConsumerStatefulWidget {
  const ArticleAiHelperPage({super.key});

  @override
  ConsumerState<ArticleAiHelperPage> createState() =>
      _ArticleAiHelperPageState();
}

class _ArticleAiHelperPageState extends ConsumerState<ArticleAiHelperPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _chatHistory = [];
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  bool _isLoading = false;
  bool _canSend = false;

  @override
  void initState() {
    super.initState();
    _setupListeners();
    _showInitialMessage();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const AiHelperAppBar(),
        body: _buildChatBody(),
        bottomSheet: ChatInput(
          controller: _messageController,
          focusNode: _focusNode,
          onSubmit: _sendMessage,
          hintText: 'helper.hint'.tr(),
          canSend: _canSend,
        ),
      ),
    );
  }

  void _setupListeners() {
    _messageController.addListener(_updateCanSend);
    _focusNode.addListener(_onFocusChange);
  }

  void _showInitialMessage() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _chatHistory.add({'assistant': 'helper.first_message'.tr()});
      });
    });
  }

  void _updateCanSend() {
    final canSend = _messageController.text.isNotEmpty;
    if (canSend != _canSend) {
      setState(() => _canSend = canSend);
    }
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
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

  Future<void> _sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    _messageController.clear();
    _addMessageToChat('user', message);

    try {
      final response = await _getAiResponse();
      if (!mounted) return;

      if (response?.done == true) {
        _handleCompletedDraft(response!);
      } else {
        _handleContinuedConversation(response);
      }
    } catch (e) {
      _handleError();
    }
  }

  void _addMessageToChat(String role, String content) {
    setState(() {
      _chatHistory.add({role: content});
      _isLoading = true;
    });
    _scrollToBottom();
  }

  Future<ResponseDefineProblems?> _getAiResponse() async {
    final messages = _chatHistory.map((msg) {
      final role = msg.containsKey('user') ? 'user' : 'assistant';
      return Message(role: role, content: msg[role] ?? '');
    }).toList();

    return await ref.read(pacaHelperProvider.notifier).defineProblems(
          messages: messages,
        );
  }

  void _handleCompletedDraft(ResponseDefineProblems response) {
    setState(() => _isLoading = false);
    _showDraftPreview(
      response.title ?? 'helper.title'.tr(),
      response.category ?? ArticleCategory.daily.name,
      response.answer,
    );
  }

  void _handleContinuedConversation(ResponseDefineProblems? response) {
    setState(() {
      _chatHistory.add({'assistant': response?.answer ?? 'error.common'.tr()});
      _isLoading = false;
    });
    _scrollToBottom();
  }

  void _handleError() {
    if (!mounted) return;
    setState(() => _isLoading = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('error.common'.tr())),
    );
  }

  void _showDraftPreview(String title, String category, String content) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraftPreviewBottomSheet(
        title: title,
        content: content,
        onPost: () => _handlePostDraft(title, category, content),
        onEdit: () => _handleEditDraft(title, category, content),
      ),
    );
  }

  Future<void> _handlePostDraft(
    String title,
    String category,
    String content,
  ) async {
    try {
      final request = RequestCreateArticle(
        title: title,
        content: content,
        category: category,
      );

      await ref.read(articleEditorProvider.notifier).createArticle(request);

      if (mounted) {
        context.pop(); // 바텀시트 닫기
        context.pop(); // AI 헬퍼 페이지 닫기
        ref.invalidate(articleListProvider);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('article.error'.tr(args: [e.toString()]))),
        );
      }
    }
  }

  void _handleEditDraft(String title, String category, String content) {
    context.pop();
    if (mounted) {
      ref
          .read(articleCategoryProvider.notifier)
          .setCategory(ArticleCategory.values.byName(category));
      context.pushReplacement('/articles/new', extra: <String, String>{
        'title': title,
        'category': category,
        'content': content,
      });
    }
  }

  Widget _buildChatBody() {
    return Container(
      padding: const EdgeInsets.only(bottom: 100),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withAlpha(30),
      ),
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(16),
        itemCount: _chatHistory.length + (_isLoading ? 1 : 0),
        itemBuilder: _buildChatItem,
      ),
    );
  }

  Widget _buildChatItem(BuildContext context, int index) {
    if (index == _chatHistory.length && _isLoading) {
      return _buildLoadingMessage();
    }

    final message = _chatHistory[index];
    final isUser = message.containsKey('user');
    final isFirstMessage = index == 0;
    final isLastMessage = index == _chatHistory.length - 1;

    return ChatMessageItem(
      message: message,
      isUser: isUser,
      isFirst: isFirstMessage,
      isLast: isLastMessage,
    );
  }

  Widget _buildLoadingMessage() {
    return const ChatMessageItem(
      message: {'assistant': 'helper.thinking'},
      isUser: false,
      isLoading: true,
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
