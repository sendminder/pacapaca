import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pacapaca/services/interceptors/auth_interceptor.dart';
import 'package:pacapaca/services/interceptors/response_interceptor.dart';

class DioService {
  static Dio? _instance;

  static Dio get instance {
    _instance ??= Dio(BaseOptions(
      baseUrl: dotenv.get('SENDMIND_API_URL'),
      headers: {'Content-Type': 'application/json'},
    ))
      ..interceptors.addAll([
        AuthInterceptor(),
        ResponseInterceptor(),
      ]);

    return _instance!;
  }
}
