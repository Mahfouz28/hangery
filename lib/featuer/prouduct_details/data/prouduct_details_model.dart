class ProuductDetailsModel {
  final String name;
  final String image;

  ProuductDetailsModel({required this.name, required this.image});
  factory ProuductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProuductDetailsModel(name: json['name'], image: json['image']);
  }
}
