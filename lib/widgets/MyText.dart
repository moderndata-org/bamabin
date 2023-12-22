import 'package:flutter/material.dart';

import '../constant/colors.dart';

class MyText extends StatelessWidget {
  const MyText({
    this.color,
    this.size,
    this.shadows,
    this.textAlign,
    this.textDirection,
    this.textOverflow,
    this.fontWeight,
    this.padding,
    this.textDecoration = TextDecoration.none,
    required this.text,
    super.key,
  });
  final Color? color;
  final String text;
  final double? size;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextOverflow? textOverflow;
  final List<Shadow>? shadows;
  final TextDecoration? textDecoration;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    textDirection ?? TextDirection.rtl;
    textAlign ?? TextAlign.right;
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Text(
        text,
        textDirection: textDirection,
        textAlign: textAlign ?? TextAlign.center,
        style: TextStyle(
            fontWeight: fontWeight,
            overflow: textOverflow,
            color: color ?? cW,
            fontSize: size ?? 13,
            shadows: shadows,
            decoration: textDecoration,
            fontFamily: 'iransans'),
      ),
    );
  }
}
