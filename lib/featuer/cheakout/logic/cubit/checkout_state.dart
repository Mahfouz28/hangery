part of 'checkout_cubit.dart';

sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutSuccess extends CheckoutState {
  final bool isloading = false;
  final String message;

  CheckoutSuccess(this.message);
}

final class CheckoutFailure extends CheckoutState {
  final String error;

  CheckoutFailure(this.error);
}
