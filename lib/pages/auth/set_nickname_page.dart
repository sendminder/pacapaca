import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:easy_localization/easy_localization.dart';

class SetNicknamePage extends ConsumerWidget {
  const SetNicknamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('nickname.set_nickname'.tr()),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'nickname.set_nickname'.tr(),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            _NicknameInput(),
          ],
        ),
      ),
    );
  }
}

class _NicknameInput extends ConsumerStatefulWidget {
  const _NicknameInput();

  @override
  ConsumerState<_NicknameInput> createState() => _NicknameInputState();
}

class _NicknameInputState extends ConsumerState<_NicknameInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final nickname = _controller.text.trim();
    if (nickname.length >= 2) {
      ref.read(authProvider.notifier).updateNickname(nickname);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'nickname.nickname_hint'.tr(),
            border: OutlineInputBorder(),
            hintText: 'nickname.nickname_hint'.tr(),
            helperText: 'nickname.nickname_rule'.tr(),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _submit,
            child: Text('complete'.tr()),
          ),
        ),
      ],
    );
  }
}
