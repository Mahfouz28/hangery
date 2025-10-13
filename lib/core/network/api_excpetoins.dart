import 'package:dio/dio.dart';
import 'package:hangery/core/network/api_error.dart';

class ApiExcpetoins {
  static ApiError handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        ApiError(message: "Request to API server was cancelled");
        return ApiError(message: "Request to API server was cancelled");
      case DioErrorType.connectionTimeout:
        return ApiError(message: "Connection timeout with API server");
      case DioErrorType.unknown:
        return ApiError(
          message: "Connection to API server failed due to internet connection",
        );
      case DioErrorType.receiveTimeout:
        return ApiError(
          message: "Receive timeout in connection with API server",
        );

      case DioErrorType.badResponse:
        return ApiError(
          statuscode: error.response?.statusCode,
          message:
              error.response?.data['message'] ??
              "Received invalid status code: ${error.response?.statusCode}",
        );
      case DioErrorType.sendTimeout:
        return ApiError(message: "Send timeout in connection with API server");
      case DioErrorType.badCertificate:
        return ApiError(message: "Bad certificate with API server");
      case DioErrorType.connectionError:
        return ApiError(message: "Connection error with API server");
    }
  }
}
