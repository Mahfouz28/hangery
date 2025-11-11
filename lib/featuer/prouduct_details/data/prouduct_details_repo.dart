import 'package:hangery/core/network/api_services.dart';
import 'package:hangery/featuer/prouduct_details/data/prouduct_details_model.dart';

class ProuductDetailsRepo {
  final ApiServices apiServices;
  ProuductDetailsRepo(this.apiServices);
  Future<List<ProuductDetailsModel>> toppings() async {
    final response = await apiServices.get('/toppings');
    final data = response['data'] as List;
    return data
        .map((toppings) => ProuductDetailsModel.fromJson(toppings))
        .toList();
  }

  Future<List<ProuductDetailsModel>> sideoptions() async {
    final response = await apiServices.get('/side-options');
    final data = response['data'] as List;
    return data
        .map((sideoptions) => ProuductDetailsModel.fromJson(sideoptions))
        .toList();
  }
}
