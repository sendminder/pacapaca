import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/widgets/shared/loading_button.dart';
import 'package:pacapaca/pages/article/widgets/article_form.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/models/enums/article_category.dart';
import 'package:pacapaca/providers/settings_provider.dart';

class ArticleCreatePage extends ConsumerStatefulWidget {
  const ArticleCreatePage({super.key});

  @override
  ConsumerState<ArticleCreatePage> createState() => _ArticleCreatePageState();
}

class _ArticleCreatePageState extends ConsumerState<ArticleCreatePage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  bool _isLoading = false;
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
              letterSpacing: -0.3,
            ),
          ),
        ),
        leadingWidth: 80,
        title: Text('article.create'.tr()),
        actions: [
          LoadingButton(
            isLoading: _isLoading,
            onPressed: () => _createArticle(selectedCategory),
            text: 'article.register'.tr(),
          ),
        ],
      ),
      body: SafeArea(
        child: ArticleForm(
          titleController: _titleController,
          contentController: _contentController,
          nickname: currentUser?.nickname ?? 'article.unknown_user'.tr(),
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

    setState(() {
      _isLoading = true;
    });

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
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
