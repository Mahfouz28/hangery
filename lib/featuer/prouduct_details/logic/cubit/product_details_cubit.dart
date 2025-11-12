import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangery/core/network/api_services.dart';
import 'package:hangery/featuer/cart/data/cart_model.dart';
import 'package:hangery/featuer/cart/data/cart_repo.dart';
import 'package:hangery/featuer/prouduct_details/data/prouduct_details_model.dart';
import 'package:hangery/featuer/prouduct_details/data/prouduct_details_repo.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProuductDetailsRepo prouductDetailsRepo = ProuductDetailsRepo(
    ApiServices(),
  );
  final CartRepo cartRepo = CartRepo();

  ProductDetailsCubit() : super(ProductDetailsInitial());
  ProductDetailsSuccess? lastLoadedDetails;

  /// ================== Load Product Details ==================
  Future<void> productDetails() async {
    emit(ProductDetailsLoading());
    try {
      final toppings = await prouductDetailsRepo.toppings();
      final sideoptions = await prouductDetailsRepo.sideoptions();

      emit(ProductDetailsSuccess(toppings, sideoptions));

      print('Toppings Loaded: ${toppings.length}');
      print('Side Options Loaded: ${sideoptions.length}');
    } catch (e) {
      emit(ProductDetailsError(e.toString()));
    }
  }

  /// ================== Add to Cart ==================
  Future<void> addToCart(CartModel cartData) async {
    try {
      emit(AddToCartLoading());

      await cartRepo.addToCart(CartRequestModel(items: [cartData]));

      emit(
        AddToCartSuccess(successMessage: "Item added to cart successfully!"),
      );

      if (lastLoadedDetails != null) emit(lastLoadedDetails!);
    } catch (e) {
      emit(AddToCartFailure(errMessage: e.toString()));

      if (lastLoadedDetails != null) emit(lastLoadedDetails!);
    }
  }
}
