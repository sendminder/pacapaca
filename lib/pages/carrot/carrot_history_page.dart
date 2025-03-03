import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/models/dto/carrot_dto.dart';
import 'package:pacapaca/providers/carrot_provider.dart';
import 'package:pacapaca/widgets/page_title.dart';
import 'package:pacapaca/widgets/shared/rotating_paca_loader.dart';
import 'package:pacapaca/providers/auth_provider.dart';

class CarrotHistoryPage extends ConsumerStatefulWidget {
  const CarrotHistoryPage({super.key});

  @override
  ConsumerState<CarrotHistoryPage> createState() => _CarrotHistoryPageState();
}

class _CarrotHistoryPageState extends ConsumerState<CarrotHistoryPage> {
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
      _lastPagingKey =
          ref.read(carrotTransactionsProvider).value?.lastOrNull?.id;
    });
  }

  Future<void> _loadMoreData() async {
    if (_lastPagingKey == null) return;

    setState(() {
      _isLoading = true;
    });

    await ref.read(carrotTransactionsProvider.notifier).loadMore();

    setState(() {
      _isLoading = false;
      _lastPagingKey =
          ref.read(carrotTransactionsProvider).value?.lastOrNull?.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncTransactions = ref.watch(carrotTransactionsProvider);

    return Scaffold(
      appBar: PageTitle(
        title: 'carrot.history_title'.tr(),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: RefreshIndicator(
        onRefresh: _loadInitialData,
        child: asyncTransactions.when(
          loading: () => const Center(child: RotatingPacaLoader()),
          error: (error, stackTrace) => Center(
            child: Text(
              'carrot.error_loading_history'.tr(),
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
          data: (transactions) {
            if (transactions == null || transactions.isEmpty) {
              return Center(
                child: Text('carrot.no_transactions'.tr()),
              );
            }

            return ListView.builder(
              controller: _scrollController,
              itemCount: transactions.length + (_isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == transactions.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final transaction = transactions[index];
                return _buildTransactionItem(context, transaction);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildTransactionItem(
      BuildContext context, CarrotTransactionDTO transaction) {
    final currentUserId = ref.read(authProvider).value?.id;
    final isReceived = transaction.receiverId == currentUserId;
    final isSent = transaction.senderId == currentUserId;

    final formattedDate = DateFormat('yyyy.MM.dd HH:mm').format(
      DateTime.parse(transaction.createTime),
    );

    String transactionTitle =
        transaction.description ?? 'carrot.transaction'.tr();

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
                    transactionTitle,
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
                            .withAlpha(150),
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Image.asset(
                  'assets/icon/carrot.png',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  '${isReceived ? '+' : '-'}${transaction.amount}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: isReceived ? Colors.green : Colors.red,
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
