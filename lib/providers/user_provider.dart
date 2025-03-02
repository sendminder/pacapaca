import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
import 'package:pacapaca/services/user_service.dart';

part 'user_provider.g.dart';

@riverpod
class UserDetail extends _$UserDetail {
  final _userService = GetIt.instance<UserService>();

  @override
  Future<UserDTO?> build(int userId) async {
    return _userService.getUserById(userId);
  }

  Future<void> refreshUser() async {
    state = const AsyncValue.loading();
    try {
      final user = await _userService.getUserById(userId);
      state = AsyncValue.data(user);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
