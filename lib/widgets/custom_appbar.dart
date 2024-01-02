import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          MyTextButton(
              onTap: null,
              size: Size(40, 40),
              child: Stack(
                clipBehavior: Clip.none,
                children: [Positioned(left: -4, child: icon ?? SizedBox())],
              )),
          Spacer(),
          MyText(
            text: '$title',
            color: cY,
            size: 15,
          ),
          Spacer(),
          MyTextButton(
              onTap: () => Navigator.pop(context),
              size: Size(40, 40),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 0,
                    left: -4,
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: cGrey,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(Get.width, 60);
}
