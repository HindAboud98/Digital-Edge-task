class ApiResponse {
  ApiResponse({this.data, this.success = true, this.message});
  dynamic data;
  bool success;
  String? message;
}