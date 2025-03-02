import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pacapaca/models/dto/common_dto.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
import 'package:pacapaca/services/dio_service.dart';

class UserService {
  final Dio _dio = DioService.instance;
  final logger = GetIt.instance<Logger>();

  /// 사용자 ID로 사용자 정보 조회
  Future<UserDTO?> getUserById(int userId) async {
    try {
      final response = await _dio.get('/v1/users/$userId');

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final userResponse =
            ResponseGetUserByID.fromJson(responseRest.response!);
        return userResponse.user;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('get user by id', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
