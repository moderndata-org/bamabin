import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../MyText.dart';

class MovieItemSmallDetailWidget extends StatelessWidget {
  const MovieItemSmallDetailWidget(
      {this.icon,
      this.textDirection = TextDirection.rtl,
      this.title,
      super.key});
  final Widget? icon;
  final String? title;
  final TextDirection? textDirection;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      margin: EdgeInsets.symmetric(horizontal: 2),
      padding: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
          boxShadow: [bsTextLowOpacity],
          color: cSecondary,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          icon ?? SizedBox(),
          Expanded(
            child: MyText(
              textAlign: TextAlign.center,
              textDirection: textDirection,
              text: '$title',
              color: cW,
              size: 12,
            ),
          ),
        ],
      ),
    );
  }
}
