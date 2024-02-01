import 'package:digital_edge_task/services/user_service.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<UserService>(UserService());
  }

}