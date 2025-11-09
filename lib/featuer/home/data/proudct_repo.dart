import 'package:hangery/core/network/api_services.dart';
import 'package:hangery/featuer/home/data/product_model.dart';

class ProductRepo {
  final ApiServices apiServices = ApiServices();

  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await apiServices.get('/products');
      print('Response => $response');

      final data = response['data'] as List;
      return data.map((item) => ProductModel.fromJson(item)).toList();
    } catch (e, stack) {
      print(' Error loading products: $e');
      print(stack);
      return [];
    }
  }
}
