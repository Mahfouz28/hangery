import 'package:hangery/core/network/api_error.dart';
import 'package:hangery/core/network/api_services.dart';
import 'package:hangery/featuer/cart/data/cart_model.dart';

class CartRepo {
  final ApiServices apiServices = ApiServices();

  Future<void> addToCart(CartRequestModel requestData) async {
    try {
      final response = await apiServices.post(
        '/cart/add',
        requestData.toJson(),
      );

      if (response['code'] == 200) {
        print('Item added successfully: ${response['message']}');
        return;
      } else {
        print('Failed to add item: ${response['message']}');
        throw ApiError(message: response['message'] ?? 'Failed to add item');
      }
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  /// get cart
  Future<GetCartResponseModel> getCartData() async {
    try {
      final response = await apiServices.get('/cart');
      if (response is ApiError) {
        throw ApiError(message: response.message);
      }

      return GetCartResponseModel.fromJson(response);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  /// delete cart item
  Future<void> deleteCartItem(int cartID) async {
    try {
      final response = await apiServices.delete('/cart/remove/$cartID');
      if (response['code'] == 200) {
        print('Item deleted successfully: ${response['message']}');
        return;
      } else {
        print('Failed to delete item: ${response['message']}');
        throw ApiError(message: response['message'] ?? 'Failed to delete item');
      }
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }
}
