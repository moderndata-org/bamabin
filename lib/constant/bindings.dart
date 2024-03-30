import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/controller/detail_controller.dart';
import 'package:bamabin/controller/download_manager_controller.dart';
import 'package:bamabin/controller/favorite_controller.dart';
import 'package:bamabin/controller/main_controller.dart';
import 'package:bamabin/controller/notification_controller.dart';
import 'package:bamabin/controller/payment_controller.dart';
import 'package:bamabin/controller/player_controller.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/controller/recent_controller.dart';
import 'package:bamabin/controller/ticket_controller.dart';
import 'package:get/get.dart';

import '../controller/new_player_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      NotificationController(),
    );
    Get.put(
      PaymentController(),
    );
    Get.put(
      AuthController(),
    );
    Get.put(
      FavoriteController(),
    );
    Get.put(
      DetailController(),
    );
    Get.put(
      PublicController(),
    );
    Get.put(
      PlayerController(),
    );
    Get.put(
      NewPlayerController(),
    );
    Get.put(
      MainController(),
    );
    Get.put(
      TicketController(),
    );
    Get.put(
      RecentContoller(),
    );
    // Get.put(
    //   DownloadManagerController(),
    // );
  }
}
