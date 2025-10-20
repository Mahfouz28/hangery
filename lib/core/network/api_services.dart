import 'package:dio/dio.dart';
import 'package:hangery/core/network/api_excpetoins.dart';
import 'package:hangery/core/network/dio_client.dart';

class ApiServices {
  final DioClient dioClient = DioClient();

  // GET
  Future<dynamic> get(String endPoint) async {
    try {
      final response = await dioClient.dio.get(endPoint);
      return response.data;
    } on DioException catch (e) {
      throw ApiExcpetoins.handleError(e);
    }
  }

  // POST
  Future<dynamic> post(String endPoint, dynamic data) async {
    try {
      final response = await dioClient.dio.post(endPoint, data: data);
      return response.data;
    } on DioException catch (e) {
      throw ApiExcpetoins.handleError(e);
    }
  }

  // PUT
  Future<dynamic> put(String endPoint, Map<String, dynamic> data) async {
    try {
      final response = await dioClient.dio.put(endPoint, data: data);
      return response.data;
    } on DioException catch (e) {
      throw ApiExcpetoins.handleError(e);
    }
  }

  // DELETE
  Future<dynamic> delete(String endPoint) async {
    try {
      final response = await dioClient.dio.delete(endPoint);
      return response.data;
    } on DioException catch (e) {
      throw ApiExcpetoins.handleError(e);
    }
  }
}
