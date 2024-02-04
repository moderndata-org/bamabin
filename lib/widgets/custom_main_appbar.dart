import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/controller/main_controller.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/colors.dart';
import 'MyTextButton.dart';

class CustomMainAppBar extends GetView<MainController> {
  const CustomMainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedContainer(
          duration: Duration(
            milliseconds: 500,
          ),
          alignment: Alignment.center,
          height: 60,
          decoration: BoxDecoration(
              gradient: controller.isVisibleAppbar.value
                  ? null
                  : controller.selectedBottomNav.value != BottomNavType.home
                      ? null
                      : LinearGradient(
                          colors: [cPrimaryDark, Colors.transparent],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              SizedBox(
                width: 10,
              ),
              MyTextButton(
                  onTap: () =>
                      controller.scaffolState.currentState!.openEndDrawer(),
                  bgColor: Colors.transparent,
                  size: Size(40, 40),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                          top: 0,
                          left: -4,
                          child: Icon(
                            Icons.menu_rounded,
                            color: cW,
                            shadows: [bs010of],
                          ))
                    ],
                  )),
              Spacer(),
              Obx(() {
                Widget center = SizedBox();
                if (controller.isVisibleAppbar.value) {
                  if (controller.selectedBottomNav.value !=
                      BottomNavType.home) {
                    center = MyText(
                      text: '${controller.appBarCenterText}',
                      size: 19,
                      color: cW,
                      fontWeight: FontWeight.w900,
                      shadows: [bsText],
                    );
                  } else {
                    center = SizedBox(
                        height: 50,
                        child: Image.asset('assets/images/ic_logotype.png'));
                  }
                } else if (controller.selectedBottomNav.value !=
                    BottomNavType.home) {
                  center = MyText(
                    text: '${controller.appBarCenterText}',
                    size: 17,
                    color: cY,
                  );
                }
                return AnimatedOpacity(
                    duration: Duration(
                      milliseconds: 500,
                    ),
                    opacity: controller.isVisibleAppbar.value ? 1 : 0,
                    child: center);
              }),
              Spacer(),
              MyTextButton(
                  onTap: () {
                    Get.toNamed('/search');
                  },
                  bgColor: Colors.transparent,
                  size: Size(40, 40),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -2,
                        left: -3,
                        child: Icon(
                          Icons.manage_search,
                          color: cW,
                          shadows: [bs010of],
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                width: 10,
              ),
            ],
          ));
    });
  }
}
