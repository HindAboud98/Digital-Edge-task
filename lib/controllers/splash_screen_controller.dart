import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  void onTapLogin(){
    Get.toNamed("/login");
  }
  void onTapRegister(){
    Get.toNamed("/register");
  }
}