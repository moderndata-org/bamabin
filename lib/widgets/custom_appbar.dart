
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../controller/public_controller.dart';
import 'MyTextButton.dart';

class CustomAppBar extends GetView<PublicController>
    implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 60,
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            SizedBox(
              width: 10,
            ),
            MyTextButton(
                onTap: () {},
                bgColor: cPrimaryDark,
                size: Size(40, 40),
                child: Icon(
                  Icons.menu_rounded,
                  color: cGrey,
                )),
            Spacer(),
            Obx(() => controller.bottomIndex == 0
                ? SizedBox(
                height: 50,
                child: Image.asset('assets/images/ic_logotype.png'))
                : SizedBox()),
            Spacer(),
            MyTextButton(
                onTap: () {},
                bgColor: cPrimaryDark,
                size: Size(40, 40),
                child: Icon(
                  Icons.manage_search,
                  color: cGrey,
                )),
            SizedBox(
              width: 10,
            ),
          ],
        ));
  }

  @override
  Size get preferredSize => Size(Get.width, 60);
}
