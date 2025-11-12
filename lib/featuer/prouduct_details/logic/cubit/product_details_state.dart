part of 'product_details_cubit.dart';

abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsSuccess extends ProductDetailsState {
  final List<ProuductDetailsModel> toppings;
  final List<ProuductDetailsModel> sideoptions;

  ProductDetailsSuccess(this.toppings, this.sideoptions);
}

class ProductDetailsError extends ProductDetailsState {
  final String? errorMessage;
  ProductDetailsError(this.errorMessage);
}

class AddToCartLoading extends ProductDetailsState {}

class AddToCartSuccess extends ProductDetailsState {
  final String successMessage;
  AddToCartSuccess({required this.successMessage});
}

class AddToCartFailure extends ProductDetailsState {
  final String errMessage;
  AddToCartFailure({required this.errMessage});
}
