import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/models/enums/article_category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleForm extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;
  final String nickname;
  final ArticleCategory selectedCategory;
  final Function(ArticleCategory) onCategoryChanged;
  final Function(bool)? onPacappiSelected;
  final Function(bool)? onPacappuSelected;
  final bool isEditMode;

  const ArticleForm({
    Key? key,
    required this.titleController,
    required this.contentController,
    required this.nickname,
    required this.selectedCategory,
    required this.onCategoryChanged,
    this.onPacappiSelected,
    this.onPacappuSelected,
    this.isEditMode = false,
  }) : super(key: key);

  @override
  State<ArticleForm> createState() => _ArticleFormState();
}

class _ArticleFormState extends State<ArticleForm> {
  bool _isPacappiSelected = false;
  bool _isPacappuSelected = false;
  bool _isContentLongEnough = false;
  int _currentLength = 0;
  static const int _minLength = 20;
  static const int _maxLength = 1000;
  static const int _maxTitleLength = 20;

  @override
  void initState() {
    super.initState();
    widget.contentController.addListener(_checkContentLength);
  }

  void _checkContentLength() {
    final currentLength = widget.contentController.text.trim().length;
    final isLongEnough = currentLength >= _minLength;

    if (isLongEnough != _isContentLongEnough ||
        currentLength != _currentLength) {
      setState(() {
        _currentLength = currentLength;
        _isContentLongEnough = isLongEnough;
        if (!isLongEnough) {
          _isPacappiSelected = false;
          _isPacappuSelected = false;
          widget.onPacappiSelected?.call(false);
          widget.onPacappuSelected?.call(false);
        } else {
          _isPacappiSelected = true;
          _isPacappuSelected = true;
          widget.onPacappiSelected?.call(true);
          widget.onPacappuSelected?.call(true);
        }
      });
    }
  }

  Widget _buildCharacterButton(
    String assetPath,
    bool isSelected,
    bool isEnabled,
    Function(bool) onTap,
  ) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: isEnabled
          ? () {
              onTap(!isSelected);
            }
          : null,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            width: 2,
          ),
          color: isEnabled
              ? (isSelected
                  ? (isDarkMode
                      ? Theme.of(context).colorScheme.surface
                      : Colors.white)
                  : Theme.of(context)
                      .colorScheme
                      .surfaceVariant
                      .withOpacity(0.3))
              : Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset(
            assetPath,
            color: isEnabled
                ? (isSelected
                    ? null
                    : Theme.of(context).colorScheme.onSurface.withAlpha(70))
                : Theme.of(context).colorScheme.onSurface.withAlpha(70),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCategorySelector(context),
        _buildAuthorInfo(context),
        _buildTitleField(context),
        Expanded(
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            child: _buildContentField(context),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '$_currentLength',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: _currentLength > _maxLength
                            ? Theme.of(context).colorScheme.error
                            : _isContentLongEnough
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: _isContentLongEnough
                          ? ' / $_maxLength'
                          : ' / $_minLength',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    if (_isContentLongEnough)
                      TextSpan(
                        text: ' ✓',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
              ),
              if (!widget.isEditMode)
                Row(
                  children: [
                    _buildCharacterButton(
                      'assets/profiles/pacappiface.png',
                      _isPacappiSelected,
                      _isContentLongEnough,
                      (selected) {
                        setState(() {
                          _isPacappiSelected = selected;
                        });
                        widget.onPacappiSelected?.call(selected);
                      },
                    ),
                    SizedBox(width: 8),
                    _buildCharacterButton(
                      'assets/profiles/pacappuface.png',
                      _isPacappuSelected,
                      _isContentLongEnough,
                      (selected) {
                        setState(() {
                          _isPacappuSelected = selected;
                        });
                        widget.onPacappuSelected?.call(selected);
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategorySelector(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 4, right: 4, top: 16, bottom: 0),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<ArticleCategory>(
            isExpanded: true,
            value: widget.selectedCategory,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Theme.of(context).colorScheme.onSurface.withAlpha(128),
            ),
            items: ArticleCategory.valuesWithoutAll.map((category) {
              final isSelected = widget.selectedCategory == category;
              return DropdownMenuItem(
                value: category,
                child: Text(
                  category.label,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onSurface,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                widget.onCategoryChanged(value);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAuthorInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        children: [
          Text(
            'article.nickname'.tr(),
            style: TextStyle(
              fontSize: 15.sp,
              color: Theme.of(context).colorScheme.onSurface.withAlpha(128),
              fontWeight: FontWeight.w100,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            widget.nickname,
            style: TextStyle(
              fontSize: 15.sp,
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 16),
      child: TextField(
        controller: widget.titleController,
        maxLength: _maxTitleLength,
        style: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          hintText: 'article.title_hint'.tr(),
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(128),
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          fillColor: Theme.of(context).colorScheme.surface,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          counterText: '',
        ),
        cursorColor: Theme.of(context).colorScheme.onSurface.withAlpha(128),
      ),
    );
  }

  Widget _buildContentField(BuildContext context) {
    return TextField(
      controller: widget.contentController,
      maxLines: null,
      maxLength: _maxLength,
      expands: true,
      textAlignVertical: TextAlignVertical.top,
      style: TextStyle(
        fontSize: 16.sp,
        height: 1.6,
      ),
      decoration: InputDecoration(
        hintText: 'article.content_hint'.tr(),
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSurface.withAlpha(128),
          fontSize: 16.sp,
          height: 1.6,
        ),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        contentPadding: const EdgeInsets.only(left: 20, right: 16),
        counterText: '',
      ),
      cursorColor: Theme.of(context).colorScheme.onSurface.withAlpha(128),
    );
  }

  @override
  void dispose() {
    widget.contentController.removeListener(_checkContentLength);
    super.dispose();
  }
}
