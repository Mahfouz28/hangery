import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangery/featuer/cart/data/cart_model.dart';
import 'package:hangery/featuer/cheakout/data/checkout_repo.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());
  final CheckOutRepo checkOutRepo = CheckOutRepo();

  Future<void> saveOrder(List<CartModel> cartItems) async {
    emit(CheckoutLoading());
    try {
      final request = CartRequestModel(items: cartItems);

      await checkOutRepo.saveOrder(request);
      emit(CheckoutSuccess('Order saved successfully'));
    } catch (e) {
      emit(CheckoutFailure(e.toString()));
    }
  }
}
