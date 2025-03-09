import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:easy_localization/easy_localization.dart';

class SetNicknamePage extends ConsumerWidget {
  const SetNicknamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person_rounded,
                    size: 40,
                    color: primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: Text(
                  'nickname.set_nickname'.tr(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black87
                        : Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  'nickname.description'.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black54
                        : Colors.white70,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              _NicknameInput(),
            ],
          ),
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
  bool _isValid = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _validateInput(String value) {
    setState(() {
      _isValid = value.trim().length >= 2;
    });
  }

  void _submit() {
    final nickname = _controller.text.trim();
    if (nickname.length >= 2) {
      ref.read(authProvider.notifier).updateNickname(nickname);
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          onChanged: _validateInput,
          style: TextStyle(
            fontSize: 16,
            color: isDarkMode ? Colors.white : Colors.black87,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: isDarkMode
                ? Colors.grey.shade800.withOpacity(0.5)
                : Colors.grey.shade50,
            hintText: 'nickname.nickname_hint'.tr(),
            helperText: 'nickname.nickname_rule'.tr(),
            helperStyle: TextStyle(
              color: isDarkMode ? Colors.white70 : Colors.black54,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: primaryColor, width: 1.5),
            ),
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: isDarkMode ? Colors.white70 : Colors.black45,
                      size: 20,
                    ),
                    onPressed: () {
                      _controller.clear();
                      _validateInput('');
                    },
                  )
                : null,
          ),
        ),
        const SizedBox(height: 32),
        AnimatedOpacity(
          opacity: _isValid ? 1.0 : 0.7,
          duration: const Duration(milliseconds: 200),
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _isValid ? _submit : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                disabledBackgroundColor: primaryColor.withOpacity(0.3),
                disabledForegroundColor: Colors.white70,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'complete'.tr(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
