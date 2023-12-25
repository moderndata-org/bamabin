import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/screens/home_screen.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/custom_bottom_navigation.dart';
import 'package:bamabin/widgets/custom_drawer_menu.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/bottomnav_item_widget.dart';
import '../widgets/custom_main_appbar.dart';
import '../widgets/gener_item_main_widget.dart';
import '../widgets/main_title_widget.dart';
import '../widgets/movie_item_widget.dart';

class MainScreen extends GetView<PublicController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          key: controller.scaffolState,
          endDrawer: CustomDrawerMenu(),
          bottomNavigationBar: CustomBottomNavigation(),
          backgroundColor: cPrimary,
          body: Stack(
            children: [
              SizedBox(
                width: Get.width,
                height: Get.height,
                child: Obx(() {
                  return IndexedStack(index: controller.bottomIndex.value,children: [
                    SizedBox(),
                    SizedBox(),
                    HomeScreen(),
                    SizedBox(),
                    SizedBox(),
                  ],);
                }),
              ),
              //! Appbar
              Positioned(top: 0, left: 0, right: 0, child: CustomMainAppBar())
            ],
          ),
        ));
  }
}
