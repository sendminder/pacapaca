import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/pages/article/widgets/article_form.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/models/enums/article_category.dart';

class ArticleEditPage extends ConsumerStatefulWidget {
  final int articleId;

  const ArticleEditPage({
    super.key,
    required this.articleId,
  });

  @override
  ConsumerState<ArticleEditPage> createState() => _ArticleEditPageState();
}

class _ArticleEditPageState extends ConsumerState<ArticleEditPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  bool _isLoading = false;
  ArticleCategory _category = ArticleCategory.daily;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    // 데이터는 didChangeDependencies에서 로드
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      _loadArticleData();
      _isInitialized = true;
    }
  }

  Future<void> _loadArticleData() async {
    try {
      final article = await ref.read(articleProvider(widget.articleId).future);
      if (article != null && mounted) {
        setState(() {
          _titleController.text = article.title;
          _contentController.text = article.content;
          // replyPacappi와 replyPacappu는 ArticleDTO에 없으므로 기본값 사용
          _category = ArticleCategory.values.firstWhere(
            (e) => e.name == article.category,
            orElse: () => ArticleCategory.daily,
          );
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('article.load_error'.tr(args: [e.toString()]))),
        );
        context.pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(authProvider).value;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: TextButton(
          onPressed: () => context.pop(),
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.onSurface,
          ),
          child: Text(
            'article.cancel'.tr(),
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        leadingWidth: 80,
        title: Text(
          'article.edit_article'.tr(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: _updateArticle,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              elevation: 1,
              disabledBackgroundColor:
                  Theme.of(context).colorScheme.primary.withOpacity(0.6),
              disabledForegroundColor: Colors.white70,
            ),
            child: _isLoading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    'article.edit'.tr(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SafeArea(
        child: ArticleForm(
          titleController: _titleController,
          contentController: _contentController,
          nickname:
              currentUser?.displayUser.nickname ?? 'article.unknown_user'.tr(),
          selectedCategory: _category,
          onCategoryChanged: (category) {
            setState(() => _category = category);
          },
          isEditMode: true,
        ),
      ),
    );
  }

  Future<void> _updateArticle() async {
    if (_titleController.text.isEmpty || _contentController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('article.title_and_content_required'.tr())),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final request = RequestUpdateArticle(
        title: _titleController.text,
        content: _contentController.text,
        category: _category.name,
      );

      // ArticleEditor의 updateArticle 메서드 사용
      await ref.read(articleEditorProvider.notifier).updateArticle(
            widget.articleId,
            request,
          );

      if (mounted) {
        // 게시글 상세 페이지 데이터 무효화
        ref.invalidate(articleProvider(widget.articleId));

        // 목록 페이지로 이동
        context.pop();

        // 성공 메시지 표시
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('article.update_success'.tr())),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('article.error'.tr(args: [e.toString()]))),
        );
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
