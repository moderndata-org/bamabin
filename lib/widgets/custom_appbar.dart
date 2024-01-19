import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:bamabin/widgets/back_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({this.title, this.iconColor, this.icon, super.key});
  final String? title;
  final Widget? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cAppBar,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          MyTextButton(
              bgColor: Colors.transparent,
              onTap: null,
              size: Size(40, 40),
              child: Stack(
                clipBehavior: Clip.none,
                children: [Positioned(left: -4, child: icon ?? SizedBox())],
              )),
          Spacer(),
          MyText(
            text: '$title',
            color: cW,
            size: 17,
            fontWeight: FontWeight.w700,
            shadows: [bsText],
          ),
          Spacer(),
          BackButtonCustom(
            hasPaddin: false,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(Get.width, 60);
}
