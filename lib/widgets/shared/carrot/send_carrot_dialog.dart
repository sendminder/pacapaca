import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/constants/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/providers/carrot_provider.dart';

class SendCarrotDialog extends ConsumerStatefulWidget {
  final String receiverName;
  final String? description;

  const SendCarrotDialog({
    super.key,
    required this.receiverName,
    this.description,
  });

  @override
  ConsumerState<SendCarrotDialog> createState() => _SendCarrotDialogState();
}

class _SendCarrotDialogState extends ConsumerState<SendCarrotDialog> {
  int _carrotAmount = 1;
  bool _isValid = false;

  @override
  void initState() {
    super.initState();
    _validateAmount();
  }

  void _validateAmount() {
    final userCarrotCount = ref.read(carrotBalanceProvider);

    setState(() {
      _isValid = _carrotAmount > 0 &&
          userCarrotCount.hasValue &&
          _carrotAmount <= (userCarrotCount.value ?? 0) &&
          _carrotAmount <= 10;
    });
  }

  void _incrementAmount() {
    final userCarrotCount = ref.read(carrotBalanceProvider);
    final maxAmount = 10;

    if (userCarrotCount.hasValue &&
        _carrotAmount < (userCarrotCount.value ?? 0) &&
        _carrotAmount < maxAmount) {
      setState(() {
        _carrotAmount++;
        _validateAmount();
      });
    }
  }

  void _decrementAmount() {
    if (_carrotAmount > 1) {
      setState(() {
        _carrotAmount--;
        _validateAmount();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userCarrotCount = ref.watch(carrotBalanceProvider);

    final maxAmount = 10;

    final currentAmount = _carrotAmount;

    final canDecrement = currentAmount > 1;
    final canIncrement = userCarrotCount.hasValue &&
        currentAmount < (userCarrotCount.value ?? 0) &&
        currentAmount < maxAmount;

    return AlertDialog(
      title: Row(
        children: [
          Image.asset(
            'assets/icon/carrot.png',
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 8),
          Text('carrot.send_title'.tr()),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'carrot.send_to'.tr(args: [widget.receiverName]),
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: canDecrement ? _decrementAmount : null,
                icon: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppTheme.carrotColor
                        .withOpacity(canDecrement ? 0.1 : 0.05),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.remove,
                    color: AppTheme.carrotColor
                        .withOpacity(canDecrement ? 1.0 : 0.3),
                    size: 24,
                  ),
                ),
                iconSize: 40,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              Container(
                width: 80,
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.center,
                child: Text(
                  _carrotAmount.toString(),
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              IconButton(
                onPressed: canIncrement ? _incrementAmount : null,
                icon: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppTheme.carrotColor
                        .withOpacity(canIncrement ? 0.1 : 0.05),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add,
                    color: AppTheme.carrotColor
                        .withOpacity(canIncrement ? 1.0 : 0.3),
                    size: 24,
                  ),
                ),
                iconSize: 40,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (_carrotAmount > 0)
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 4,
                runSpacing: 4,
                children: [
                  if (_carrotAmount <= 4)
                    ...List.generate(
                      _carrotAmount,
                      (index) => Image.asset(
                        'assets/icon/carrot.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  if (_carrotAmount == 5)
                    Image.asset(
                      'assets/icon/carrot.png',
                      width: 48,
                      height: 48,
                    ),
                  if (_carrotAmount >= 6 && _carrotAmount <= 9) ...[
                    Image.asset(
                      'assets/icon/carrot.png',
                      width: 48,
                      height: 48,
                    ),
                    const SizedBox(width: 4),
                    ...List.generate(
                      _carrotAmount - 5,
                      (index) => Image.asset(
                        'assets/icon/carrot.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ],
                  if (_carrotAmount == 10) ...[
                    Image.asset(
                      'assets/icon/carrot.png',
                      width: 48,
                      height: 48,
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/icon/carrot.png',
                      width: 48,
                      height: 48,
                    ),
                  ],
                ],
              ),
            ),
          const SizedBox(height: 16),
          Center(
            child: userCarrotCount.when(
              data: (balance) => GestureDetector(
                onTap: () {
                  if ((balance ?? 0) < _carrotAmount) {
                    context.pop();
                    context.push('/store');
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppTheme.carrotColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: AppTheme.carrotColor.withOpacity(0.3)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/icon/carrot.png',
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'carrot.your_balance'
                            .tr(args: [(balance ?? 0).toString()]),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppTheme.carrotColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      if ((balance ?? 0) < _carrotAmount) ...[
                        const SizedBox(width: 4),
                        Icon(
                          Icons.shopping_bag,
                          size: 14,
                          color: AppTheme.carrotColor,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              loading: () => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2)),
              ),
              error: (error, stack) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: theme.colorScheme.error.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  'carrot.balance_error'.tr(),
                  style: TextStyle(
                    color: theme.colorScheme.error,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => context.pop(),
              child: Text(
                'carrot.cancel'.tr(),
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 32),
            ElevatedButton(
              onPressed: _isValid
                  ? () {
                      context.pop(_carrotAmount);
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.carrotColor,
                foregroundColor: Colors.white,
                disabledBackgroundColor: AppTheme.carrotColor.withOpacity(0.3),
              ),
              child: Text('carrot.send'.tr()),
            ),
          ],
        ),
      ],
    );
  }
}
