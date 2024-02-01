import 'package:digital_edge_task/helpers/api_helper.dart';
import 'package:digital_edge_task/models/api_response.dart';
import 'package:digital_edge_task/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user.dart';

class HomeScreenController extends GetxController{
  @override
  void onInit() async {
    super.onInit();
    service = Get.find();
    await _getData();
  }
  late UserService service;
  final Rx<User?> _userInfo = Rx(null);

  User? get userInfo => _userInfo.value;

  Future<void> _getData() async {
    _userInfo.value = null;
    ApiResponse r = await ApiHelper.apiRequest(path: "user/${service.userId}",method: "GET");
    if(r.success){
      _userInfo.value = User.fromJson(r.data);
    } else {
      Get.snackbar(
        "Error",
        r.message ?? "error",
        snackPosition: SnackPosition.BOTTOM,
        isDismissible: true,
        margin: const EdgeInsets.only(bottom: 10),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 5),
      );
    }
  }

  void onUpdateInfoTapped() async {
    bool result = await Get.toNamed("/update-info",arguments: userInfo);
    if(result){
      await _getData();
      Get.snackbar(
        "Success",
        "Your information is updated successfully",
        snackPosition: SnackPosition.BOTTOM,
        isDismissible: true,
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 5),
        margin: const EdgeInsets.only(bottom: 10,right: 10,left: 10),
      );
    }
  }
}