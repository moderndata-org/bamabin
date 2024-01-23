import 'package:flutter/material.dart';

import '../constant/colors.dart';

class MyText extends StatelessWidget {
  const MyText({
    this.color,
    this.size,
    this.shadows,
    this.textAlign = TextAlign.right,
    this.textDirection = TextDirection.rtl,
    this.textOverflow,
    this.fontWeight,
    this.padding,
    this.maxLines,
    this.lineHeight,
    this.textDecoration = TextDecoration.none,
    required this.text,
    super.key,
  });
  final Color? color;
  final String text;
  final double? size;
  final double? lineHeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextOverflow? textOverflow;
  final List<Shadow>? shadows;
  final TextDecoration? textDecoration;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Text(
        text,
        maxLines: maxLines,
        overflow: textOverflow,
        textDirection: textDirection,
        textAlign: textAlign ?? TextAlign.center,
        style: TextStyle(
            height: lineHeight,
            fontWeight: fontWeight,
            color: color ?? cW,
            fontSize: size ?? 14,
            shadows: shadows,
            decoration: textDecoration,
            decorationColor: color ?? cW,
            fontFamily: 'vazir'),
      ),
    );
  }
}
