import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/controller/main_controller.dart';
import 'package:bamabin/controller/player_controller.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:get/get.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      AuthController(),
    );
    Get.put(
      PublicController(),
    );
    Get.put(
      PlayerController(),
    );
    Get.put(
      MainController(),
    );
  }
}
