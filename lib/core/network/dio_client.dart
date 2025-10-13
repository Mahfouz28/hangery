import 'package:dio/dio.dart';
import 'package:hangery/core/utils/pref_helpers.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://sonic-zdi0.onrender.com/api',

      headers: {'Content-Type': 'application/json'},
    ),
  );
  DioClient() {
    _dio.interceptors.add(
      // LogInterceptor(requestBody: true, responseBody: true, error: true),
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await PrefHelpers.getToken() ?? '';

          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );
  }
  Dio get dio => _dio;
}
