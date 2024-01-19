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
            bgColor: bgColor ?? cSecondaryLight,
            strokeColor: cW,
            borderRadius: 5,
            onTap: () => Navigator.pop(context),
            size: Size(35, 35),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  bottom: -2,
                  left: -7,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: cW,
                    shadows: [bsText],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
