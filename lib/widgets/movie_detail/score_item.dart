import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScoreItem extends StatelessWidget {
  const ScoreItem({this.title, this.descirption, super.key});
  final String? title;
  final String? descirption;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: Get.width,
      height: 50,
      decoration: BoxDecoration(
          color: cSecondary, borderRadius: BorderRadius.circular(5)),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: cSecondaryLight,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    )),
                child: Center(
                    child: MyText(
                        text: '$title',
                        shadows: [bsText],
                        fontWeight: FontWeight.w500)),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                child: Text(
                  "$descirption",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ),
            )
          ]),
    );
  }
}
