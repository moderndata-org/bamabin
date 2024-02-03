import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/screens/home_screen.dart';
import 'package:bamabin/screens/part_screen.dart';
import 'package:bamabin/widgets/custom_bottom_navigation.dart';
import 'package:bamabin/widgets/custom_drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/main_controller.dart';
import '../widgets/custom_main_appbar.dart';

class MainScreen extends GetView<PublicController> {
  MainScreen({super.key});
  final mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: mainController.scaffolState,
      endDrawer: CustomDrawerMenu(),
      bottomNavigationBar: CustomBottomNavigation(),
      backgroundColor: cPrimary,
      body: Stack(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height,
            child: Obx(() {
              return IndexedStack(
                index: mainController.bottomIndex.value,
                children: [
                  HomeScreen(),
                  PartScreen(),
                  PartScreen(),
                  PartScreen(),
                  PartScreen(),
                ],
              );
            }),
          ),
          //! Appbar
          Positioned(top: 0, left: 0, right: 0, child: CustomMainAppBar())
        ],
      ),
    ));
  }
}
