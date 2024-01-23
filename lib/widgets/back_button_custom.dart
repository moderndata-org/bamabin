import 'package:flutter/material.dart';

import '../constant/colors.dart';
import 'MyTextButton.dart';

class BackButtonCustom extends StatelessWidget {
  const BackButtonCustom({
    this.hasPaddin = true,
    this.bgColor,
    super.key,
  });
  final bool? hasPaddin;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: hasPaddin == false
          ? EdgeInsets.zero
          : const EdgeInsets.only(left: 20),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: cB.withOpacity(.05), offset: Offset(0, 3), blurRadius: 3)
        ], borderRadius: BorderRadius.circular(5)),
        child: MyTextButton(
            padding: EdgeInsets.zero,
            bgColor: bgColor ?? cSecondaryLight,
            strokeColor: cW,
            borderRadius: 5,
            onTap: () => Navigator.pop(context),
            size: Size(30, 30),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: cW,
                  shadows: [bsText],
                ),
              ],
            )),
      ),
    );
  }
}
