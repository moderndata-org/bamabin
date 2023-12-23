import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    this.onTap,
    this.bgColor,
    this.fgColor,
    this.strokeColor,
    this.borderRadius,
    this.size,
    this.elevation,
    required this.child,
    super.key,
  });

  final Function()? onTap;
  final Widget child;
  final Color? bgColor;
  final Color? fgColor;
  final Color? strokeColor;
  final double? borderRadius;
  final double? elevation;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          elevation: elevation,
          foregroundColor: fgColor ?? cW.withOpacity(.5),
          minimumSize: size ?? Size(Get.width * .8, 45),
          fixedSize: size ?? Size(Get.width * .8, 45),
          backgroundColor: bgColor ?? cPrimaryDark,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: strokeColor ?? Colors.transparent),
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
          ),
        ),
        onPressed: onTap,
        child: child);
  }
}
