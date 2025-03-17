import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/models/dto/carrot_dto.dart';
import 'package:pacapaca/providers/carrot_provider.dart';
import 'package:pacapaca/widgets/shared/carrot/send_carrot_dialog.dart';
import 'package:pacapaca/constants/theme.dart';

class SendCarrotButton {
  final int receiverId;
  final String receiverName;
  final int? articleId;
  final int? commentId;
  final String? description;

  const SendCarrotButton({
    required this.receiverId,
    required this.receiverName,
    this.articleId,
    this.commentId,
    this.description,
  });

  Future<void> show(BuildContext context, WidgetRef ref) async {
    if (!context.mounted) return;

    final amount = await showDialog<int>(
      context: context,
      builder: (context) => SendCarrotDialog(
        receiverId: receiverId,
        receiverName: receiverName,
        description: description,
      ),
    );

    if (amount != null && context.mounted) {
      final request = RequestSendCarrots(
        receiverId: receiverId,
        amount: amount,
        description: description,
        articleId: articleId,
        commentId: commentId,
      );

      try {
        final res =
            await ref.read(carrotSenderProvider.notifier).sendCarrots(request);

        if (res != null && res.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: res.errorMessage!.contains('sent_max_limit_day')
                  ? Text('carrot.sent_max_limit_day'.tr(args: [
                      receiverName,
                    ]))
                  : Text('carrot.error'.tr()),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
          return;
        }

        if (res != null && context.mounted) {
          ref.read(carrotBalanceProvider.notifier).updateBalance(res.balance);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('carrot.send_success'.tr(args: [
                receiverName,
                amount.toString(),
              ])),
              behavior: SnackBarBehavior.floating,
              backgroundColor: AppTheme.carrotColor,
            ),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('carrot.error'.tr()),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    }
  }
}
