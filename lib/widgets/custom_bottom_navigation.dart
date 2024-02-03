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
                controller.bottomIndex(0);
                controller.runBottomNavAnimation();
              },
              iconActive: 'assets/svg/home_s.svg',
              iconDeactive: 'assets/svg/home_d.svg',
              isActive: controller.bottomIndex.value == 0,
              title: 'خانه',
            );
          }),
          Obx(() {
            return BottomNavButtonWidget(
              onTap: () {
                controller.bottomIndex(1);
                controller.appBarCenterText('فیلم');
                controller.runBottomNavAnimation();
              },
              iconActive: 'assets/svg/film_s.svg',
              iconDeactive: 'assets/svg/film_d.svg',
              isActive: controller.bottomIndex.value == 1,
              title: 'فیلم',
            );
          }),
          Obx(() {
            return BottomNavButtonWidget(
              onTap: () {
                controller.bottomIndex(2);
                controller.appBarCenterText('سریال');
                controller.runBottomNavAnimation();
              },
              iconActive: 'assets/svg/serial_s.svg',
              iconDeactive: 'assets/svg/serial_d.svg',
              isActive: controller.bottomIndex.value == 2,
              title: 'سریال',
            );
          }),
          Obx(() {
            return BottomNavButtonWidget(
              onTap: () {
                controller.bottomIndex(3);
                controller.appBarCenterText('انیمیشن');
                controller.runBottomNavAnimation();
              },
              iconActive: 'assets/svg/animation_s.svg',
              iconDeactive: 'assets/svg/animation_d.svg',
              isActive: controller.bottomIndex.value == 3,
              title: 'انیمیشن',
            );
          }),
          Obx(() {
            return BottomNavButtonWidget(
              onTap: () {
                controller.bottomIndex(4);
                controller.appBarCenterText('انیمه');
                controller.runBottomNavAnimation();
              },
              iconActive: 'assets/svg/anime_s.svg',
              iconDeactive: 'assets/svg/anime_d.svg',
              isActive: controller.bottomIndex.value == 4,
              title: 'انیمه',
            );
          }),
        ],
      ),
    );
  }
}
