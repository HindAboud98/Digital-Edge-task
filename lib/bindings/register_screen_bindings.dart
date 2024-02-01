import 'package:digital_edge_task/controllers/register_screen_controller.dart';
import 'package:get/get.dart';

class RegisterScreenBindings implements Bindings{

  @override
  void dependencies() {
    Get.put<RegisterScreenController>(RegisterScreenController());
  }
}