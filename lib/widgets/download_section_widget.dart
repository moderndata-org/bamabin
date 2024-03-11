import 'package:flutter/material.dart';

import '../constant/classes.dart';
import '../constant/colors.dart';
import 'MyText.dart';

class downloadSectionWidget extends StatelessWidget {
  const downloadSectionWidget({
    required this.icon,
    required this.title,
    required this.color,
    super.key,
  });
  final IconData icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Icon(
          icon,
          color: color,
        ),
        SizedBox(
          width: 5,
        ),
        MyText(
          text: title,
          shadows: [bsText],
          fontWeight: FontWeight.w500,
          size: 15,
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
            child: Container(
          height: 1,
          color: color,
        ))
      ],
    );
  }
}
