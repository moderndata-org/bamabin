import 'package:bamabin/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../controller/public_controller.dart';
import 'MyTextButton.dart';

class CustomMainAppBar extends GetView<PublicController> {
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
                  : controller.bottomIndex.value != 0
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
                  if (controller.bottomIndex != 0) {
                    center = MyText(
                      text: '${controller.appBarCenterText}',
                      size: 17,
                      color: cY,
                    );
                  } else {
                    center = SizedBox(
                        height: 50,
                        child: Image.asset('assets/images/ic_logotype.png'));
                  }
                } else if (controller.bottomIndex != 0) {
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
