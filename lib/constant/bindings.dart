import 'package:bamabin/controller/auth_controller.dart';
import 'package:get/get.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      AuthController(),
    );
  }
}
