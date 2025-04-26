import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/dto/thought_dto.dart';
import 'package:pacapaca/services/thoughts_service.dart';

class ThoughtResponsePage extends ConsumerStatefulWidget {
  final ThoughtDTO thought;

  const ThoughtResponsePage({super.key, required this.thought});

  @override
  ConsumerState<ThoughtResponsePage> createState() =>
      _ThoughtResponsePageState();
}

class _ThoughtResponsePageState extends ConsumerState<ThoughtResponsePage> {
  late TextEditingController _controller;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.thought.response);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _saveResponse() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      await GetIt.instance<ThoughtsService>().saveResponse(
        widget.thought.id,
        _controller.text.trim(),
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('답변이 저장되었습니다'),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('저장 중 오류가 발생했습니다: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          '나의 생각 기록하기',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        elevation: 0,
        actions: [
          if (!_isLoading)
            TextButton.icon(
              onPressed: _saveResponse,
              icon: Icon(
                Icons.check,
                color: colorScheme.primary,
                size: 20.sp,
              ),
              label: Text(
                '저장',
                style: TextStyle(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ),
          SizedBox(width: 8.w),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 따뜻한 한마디 카드
                  Hero(
                    tag: 'thought_card_${widget.thought.id}',
                    child: Material(
                      color: Colors.transparent,
                      child: Card(
                        elevation: 0.5,
                        clipBehavior: Clip.antiAlias,
                        color: colorScheme.primary.withAlpha(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(
                            color: colorScheme.outline.withAlpha(30),
                            width: 0.5,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '오늘의 따뜻한 한마디',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                widget.thought.message,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color:
                                          colorScheme.onSurface.withAlpha(220),
                                      height: 1.5,
                                      fontSize: 16.sp,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // 답변 입력 영역
                  Text(
                    '나의 생각',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _controller,
                      maxLines: 5,
                      minLines: 5,
                      maxLength: 500,
                      decoration: InputDecoration(
                        hintText: '당신의 생각을 자유롭게 작성해보세요...',
                        fillColor: colorScheme.surface,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: colorScheme.outline.withAlpha(50),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: colorScheme.primary,
                            width: 1.5,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(16.w),
                      ),
                      style: TextStyle(
                        fontSize: 16.sp,
                        height: 1.5,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return '내용을 입력해주세요';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.newline,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  Text(
                    '* 오늘의 생각을 기록하여 나만의 소중한 기억을 남겨보세요.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: colorScheme.onSurface.withAlpha(150),
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  SizedBox(height: 80.h), // 키보드가 올라올 때 여유 공간
                ],
              ),
            ),
          ),

          // 로딩 인디케이터
          if (_isLoading)
            Container(
              color: Colors.black.withAlpha(50),
              child: Center(
                child: CircularProgressIndicator(
                  color: colorScheme.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
