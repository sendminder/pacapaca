import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'ranking_list_item.dart';

class RankingSection extends StatelessWidget {
  final String title;
  final List<RankingListItem> items;
  final VoidCallback onViewMore;
  final bool isLoading;
  final String? errorMessage;

  const RankingSection({
    super.key,
    required this.title,
    required this.items,
    required this.onViewMore,
    this.isLoading = false,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextButton(
                  onPressed: onViewMore,
                  child: Text('ranking.view_more'.tr()),
                ),
              ],
            ),
          ),
          if (isLoading)
            const Center(child: CircularProgressIndicator())
          else if (errorMessage != null)
            Center(child: Text(errorMessage!))
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) => items[index],
            ),
        ],
      ),
    );
  }
}
