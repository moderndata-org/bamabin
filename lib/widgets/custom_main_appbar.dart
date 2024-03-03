import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/controller/main_controller.dart';
import 'package:bamabin/controller/public_controller.dart';
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
    controller.isVisibleAppbar.listen((p0) {
      print(p0);
    });
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
              Obx(() => AnimatedOpacity(
                  duration: Duration(
                    milliseconds: 300,
                  ),
                  opacity: controller.isVisibleAppbar.value ? 1 : 0,
                  child: controller.selectedBottomNav.value ==
                          BottomNavType.home
                      ? controller.isVisibleAppbar.value
                          ? SizedBox(
                              height: 30,
                              child:
                                  Image.asset('assets/images/ic_logotype.png'))
                          : SizedBox()
                      : MyText(
                          text: '${controller.appBarCenterText}',
                          size: 19,
                          color: cW,
                          fontWeight: FontWeight.w900,
                          shadows: [bsText],
                        ))),
              Spacer(),
              //! Search Button
              MyTextButton(
                  onTap: () {
                    Get.find<PublicController>().clearAndOpenSearch();
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
