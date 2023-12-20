import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    this.func,
    this.bgColor,
    this.fgColor,
    this.strokeColor,
    this.borderRadius,
    this.minimumSize,
    this.fixedSize,
    this.elevation,
    required this.child,
    super.key,
  });

  final Function()? func;
  final Widget child;
  final Color? bgColor;
  final Color? fgColor;
  final Color? strokeColor;
  final double? borderRadius;
  final double? elevation;
  final Size? minimumSize;
  final Size? fixedSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          elevation: elevation,
          foregroundColor: fgColor ?? cPrimary,
          minimumSize: minimumSize ?? Size(Get.width * .8, 45),
          fixedSize: fixedSize ?? Size(Get.width * .8, 45),
          backgroundColor: bgColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
          ),
        ),
        onPressed: func,
        child: child);
  }
}
