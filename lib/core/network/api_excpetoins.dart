import 'package:dio/dio.dart';
import 'package:hangery/core/network/api_error.dart';

class ApiExcpetoins {
  static ApiError handleError(DioException error) {
    if (error.response?.data is Map &&
        error.response?.data['message'] != null) {
      return ApiError(
        statuscode: error.response?.statusCode,
        message: error.response?.data['message'] ?? 'Server error occurred',
      );
    }

    if (error.response?.data is String) {
      return ApiError(
        statuscode: error.response?.statusCode,
        message: error.response?.data ?? 'Unknown server error',
      );
    }
    if (error.message != null && error.message!.contains('SocketException')) {
      return ApiError(message: 'No internet connection');
    }
    if (error.response?.statusCode == 422 ||
        error.response?.statusCode == 302) {
      return ApiError(message: "The email has already been taken.");
    }

    switch (error.type) {
      case DioExceptionType.cancel:
        return ApiError(message: 'Request to server was cancelled');

      case DioExceptionType.connectionTimeout:
        return ApiError(message: 'Connection timeout with API server');

      case DioExceptionType.sendTimeout:
        return ApiError(message: 'Send timeout in connection with API server');

      case DioExceptionType.receiveTimeout:
        return ApiError(message: 'Receive timeout from API server');

      case DioExceptionType.badCertificate:
        return ApiError(message: 'Bad certificate from API server');

      case DioExceptionType.connectionError:
        return ApiError(message: 'No internet connection');

      case DioExceptionType.unknown:
        return ApiError(message: 'Unexpected error occurred');

      case DioExceptionType.badResponse:
        final code = error.response?.statusCode;
        final message = error.response?.data is Map
            ? error.response?.data['message'] ?? 'Bad response from server'
            : 'Invalid server response (status: $code)';
        return ApiError(message: message);
    }
  }
}
