import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/pages/article/widgets/article_form.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/models/enums/article_category.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'package:pacapaca/services/word_filter_service.dart';
import 'package:pacapaca/widgets/shared/dialogs/confirmation_dialog.dart';

class ArticleCreatePage extends ConsumerStatefulWidget {
  final String? initialTitle;
  final String? initialContent;

  const ArticleCreatePage({
    super.key,
    this.initialTitle,
    this.initialContent,
  });

  @override
  ConsumerState<ArticleCreatePage> createState() => _ArticleCreatePageState();
}

class _ArticleCreatePageState extends ConsumerState<ArticleCreatePage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  bool _isLoading = false;
  bool _replyPacappi = false;
  bool _replyPacappu = false;

  @override
  void initState() {
    super.initState();
    // 초기값이 있으면 컨트롤러에 설정
    if (widget.initialTitle != null) {
      _titleController.text = widget.initialTitle!;
    }
    if (widget.initialContent != null) {
      _contentController.text = widget.initialContent!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(authProvider).value;
    final selectedCategory = ref.watch(articleCategoryProvider);

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
          'article.create'.tr(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => _createArticle(selectedCategory),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              elevation: 1,
              disabledBackgroundColor:
                  Theme.of(context).colorScheme.primary.withAlpha(153),
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
                    'article.register'.tr(),
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
          selectedCategory: selectedCategory == ArticleCategory.all
              ? ArticleCategory.daily
              : selectedCategory,
          onCategoryChanged: (category) {
            ref.read(articleCategoryProvider.notifier).setCategory(category);
          },
          onPacappiSelected: (selected) {
            setState(() => _replyPacappi = selected);
          },
          onPacappuSelected: (selected) {
            setState(() => _replyPacappu = selected);
          },
        ),
      ),
    );
  }

  Future<void> _createArticle(ArticleCategory selectedCategory) async {
    if (_titleController.text.isEmpty || _contentController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('article.title_and_content_required'.tr())),
      );
      return;
    }

    final titleFilter =
        WordFilterService.instance.filter(_titleController.text);
    final contentFilter =
        WordFilterService.instance.filter(_contentController.text);

    if (titleFilter.hasForbiddenWord || contentFilter.hasForbiddenWord) {
      final result = await showDialog<bool>(
        context: context,
        builder: (context) => ConfirmationDialog(
          title: 'article.forbidden_word_detected'.tr(),
          content: 'article.forbidden_word_message'.tr(),
          cancelText: 'article.cancel'.tr(),
          confirmText: 'article.confirm'.tr(),
          isDanger: true,
        ),
      );

      if (result != true) {
        return;
      }
    }

    ArticleCategory createCategory = selectedCategory;
    if (createCategory == ArticleCategory.all) {
      createCategory = ArticleCategory.daily;
    }

    setState(() => _isLoading = true);

    try {
      final request = RequestCreateArticle(
        title: titleFilter.filteredText,
        content: contentFilter.filteredText,
        category: createCategory.name,
        replyPacappi: _replyPacappi,
        replyPacappu: _replyPacappu,
      );

      await ref.read(articleEditorProvider.notifier).createArticle(request);
      if (mounted) {
        final sortBy = ref.read(articleSortProvider);
        context.pop();
        // 현재 카테고리 목록 무효화
        ref
            .read(articleListProvider(
              sortBy: sortBy,
              category: createCategory,
              limit: 20,
            ).notifier)
            .forceRefresh(sortBy: sortBy, limit: 20, category: createCategory);

        // 전체 탭 무효화
        ref
            .read(articleListProvider(
              sortBy: sortBy,
              category: ArticleCategory.all,
              limit: 20,
            ).notifier)
            .forceRefresh(
                sortBy: sortBy, limit: 20, category: ArticleCategory.all);
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
