part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {
  final GetCartResponseModel cartModel;
  final String successMessage;
  final bool isDeleting;

  CartSuccess({
    required this.cartModel,
    required this.successMessage,
    this.isDeleting = false,
  });
}

final class CartFailure extends CartState {
  final String errMessage;

  CartFailure({required this.errMessage});
}

final class DeleteCartLoading extends CartState {}

final class DeleteCartSuccess extends CartState {
  final String successMessage;

  DeleteCartSuccess({required this.successMessage});
}

final class DeleteCartFailure extends CartState {
  final String errMessage;

  DeleteCartFailure({required this.errMessage});
}
