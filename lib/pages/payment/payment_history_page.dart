import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/models/dto/payment_dto.dart';
import 'package:pacapaca/providers/payment_provider.dart';
import 'package:pacapaca/widgets/shared/rotating_paca_loader.dart';
import 'package:pacapaca/widgets/page_title.dart';

class PaymentHistoryPage extends ConsumerStatefulWidget {
  const PaymentHistoryPage({super.key});

  @override
  ConsumerState<PaymentHistoryPage> createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends ConsumerState<PaymentHistoryPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(paymentsProvider.notifier).refreshPayments());
  }

  @override
  Widget build(BuildContext context) {
    final asyncPayments = ref.watch(paymentsProvider);

    return Scaffold(
      appBar: PageTitle(
        title: 'payment.history_title'.tr(),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(paymentsProvider.notifier).refreshPayments(),
        child: asyncPayments.when(
          data: (payments) {
            if (payments.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.receipt_long,
                      size: 64,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurfaceVariant
                          .withOpacity(0.5),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'payment.no_history'.tr(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: payments.length,
              itemBuilder: (context, index) {
                return _buildPaymentItem(context, payments[index]);
              },
            );
          },
          loading: () => const Center(child: RotatingPacaLoader()),
          error: (error, stackTrace) => Center(
            child: Text(
              'payment.error_loading'.tr(),
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentItem(BuildContext context, PaymentDTO payment) {
    final statusColor = _getStatusColor(payment.status);
    final formattedDate = DateFormat.yMMMd().add_Hm().format(
          DateTime.parse(payment.createTime),
        );

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ID: ${payment.orderId}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'payment.status.${payment.status}'.tr(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Image.asset(
                  'assets/icon/carrot.png',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  NumberFormat.compact().format(payment.carrotAmount),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  ' carrots',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'payment.product_id'.tr(args: [payment.productId]),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 4),
            Text(
              'payment.platform'.tr(args: [payment.platform.toUpperCase()]),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formattedDate,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
                Text(
                  '\$${(payment.price / 100).toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'failed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
