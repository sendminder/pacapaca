import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/models/enums/article_category.dart';

class ArticleForm extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;
  final String nickname;
  final ArticleCategory selectedCategory;
  final Function(ArticleCategory) onCategoryChanged;

  const ArticleForm({
    super.key,
    required this.titleController,
    required this.contentController,
    required this.nickname,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCategorySelector(context),
        _buildAuthorInfo(context),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border.symmetric(
              horizontal: BorderSide(
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
          child: Column(
            children: [
              _buildTitleField(context),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            child: _buildContentField(context),
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
            value: selectedCategory,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Theme.of(context).colorScheme.onSurface.withAlpha(128),
            ),
            items: ArticleCategory.valuesWithoutAll.map((category) {
              final isSelected = selectedCategory == category;
              return DropdownMenuItem(
                value: category,
                child: Text(
                  category.label,
                  style: TextStyle(
                    fontSize: 16,
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
                onCategoryChanged(value);
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
              fontSize: 15,
              color: Theme.of(context).colorScheme.onSurface.withAlpha(128),
              fontWeight: FontWeight.w100,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            nickname,
            style: TextStyle(
              fontSize: 15,
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: TextField(
        controller: titleController,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
        decoration: InputDecoration(
          hintText: 'article.title_hint'.tr(),
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(128),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        ),
        cursorColor: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  Widget _buildContentField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: contentController,
        maxLines: null,
        expands: true,
        textAlignVertical: TextAlignVertical.top,
        style: const TextStyle(
          fontSize: 16,
          height: 1.6,
          letterSpacing: -0.3,
        ),
        decoration: InputDecoration(
          hintText: 'article.content_hint'.tr(),
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(128),
            fontSize: 16,
            height: 1.6,
            letterSpacing: -0.3,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        ),
        cursorColor: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
