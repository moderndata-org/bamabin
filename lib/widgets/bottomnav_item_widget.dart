import 'package:bamabin/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import 'MyText.dart';

class BottomNavButtonWidget extends GetView<MainController> {
  const BottomNavButtonWidget({
    super.key,
    this.onTap,
    this.title,
    this.iconActive,
    this.iconDeactive,
    this.isActive,
  });

  final Function()? onTap;
  final String? title;
  final bool? isActive;
  final String? iconDeactive;
  final String? iconActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Material(
      shape: CircleBorder(),
      color: Colors.transparent,
      elevation: 0,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 20,
              height: 20,
              child: SvgPicture.asset(
                  isActive == true ? iconActive! : iconDeactive!,
                  colorFilter: ColorFilter.mode(
                      isActive == true ? cSecondaryLight : cW,
                      BlendMode.srcIn)),
            ),
            SizedBox(
              height: isActive == true ? 10 : 5,
            ),
            isActive == true
                ? Obx(() {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: controller.bottomSelectedContainerWidth.value,
                      height: 5,
                      decoration: BoxDecoration(
                          boxShadow: [bs010o5],
                          borderRadius: BorderRadius.circular(50),
                          color: cSecondaryLight),
                    );
                  })
                : MyText(
                    text: '$title',
                    size: 12,
                  ),
            SizedBox(
              height: isActive == true ? 10 : 0,
            ),
          ],
        ),
      ),
    ));
  }
}
