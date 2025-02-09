import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_provider.dart';

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
      await _ref.read(authServiceProvider).updateNickname(nickname);
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
        context.go('/home');
      } else if (next is AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('닉네임 설정에 실패했습니다: ${next.error}')),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('닉네임 설정'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '사용하실 닉네임을 입력해주세요',
              style: TextStyle(fontSize: 18),
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
          decoration: const InputDecoration(
            labelText: '닉네임',
            border: OutlineInputBorder(),
            hintText: '2자 이상 입력해주세요',
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
                : const Text('완료'),
          ),
        ),
      ],
    );
  }
}
