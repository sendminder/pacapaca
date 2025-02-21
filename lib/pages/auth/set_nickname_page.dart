import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_provider.dart';
import 'package:easy_localization/easy_localization.dart';

final nicknameControllerProvider =
    StateNotifierProvider.autoDispose<NicknameController, AsyncValue<void>>(
        (ref) {
  return NicknameController(ref);
});

class NicknameController extends StateNotifier<AsyncValue<void>> {
  final Ref _ref;

  NicknameController(this._ref) : super(const AsyncValue.data(null));

  Future<void> updateNickname(String nickname) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _ref.read(authProvider.notifier).updateNickname(nickname);
    });
  }
}

class SetNicknamePage extends ConsumerWidget {
  const SetNicknamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nicknameState = ref.watch(nicknameControllerProvider);

    ref.listen(nicknameControllerProvider, (prev, next) {
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
              isLoading: nicknameState is AsyncLoading,
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
      ref.read(nicknameControllerProvider.notifier).updateNickname(nickname);
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
