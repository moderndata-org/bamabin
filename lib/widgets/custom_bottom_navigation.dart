import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/colors.dart';
import 'bottomnav_item_widget.dart';

class CustomBottomNavigation extends GetView<MainController> {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: cPrimaryDark,
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Obx(() {
            return BottomNavButtonWidget(
              onTap: () async {
                controller.isVisibleAppbar(true);
                controller.selectedBottomNav(BottomNavType.home);
                controller.runBottomNavAnimation();
              },
              iconActive: 'assets/svg/home_s.svg',
              iconDeactive: 'assets/svg/home_d.svg',
              isActive:
                  controller.selectedBottomNav.value == BottomNavType.home,
              title: 'خانه',
            );
          }),
          Obx(() {
            return BottomNavButtonWidget(
              onTap: () {
                if (controller.isLoadingData.isFalse) {
                  controller.isVisibleAppbar(true);
                  controller.selectedBottomNav(BottomNavType.movies);
                  controller.appBarCenterText('فیلم');
                  controller.runBottomNavAnimation();
                }
              },
              iconActive: 'assets/svg/film_s.svg',
              iconDeactive: 'assets/svg/film_d.svg',
              isActive:
                  controller.selectedBottomNav.value == BottomNavType.movies,
              title: 'فیلم',
            );
          }),
          Obx(() {
            return BottomNavButtonWidget(
              onTap: () {
                if (controller.isLoadingData.isFalse) {
                  controller.isVisibleAppbar(true);
                  controller.selectedBottomNav(BottomNavType.series);
                  controller.appBarCenterText('سریال');
                  controller.runBottomNavAnimation();
                }
              },
              iconActive: 'assets/svg/serial_s.svg',
              iconDeactive: 'assets/svg/serial_d.svg',
              isActive:
                  controller.selectedBottomNav.value == BottomNavType.series,
              title: 'سریال',
            );
          }),
          Obx(() {
            return BottomNavButtonWidget(
              onTap: () {
                if (controller.isLoadingData.isFalse) {
                  controller.isVisibleAppbar(true);
                  controller.selectedBottomNav(BottomNavType.animations);
                  controller.appBarCenterText('انیمیشن');
                  controller.runBottomNavAnimation();
                }
              },
              iconActive: 'assets/svg/animation_s.svg',
              iconDeactive: 'assets/svg/animation_d.svg',
              isActive: controller.selectedBottomNav.value ==
                  BottomNavType.animations,
              title: 'انیمیشن',
            );
          }),
          Obx(() {
            return BottomNavButtonWidget(
              onTap: () {
                if (controller.isLoadingData.isFalse) {
                  controller.isVisibleAppbar(true);
                  controller.selectedBottomNav(BottomNavType.anime);
                  controller.appBarCenterText('انیمه');
                  controller.runBottomNavAnimation();
                }
              },
              iconActive: 'assets/svg/anime_s.svg',
              iconDeactive: 'assets/svg/anime_d.svg',
              isActive:
                  controller.selectedBottomNav.value == BottomNavType.anime,
              title: 'انیمه',
            );
          }),
        ],
      ),
    );
  }
}
