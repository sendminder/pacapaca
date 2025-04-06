import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/constants/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/providers/carrot_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendCarrotDialog extends ConsumerStatefulWidget {
  final String? description;
  final String receiverName;
  final int receiverId;

  const SendCarrotDialog({
    super.key,
    required this.receiverName,
    required this.receiverId,
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
          !userCarrotCount.isLoading &&
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

  // 당근 아이콘 위젯 생성 메서드
  Widget _buildCarrotIcon({required double size}) {
    return Image.asset(
      'assets/icon/carrot.png',
      width: size,
      height: size,
    );
  }

  // 당근 표시 위젯 생성 메서드
  Widget _buildCarrotDisplay() {
    if (_carrotAmount <= 0) return const SizedBox.shrink();

    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 4,
        runSpacing: 4,
        children: [
          // 4개 이하일 때는 모든 당근 아이콘 표시
          if (_carrotAmount <= 4)
            ...List.generate(
              _carrotAmount,
              (index) => _buildCarrotIcon(size: 24),
            ),

          // 5개 = 왕당근 1개
          if (_carrotAmount == 5) _buildCarrotIcon(size: 48),

          // 6~9개 = 왕당근 1개 + 미니당근 (1~4개)
          if (_carrotAmount >= 6 && _carrotAmount <= 9) ...[
            // 왕당근 1개
            _buildCarrotIcon(size: 48),
            const SizedBox(width: 4),
            // 나머지 미니당근
            ...List.generate(
              _carrotAmount - 5,
              (index) => _buildCarrotIcon(size: 20),
            ),
          ],

          // 10개 = 왕당근 2개
          if (_carrotAmount == 10) ...[
            _buildCarrotIcon(size: 48),
            const SizedBox(width: 8),
            _buildCarrotIcon(size: 48),
          ],
        ],
      ),
    );
  }

  // 당근 잔액 표시 위젯 생성 메서드
  Widget _buildCarrotBalance(
      ThemeData theme, AsyncValue<int?> userCarrotCount) {
    return userCarrotCount.when(
      data: (balance) => GestureDetector(
        onTap: () {
          // TODO: 상점 오픈
          // if ((balance ?? 0) < _carrotAmount) {
          //   context.pop();
          //   context.push('/store');
          // }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.carrotColor
                .withAlpha(25), // withOpacity(0.1) -> withAlpha(25)
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: AppTheme.carrotColor
                    .withAlpha(76)), // withOpacity(0.3) -> withAlpha(76)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildCarrotIcon(size: 16),
              const SizedBox(width: 6),
              Text(
                'carrot.your_balance'.tr(args: [(balance ?? 0).toString()]),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: (balance ?? 0) < _carrotAmount
                      ? theme.colorScheme.error
                      : AppTheme.carrotColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
              // TODO: 상점 오픈
              // if ((balance ?? 0) < _carrotAmount) ...[
              //   const SizedBox(width: 4),
              //   Icon(
              //     Icons.shopping_bag,
              //     size: 14,
              //     color: AppTheme.carrotColor,
              //   ),
              // ],
            ],
          ),
        ),
      ),
      loading: () => const SizedBox.shrink(),
      error: (error, stack) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: theme.colorScheme.error
              .withAlpha(25), // withOpacity(0.1) -> withAlpha(25)
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          'carrot.balance_error'.tr(),
          style: TextStyle(
            color: theme.colorScheme.error,
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }

  // 증가/감소 버튼 생성 메서드
  Widget _buildAmountControls(ThemeData theme) {
    final userCarrotCount = ref.watch(carrotBalanceProvider);
    final maxAmount = 10;

    final canDecrement = _carrotAmount > 1;
    final canIncrement = userCarrotCount.hasValue &&
        _carrotAmount < (userCarrotCount.value ?? 0) &&
        _carrotAmount < maxAmount;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: canDecrement ? _decrementAmount : null,
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.carrotColor.withAlpha(canDecrement
                  ? 25
                  : 13), // withOpacity(0.1/0.05) -> withAlpha(25/13)
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.remove,
              color: AppTheme.carrotColor.withAlpha(canDecrement
                  ? 255
                  : 76), // withOpacity(1.0/0.3) -> withAlpha(255/76)
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
              color: AppTheme.carrotColor.withAlpha(canIncrement
                  ? 25
                  : 13), // withOpacity(0.1/0.05) -> withAlpha(25/13)
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.add,
              color: AppTheme.carrotColor.withAlpha(canIncrement
                  ? 255
                  : 76), // withOpacity(1.0/0.3) -> withAlpha(255/76)
              size: 24,
            ),
          ),
          iconSize: 40,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // 당근 잔액 변경 감지 및 유효성 검사
    final userCarrotCount = ref.watch(carrotBalanceProvider);
    if (userCarrotCount.hasValue && !userCarrotCount.isLoading) {
      // 당근 잔액이 로드되면 유효성 다시 검사
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _validateAmount();
      });
    }

    return AlertDialog(
      title: Row(
        children: [
          _buildCarrotIcon(size: 24),
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
              fontSize: 16.sp,
            ),
          ),
          const SizedBox(height: 16),
          _buildAmountControls(theme),
          const SizedBox(height: 8),
          _buildCarrotDisplay(),
          const SizedBox(height: 16),
          Center(child: _buildCarrotBalance(theme, userCarrotCount)),
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
                  fontSize: 16.sp,
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
                disabledBackgroundColor: AppTheme.carrotColor
                    .withAlpha(76), // withOpacity(0.3) -> withAlpha(76)
              ),
              child: Text('carrot.send'.tr()),
            ),
          ],
        ),
      ],
    );
  }
}
