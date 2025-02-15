import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ArticleForm extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;
  final String nickname;

  const ArticleForm({
    super.key,
    required this.titleController,
    required this.contentController,
    required this.nickname,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAuthorInfo(context),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            border: Border.symmetric(
              horizontal: BorderSide(color: Colors.grey[200]!),
            ),
          ),
          child: Column(
            children: [
              _buildTitleField(),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.grey[100],
            child: _buildContentField(),
          ),
        ),
      ],
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
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            nickname,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleField() {
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
            color: Colors.grey[400],
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
        cursorColor: Colors.grey[600],
      ),
    );
  }

  Widget _buildContentField() {
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
            color: Colors.grey[400],
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
        cursorColor: Colors.grey[600],
      ),
    );
  }
}
