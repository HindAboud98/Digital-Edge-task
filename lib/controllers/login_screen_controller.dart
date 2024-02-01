import 'package:digital_edge_task/helpers/api_helper.dart';
import 'package:digital_edge_task/models/api_response.dart';
import 'package:digital_edge_task/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    service = Get.find();
  }

  late final TextEditingController emailCtrl;
  late final TextEditingController passwordCtrl;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late UserService service;
  final RxBool _isLoading = RxBool(false);
  final RxBool _showPassword = RxBool(true);

  bool get isLoading => _isLoading.value;
  bool get showPassword => _showPassword.value;

  void toggleShowPassword(){
    _showPassword.value = !_showPassword.value;
  }

  Future<void> login() async {
    _isLoading.value = true;
    if (formKey.currentState!.validate()) {
      ApiResponse r = await ApiHelper.apiRequest(
          path: "login",
          hasToken: false,
          query: {"email": emailCtrl.text, "password": passwordCtrl.text});
      if (r.success) {
        service.token = r.data["token"];
        service.userId = r.data["id"];
        _isLoading.value = false;
        Get.offAllNamed("/home");
      } else {
        _isLoading.value = false;
        Get.snackbar(
          "Error",
          r.message ?? "error",
          snackPosition: SnackPosition.BOTTOM,
          isDismissible: true,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
          margin: const EdgeInsets.only(bottom: 10),
        );
      }
    }
  }

  void onRegisterTapped() {
    Get.offNamed("/register");
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }
}
