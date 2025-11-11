import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangery/core/network/api_services.dart';
import 'package:hangery/featuer/prouduct_details/data/prouduct_details_model.dart';
import 'package:hangery/featuer/prouduct_details/data/prouduct_details_repo.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProuductDetailsRepo prouductDetailsRepo = ProuductDetailsRepo(
    ApiServices(),
  );
  ProductDetailsCubit() : super(ProductDetailsInitial());
  Future<void> productDetailes() async {
    emit(ProductDetailsLoading());
    try {
      final toppings = await prouductDetailsRepo.toppings();
      final sideoptions = await prouductDetailsRepo.sideoptions();
      emit(ProductDetailsSuccess(toppings, sideoptions));

      print(toppings + sideoptions);
    } catch (e) {
      emit(ProductDetailsError(e.toString()));
    }
  }
}
