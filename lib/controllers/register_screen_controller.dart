import 'package:country_code_picker/country_code_picker.dart';
import 'package:digital_edge_task/helpers/api_helper.dart';
import 'package:digital_edge_task/models/api_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/user_service.dart';

class RegisterScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    nameCtrl = TextEditingController();
    phoneCtrl = TextEditingController();
    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    confirmPasswordCtrl = TextEditingController();
    service = Get.find();
    countryCode = "+971";
  }

  late final TextEditingController nameCtrl;
  late final TextEditingController phoneCtrl;
  late final TextEditingController emailCtrl;
  late final TextEditingController passwordCtrl;
  late final TextEditingController confirmPasswordCtrl;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late UserService service;
  final RxBool _isLoading = RxBool(false);
  late final String countryCode;

  final RxBool _showPassword = RxBool(true);
  final RxBool _showConfirmPassword = RxBool(true);

  bool get isLoading => _isLoading.value;
  bool get showPassword => _showPassword.value;
  bool get showConfirmPassword => _showConfirmPassword.value;

  void toggleShowPassword(){
    _showPassword.value = !_showPassword.value;
  }

  void toggleShowConfirmPassword(){
    _showConfirmPassword.value = !_showConfirmPassword.value;
  }
  void onLoginTapped() {
    Get.offNamed("/login");
  }

  void onCountryChanged(CountryCode c){
    countryCode = c.dialCode!;
  }

  Future<void> register() async {
    if(formKey.currentState!.validate()){
      ApiResponse r = await ApiHelper.apiRequest(path: "user/register",hasToken: false,query: {
        "name" : nameCtrl.text,
        "email" : emailCtrl.text,
        "phone" : phoneCtrl.text,
        "country_code" : countryCode,
        "password" : passwordCtrl.text,
        "password_confirm" : confirmPasswordCtrl.text,
      });
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

  @override
  void dispose() {
    emailCtrl.dispose();
    nameCtrl.dispose();
    phoneCtrl.dispose();
    passwordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    super.dispose();
  }
}