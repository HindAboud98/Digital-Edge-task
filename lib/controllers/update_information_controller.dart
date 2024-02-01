import 'package:country_code_picker/country_code_picker.dart';
import 'package:digital_edge_task/helpers/api_helper.dart';
import 'package:digital_edge_task/models/api_response.dart';
import 'package:digital_edge_task/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateInformationController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    user = Get.arguments;
    if(user == null){
      Get.back();
    }
    nameCtrl = TextEditingController(text: user!.name);
    phoneCtrl = TextEditingController(text: user!.phone);
    emailCtrl = TextEditingController(text: user!.email);
    countryCode = user!.countryCode;
  }

  late final TextEditingController nameCtrl;
  late final TextEditingController phoneCtrl;
  late final TextEditingController emailCtrl;
  User? user;
  final RxBool _isLoading = RxBool(false);
  late final String? countryCode;
  bool get isLoading => _isLoading.value;

  void onCountryChanged(CountryCode c){
    countryCode = c.dialCode;
  }

  Future<void> save() async {
    _isLoading.value = true;

    ApiResponse r = await ApiHelper.apiRequest(path: "user/update",query: {
      "name" : nameCtrl.text,
      "phone" : phoneCtrl.text,
      "email" : emailCtrl.text,
      "country_code" : countryCode
    });
    if(r.success){
      Get.back(result: true);
      _isLoading.value = false;
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

  @override
  void dispose() {
    nameCtrl.dispose();
    phoneCtrl.dispose();
    emailCtrl.dispose();
    super.dispose();
  }
}