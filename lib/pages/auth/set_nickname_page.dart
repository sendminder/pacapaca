import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/services/word_filter_service.dart';

class SetNicknamePage extends ConsumerWidget {
  const SetNicknamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 1),
              Center(
                child: Text(
                  'nickname.set_nickname'.tr(),
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  'nickname.description'.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        Theme.of(context).colorScheme.onSurface.withAlpha(150),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const _NicknameInput(),
              const Spacer(flex: 2),
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
  bool _isChecking = false;
  bool _nicknameChecked = false;
  bool _nicknameAvailable = false;
  String? _errorMessage;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _validateInput(String value) {
    setState(() {
      if (value.contains(' ')) {
        _isValid = false;
        _errorMessage = 'nickname.no_spaces'.tr();
        _nicknameChecked = false;
        return;
      }

      final trimmedValue = value.trim();

      if (trimmedValue.length > 10) {
        _isValid = false;
        _errorMessage = 'nickname.too_long'.tr();
        _nicknameChecked = false;
        return;
      }

      _isValid = trimmedValue.length >= 2;
      _errorMessage = null;
      _nicknameChecked = false;
    });
  }

  Future<void> _checkNickname() async {
    final nickname = _controller.text;

    if (nickname.contains(' ')) {
      setState(() {
        _errorMessage = 'nickname.no_spaces'.tr();
      });
      return;
    }

    final trimmedNickname = nickname.trim();

    if (trimmedNickname.length > 10) {
      setState(() {
        _errorMessage = 'nickname.too_long'.tr();
      });
      return;
    }

    if (trimmedNickname.length < 2) {
      setState(() {
        _errorMessage = 'nickname.too_short'.tr();
      });
      return;
    }

    if (WordFilterService.instance.containsForbiddenWord(trimmedNickname)) {
      final category =
          WordFilterService.instance.getForbiddenWordCategory(trimmedNickname);
      setState(() {
        _errorMessage =
            'nickname.contains_forbidden_word'.tr(args: [category ?? '']);
      });
      return;
    }

    setState(() {
      _isChecking = true;
      _errorMessage = null;
    });

    try {
      final exists = await ref
          .read(authProvider.notifier)
          .checkNicknameExists(trimmedNickname);

      setState(() {
        _isChecking = false;
        _nicknameChecked = true;
        _nicknameAvailable = !exists;

        if (exists) {
          _errorMessage = 'nickname.already_exists'.tr();
        }
      });
    } catch (e) {
      setState(() {
        _isChecking = false;
        _errorMessage = 'common.error_occurred'.tr();
      });
    }
  }

  void _submit() {
    final nickname = _controller.text;

    // 원본 값에서 띄어쓰기 체크
    if (nickname.contains(' ')) {
      setState(() {
        _errorMessage = 'nickname.no_spaces'.tr();
      });
      return;
    }

    final trimmedNickname = nickname.trim();

    // 10자 초과 체크
    if (trimmedNickname.length > 10) {
      setState(() {
        _errorMessage = 'nickname.too_long'.tr();
      });
      return;
    }

    if (trimmedNickname.length >= 2 && _nicknameChecked && _nicknameAvailable) {
      ref.read(authProvider.notifier).updateNickname(trimmedNickname);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _controller,
          onChanged: _validateInput,
          maxLength: 10,
          style: TextStyle(
            fontSize: 18,
            color: colorScheme.onSurface,
          ),
          decoration: InputDecoration(
            filled: true,
            counterText: '',
            fillColor: isDarkMode
                ? colorScheme.surfaceContainerHigh.withAlpha(77)
                : colorScheme.surfaceContainerHigh.withAlpha(26),
            hintText: 'nickname.nickname_hint'.tr(),
            hintStyle: TextStyle(
              color: colorScheme.onSurface.withAlpha(128),
            ),
            errorText: _errorMessage,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: colorScheme.primary.withAlpha(50),
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: colorScheme.primary.withAlpha(50),
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 2,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 2,
              ),
            ),
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      Icons.clear_rounded,
                      color: colorScheme.onSurface.withAlpha(128),
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
        const SizedBox(height: 8),
        if (_errorMessage == null)
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 24),
            child: Text(
              'nickname.nickname_rule'.tr(),
              style: TextStyle(
                fontSize: 14,
                color: colorScheme.onSurface.withAlpha(153),
              ),
            ),
          ),
        const SizedBox(height: 8),
        if (_nicknameChecked && _nicknameAvailable)
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 24),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  color: colorScheme.primary,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  'nickname.available'.tr(),
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: (_isValid && !_isChecking)
              ? (_nicknameChecked && _nicknameAvailable
                  ? _submit
                  : _checkNickname)
              : null,
          style: FilledButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            padding: const EdgeInsets.symmetric(vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: _isChecking
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(colorScheme.onPrimary),
                  ),
                )
              : Text(
                  _nicknameChecked && _nicknameAvailable
                      ? 'complete'.tr()
                      : 'nickname.check_availability'.tr(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ],
    );
  }
}
