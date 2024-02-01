import 'package:digital_edge_task/controllers/update_information_controller.dart';
import 'package:get/get.dart';

class UpdateInformationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<UpdateInformationController>(UpdateInformationController());
  }

}