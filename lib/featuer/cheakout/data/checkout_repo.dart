import 'package:hangery/core/network/api_services.dart';
import 'package:hangery/featuer/cart/data/cart_model.dart';

class CheckOutRepo {
  final ApiServices apiServices = ApiServices();

  Future<String> saveOrder(CartRequestModel order) async {
    try {
      await apiServices.post('/orders', order.toJson());
      return 'Order saved successfully';
    } catch (e) {
      throw Exception('Failed to save order: $e');
    }
  }
}
