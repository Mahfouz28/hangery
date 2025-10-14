import 'package:dio/dio.dart';
import 'package:hangery/core/network/api_error.dart';
import 'package:hangery/core/network/api_excpetoins.dart';
import 'package:hangery/core/network/api_services.dart';
import 'package:hangery/core/utils/pref_helpers.dart';
import 'package:hangery/featuer/auth/data/auth_model.dart';

class AuthRepo {
  final ApiServices apiServices;
  AuthRepo(this.apiServices);

  /// ---------------------------- LOGIN ----------------------------
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiServices.post('/login', {
        'email': email,
        'password': password,
      });

      if (response is ApiError) {
        throw ApiError(
          message: response.message,
          statuscode: response.statuscode,
        );
      }

      if (response is! Map || response['data'] == null) {
        final msg = response?['message'] ?? 'Invalid response from server';
        throw ApiError(message: msg);
      }

      final user = UserModel.fromJson(response['data']);

      if (user.token != null && user.token!.isNotEmpty) {
        await PrefHelpers.saveToken(user.token!);
      }

      return user;
    } on DioException catch (e) {
      final errorMsg = ApiExcpetoins.handleError(e);
      throw errorMsg;
    } on ApiError {
      rethrow; // preserve the message
    } catch (e) {
      throw ApiError(message: 'Unexpected error, please try again later.');
    }
  }

  /// ---------------------------- REGISTER ----------------------------
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiServices.post('/register', {
        'name': name,
        'email': email,
        'password': password,
      });

      if (response is ApiError) {
        throw ApiError(
          message: response.message,
          statuscode: response.statuscode,
        );
      }

      if (response is! Map || response['data'] == null) {
        final msg = response?['message'] ?? 'Invalid response from server';
        throw ApiError(message: msg);
      }

      final user = UserModel.fromJson(response['data']);

      if (user.token != null && user.token!.isNotEmpty) {
        await PrefHelpers.saveToken(user.token!);
      }

      return user;
    } on DioException catch (e) {
      final errorMsg = ApiExcpetoins.handleError(e);
      throw errorMsg;
    } on ApiError {
      rethrow;
    } catch (e) {
      throw ApiError(message: 'Unexpected error, please try again later.');
    }
  }
}
