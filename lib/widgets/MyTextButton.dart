import 'package:flutter/material.dart';
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
    this.boxShadow,
    this.padding,
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
  final BoxShadow? boxShadow;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: boxShadow == null ? [] : [boxShadow!],
          borderRadius: BorderRadius.circular(borderRadius ?? 5)),
      child: TextButton(
          style: TextButton.styleFrom(
            elevation: elevation,
            foregroundColor: fgColor ?? cW,
            minimumSize: size,
            fixedSize: size,
            padding: padding,
            backgroundColor: bgColor ?? cSecondary,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: strokeColor ?? Colors.transparent),
              borderRadius: BorderRadius.circular(borderRadius ?? 5),
            ),
          ),
          onPressed: onTap,
          child: child),
    );
  }
}
