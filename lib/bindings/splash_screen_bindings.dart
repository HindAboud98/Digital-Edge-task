import 'package:digital_edge_task/controllers/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreenBindings implements Bindings{
  @override
  void dependencies() {
    Get.put<SplashScreenController>(SplashScreenController());
  }

}