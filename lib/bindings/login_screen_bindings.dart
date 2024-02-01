import 'package:digital_edge_task/controllers/login_screen_controller.dart';
import 'package:get/get.dart';

class LoginScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginScreenController>(LoginScreenController());
  }

}