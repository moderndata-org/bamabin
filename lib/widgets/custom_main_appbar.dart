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
      return Container(
          alignment: Alignment.center,
          height: 60,
          decoration: BoxDecoration(
              // color: controller.isVisibleAppbar.value ? cPrimary : null,
              gradient: controller.isVisibleAppbar.value
                  ? null
                  : LinearGradient(
                      colors: [cB, Colors.transparent],
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
                  bgColor: controller.isVisibleAppbar.value
                      ? cPrimaryDark
                      : Colors.transparent,
                  size: Size(40, 40),
                  child: Icon(
                    Icons.menu_rounded,
                    color: controller.isVisibleAppbar.value ? cGrey : cW,
                  )),
              Spacer(),
              controller.isVisibleAppbar.isFalse
                  ? SizedBox()
                  : Obx(() => controller.bottomIndex == 2
                      ? SizedBox(
                          height: 50,
                          child: Image.asset('assets/images/ic_logotype.png'))
                      : SizedBox()),
              Spacer(),
              MyTextButton(
                  onTap: () {},
                  bgColor: controller.isVisibleAppbar.value
                      ? cPrimaryDark
                      : Colors.transparent,
                  size: Size(40, 40),
                  child: Icon(
                    Icons.manage_search,
                    color: controller.isVisibleAppbar.value ? cGrey : cW,
                  )),
              SizedBox(
                width: 10,
              ),
            ],
          ));
    });
  }
}
