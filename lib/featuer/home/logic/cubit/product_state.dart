part of 'product_cubit.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final List<ProductModel> products;
  final UserModel? user;

  ProductSuccess(this.user, {required this.products});
}

final class ProductError extends ProductState {
  final String error;

  ProductError({required this.error});
}
