import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangery/core/network/api_services.dart';
import 'package:hangery/core/utils/auth_manger.dart';
import 'package:hangery/featuer/auth/data/auth_model.dart';
import 'package:hangery/featuer/auth/data/auth_repo.dart';
import 'package:hangery/featuer/home/data/product_model.dart';
import 'package:hangery/featuer/home/data/proudct_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  final ProductRepo proudctRepo = ProductRepo();
  final AuthManager authManager = AuthManager();
  final AuthRepo authRepo = AuthRepo(ApiServices());

  Future<void> getAllProduct() async {
    try {
      emit(ProductLoading());
      final products = await proudctRepo.getAllProducts();
      final user = await authRepo.getProfilrData();

      emit(ProductSuccess(user, products: products));

      print('Products loaded: ${products.length}');
    } catch (e) {
      emit(ProductError(error: e.toString()));
    }
  }

  Future<void> checkLogin() async {
    await AuthManager.init();
    if (AuthManager.isLoggedIn) {
      print(' User is logged in');
      await getAllProduct();
    } else {
      print(' User not logged in');
      emit(ProductError(error: 'User not logged in'));
    }
  }
}
