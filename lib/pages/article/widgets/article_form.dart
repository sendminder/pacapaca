import 'package:flutter/material.dart';

class ArticleForm extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;

  const ArticleForm({
    super.key,
    required this.titleController,
    required this.contentController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleField(),
          Divider(
            height: 1,
            color: Colors.grey[300],
          ),
          _buildContentField(),
        ],
      ),
    );
  }

  Widget _buildTitleField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: TextField(
        controller: titleController,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
        decoration: InputDecoration(
          hintText: '제목을 입력하세요',
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: 22,
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
    return Expanded(
      child: Container(
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
            hintText: '내용을 입력하세요...',
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
      ),
    );
  }
}
