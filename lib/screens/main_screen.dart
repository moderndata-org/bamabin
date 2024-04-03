import 'package:bamabin/constant/classes.dart';
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
      body: Container(
        width: mainController.width.value,
        height: mainController.height.value,
        child: Stack(
          children: [
            SizedBox(
              width: mainController.width.value,
              height: mainController.height.value,
              child: PageView(
                reverse: true,
                controller: mainController.pageController,
                children: [
                  HomeScreen(),
                  PartScreen(),
                  PartScreen(),
                  PartScreen(),
                  PartScreen(),
                ],
                onPageChanged: (value) {
                  switch (value) {
                    case 0:
                      mainController.selectedBottomNav(BottomNavType.home);
                      break;
                    case 1:
                      mainController.isVisibleAppbar(true);
                      mainController.selectedBottomNav(BottomNavType.movies);
                      mainController.appBarCenterText('فیلم');
                      mainController.runBottomNavAnimation();
                      break;
                    case 2:
                      mainController.isVisibleAppbar(true);
                      mainController.selectedBottomNav(BottomNavType.series);
                      mainController.appBarCenterText('سریال');
                      mainController.runBottomNavAnimation();
                      break;
                    case 3:
                      mainController.isVisibleAppbar(true);
                      mainController
                          .selectedBottomNav(BottomNavType.animations);
                      mainController.appBarCenterText('انیمیشن');
                      mainController.runBottomNavAnimation();
                      break;
                    case 4:
                      mainController.isVisibleAppbar(true);
                      mainController.selectedBottomNav(BottomNavType.anime);
                      mainController.appBarCenterText('انیمه');
                      mainController.runBottomNavAnimation();
                      break;
                  }
                },
              ),
            ),
            //! Appbar
            Positioned(top: 0, left: 0, right: 0, child: CustomMainAppBar())
          ],
        ),
      ),
    ));
  }
}
