import 'package:digital_edge_task/controllers/home_screen_controller.dart';
import 'package:get/get.dart';

class HomeScreenBindings implements Bindings{

  @override
  void dependencies() {
    Get.put<HomeScreenController>(HomeScreenController());
  }

}