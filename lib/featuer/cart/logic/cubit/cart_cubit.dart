import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangery/featuer/cart/data/cart_model.dart';
import 'package:hangery/featuer/cart/data/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  final CartRepo cartRepo = CartRepo();
  Future<void> fetchCartData() async {
    emit(CartLoading());
    try {
      final cartData = await cartRepo.getCartData();
      print(cartData);
      emit(CartSuccess(cartModel: cartData, successMessage: cartData.message));
    } catch (e) {
      emit(CartFailure(errMessage: e.toString()));
      print(e);
    }
  }

  /// delete cart item
  Future<void> deleteCartItem(int cartID) async {
    if (state is CartSuccess) {
      final current = state as CartSuccess;
      emit(
        CartSuccess(
          cartModel: current.cartModel,
          successMessage: current.successMessage,
          isDeleting: true,
        ),
      );
    }

    try {
      await cartRepo.deleteCartItem(cartID);

      final cartData = await cartRepo.getCartData();

      emit(
        CartSuccess(cartModel: cartData, successMessage: 'تم حذف العنصر بنجاح'),
      );
    } catch (e) {
      emit(CartFailure(errMessage: e.toString()));
    }
  }
}
