import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/widgets/shared/loading_button.dart';
import 'package:pacapaca/pages/article/widgets/article_form.dart';

class ArticleCreatePage extends ConsumerStatefulWidget {
  const ArticleCreatePage({super.key});

  @override
  ConsumerState<ArticleCreatePage> createState() => _ArticleCreatePageState();
}

class _ArticleCreatePageState extends ConsumerState<ArticleCreatePage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  bool _isLoading = false;

  Future<void> _createArticle() async {
    if (_titleController.text.isEmpty || _contentController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('제목과 내용을 입력해주세요')),
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
      );

      await ref.read(articleServiceProvider).createArticle(request);
      if (mounted) {
        context.pop();
        ref.invalidate(articleListProvider);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('게시글 작성 실패: $e')),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: TextButton(
          onPressed: () => context.pop(),
          style: TextButton.styleFrom(
            foregroundColor: Colors.grey[700],
          ),
          child: Text(
            '취소',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
              letterSpacing: -0.3,
            ),
          ),
        ),
        leadingWidth: 80,
        actions: [
          LoadingButton(
            isLoading: _isLoading,
            onPressed: _createArticle,
            text: '작성하기',
          ),
        ],
      ),
      body: SafeArea(
        child: ArticleForm(
          titleController: _titleController,
          contentController: _contentController,
        ),
      ),
    );
  }
}
