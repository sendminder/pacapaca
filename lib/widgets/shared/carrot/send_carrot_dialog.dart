import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';

class SendCarrotDialog extends StatefulWidget {
  final String receiverName;
  final String? description;

  const SendCarrotDialog({
    super.key,
    required this.receiverName,
    this.description,
  });

  @override
  State<SendCarrotDialog> createState() => _SendCarrotDialogState();
}

class _SendCarrotDialogState extends State<SendCarrotDialog> {
  final TextEditingController _amountController = TextEditingController();
  bool _isValid = false;

  @override
  void initState() {
    super.initState();
    _amountController.addListener(_validateAmount);
  }

  void _validateAmount() {
    final amount = int.tryParse(_amountController.text);
    setState(() {
      _isValid = amount != null && amount > 0 && amount <= 100;
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('carrot.send_title'.tr()),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('carrot.send_to'.tr(args: [widget.receiverName])),
          const SizedBox(height: 16),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(3),
            ],
            decoration: InputDecoration(
              labelText: 'carrot.amount'.tr(),
              hintText: 'carrot.amount_hint'.tr(),
              suffixText: 'carrot.unit'.tr(),
              errorText: _amountController.text.isNotEmpty && !_isValid
                  ? 'carrot.amount_error'.tr()
                  : null,
            ),
          ),
          if (widget.description != null) ...[
            const SizedBox(height: 16),
            Text(
              widget.description!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text('carrot.cancel'.tr()),
        ),
        TextButton(
          onPressed: _isValid
              ? () {
                  final amount = int.parse(_amountController.text);
                  context.pop(amount);
                }
              : null,
          child: Text('carrot.send'.tr()),
        ),
      ],
    );
  }
}
