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
          onPressed: () {
            context.pop();
          },
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
            ),
            child: Text(
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
              ? ArticleCategory.daily // 카테고리가 전체일때는 일상으로 설정
              : selectedCategory,
          onCategoryChanged: (category) {
            ref.read(articleCategoryProvider.notifier).state = category;
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

    try {
      final request = CreateArticleRequest(
        title: _titleController.text,
        content: _contentController.text,
        category: selectedCategory.name,
      );

      await ref.read(articleServiceProvider).createArticle(request);
      if (mounted) {
        context.pop();
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

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
