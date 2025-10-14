class ApiError {
  final int? statuscode;
  String message;

  ApiError({this.statuscode, required this.message});
  @override
  String toString() {
    return message;
  }
}
