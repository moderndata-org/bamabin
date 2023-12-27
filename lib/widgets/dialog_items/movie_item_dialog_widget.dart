import 'package:bamabin/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieItemDialogWidget extends StatelessWidget {
  const MovieItemDialogWidget({this.qualityColor, this.qualityText, super.key});

  final Color? qualityColor;
  final String? qualityText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: Get.width * .8,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: cStrokeGrey),
        color: cB,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(children: [
        Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 70,
              decoration: BoxDecoration(
                  color: qualityColor ?? cGrey,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15))),
            ))
      ]),
    );
  }
}
