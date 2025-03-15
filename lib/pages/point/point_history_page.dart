import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/models/dto/point_dto.dart';
import 'package:pacapaca/providers/point_provider.dart';
import 'package:pacapaca/widgets/page_title.dart';
import 'package:pacapaca/widgets/shared/rotating_paca_loader.dart';

class PointHistoryPage extends ConsumerStatefulWidget {
  const PointHistoryPage({super.key});

  @override
  ConsumerState<PointHistoryPage> createState() => _PointHistoryPageState();
}

class _PointHistoryPageState extends ConsumerState<PointHistoryPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  int? _lastPagingKey;
  final int _limit = 20;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !_isLoading &&
        _lastPagingKey != null) {
      _loadMoreData();
    }
  }

  Future<void> _loadInitialData() async {
    setState(() {
      _isLoading = false;
      _lastPagingKey = ref.read(pointHistoriesProvider).value?.lastOrNull?.id;
    });
  }

  Future<void> _loadMoreData() async {
    if (_lastPagingKey == null) return;

    setState(() {
      _isLoading = true;
    });

    await ref.read(pointHistoriesProvider.notifier).loadMore();

    setState(() {
      _isLoading = false;
      _lastPagingKey = ref.read(pointHistoriesProvider).value?.lastOrNull?.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncHistories = ref.watch(pointHistoriesProvider);

    return Scaffold(
      appBar: PageTitle(
        title: 'point.history_title'.tr(),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: RefreshIndicator(
        onRefresh: _loadInitialData,
        child: asyncHistories.when(
          loading: () => const Center(child: RotatingPacaLoader()),
          error: (error, stackTrace) => Center(
            child: Text(
              'point.error_loading_history'.tr(),
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
          data: (histories) {
            if (histories == null || histories.isEmpty) {
              return Center(
                child: Text('point.no_histories'.tr()),
              );
            }

            return ListView.builder(
              controller: _scrollController,
              itemCount: histories.length + (_isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == histories.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final history = histories[index];
                return _buildHistoryItem(context, history);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildHistoryItem(BuildContext context, PointsHistoryDTO history) {
    final isPositive = history.amount > 0;
    final formattedDate = DateFormat('yyyy.MM.dd').format(
      DateTime.parse(history.createTime),
    );

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'point.${history.description}'.tr(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  formattedDate,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withAlpha(128),
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.workspace_premium,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  '${isPositive ? '+' : ''}${history.amount}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: isPositive ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
