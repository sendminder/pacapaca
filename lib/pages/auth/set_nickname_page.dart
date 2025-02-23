import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:easy_localization/easy_localization.dart';

class SetNicknamePage extends ConsumerWidget {
  const SetNicknamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authProvider, (prev, next) {
      if (next is AsyncData) {
        context.go('/articles');
      } else if (next is AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'nickname.nickname_error'.tr(args: [next.error.toString()]))),
        );
      }
    });

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
            _NicknameInput(
              isLoading: ref.watch(authProvider).isLoading,
            ),
          ],
        ),
      ),
    );
  }
}

class _NicknameInput extends ConsumerStatefulWidget {
  final bool isLoading;

  const _NicknameInput({required this.isLoading});

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
          enabled: !widget.isLoading,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: widget.isLoading ? null : _submit,
            child: widget.isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text('complete'.tr()),
          ),
        ),
      ],
    );
  }
}
