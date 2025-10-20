class UserModel {
  final String? token;
  final String name;
  final String email;
  final String? image;
  final String? visa;
  final String? address;

  UserModel({
    this.token,
    required this.name,
    required this.email,
    this.image,
    this.visa,
    this.address,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      visa: json['Visa'] ?? '',
      address: json['address'] ?? '',
    );
  }

  void operator [](String other) {}
}
