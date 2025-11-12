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

  List<ProductModel> _allProducts = [];
  UserModel? _user;

  Future<void> getAllProduct() async {
    try {
      emit(ProductLoading());
      final products = await proudctRepo.getAllProducts();
      final user = await authRepo.getProfilrData();

      _allProducts = products;
      _user = user;

      emit(ProductSuccess(_user, products: _allProducts));
      print('Products loaded: ${products.length}');
    } catch (e) {
      emit(ProductError(error: e.toString()));
    }
  }

  Future<void> checkLogin() async {
    await AuthManager.init();
    if (AuthManager.isLoggedIn) {
      print('User is logged in');
      await getAllProduct();
    } else {
      print('User not logged in');
      emit(ProductError(error: 'User not logged in'));
    }
  }

  void searchProducts(String query) {
    if (state is! ProductSuccess) return;

    if (query.isEmpty) {
      emit(ProductSuccess(_user, products: _allProducts));
    } else {
      final filtered = _allProducts
          .where(
            (p) =>
                p.name.toLowerCase().contains(query.toLowerCase()) ||
                p.description.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();

      emit(ProductSuccess(_user, products: filtered));
    }
  }
}
