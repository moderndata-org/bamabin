
import 'package:flutter/material.dart';

import '../constant/colors.dart';
import 'MyText.dart';
import 'MyTextButton.dart';

class GenerItemMainWidget extends StatelessWidget {
  const GenerItemMainWidget({
    this.title,
    this.onTap,
    super.key,
  });

  final String? title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.5),
      child: MyTextButton(
          onTap: onTap,
          fgColor: cW.withOpacity(.5),
          bgColor: cBgGener,
          size: Size.fromWidth(100),
          child: MyText(text: title ?? '')),
    );
  }
}
