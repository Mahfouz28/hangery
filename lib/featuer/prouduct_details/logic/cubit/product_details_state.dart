part of 'product_details_cubit.dart';

sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsSuccess extends ProductDetailsState {
  final List<ProuductDetailsModel> toppings;
  final List<ProuductDetailsModel> sideoptions;

  ProductDetailsSuccess(this.toppings, this.sideoptions);
}

final class ProductDetailsError extends ProductDetailsState {
  final String error;

  ProductDetailsError(this.error);
}
