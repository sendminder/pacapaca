import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/models/dto/carrot_dto.dart';
import 'package:pacapaca/providers/carrot_provider.dart';
import 'package:pacapaca/widgets/shared/carrot/send_carrot_dialog.dart';

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
    final amount = await showDialog<int>(
      context: context,
      builder: (context) => SendCarrotDialog(
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
        final transaction =
            await ref.read(carrotSenderProvider.notifier).sendCarrots(request);

        if (transaction != null && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('carrot.sent'.tr(args: [amount.toString()])),
              behavior: SnackBarBehavior.floating,
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
