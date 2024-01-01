import 'package:bamabin/constant/colors.dart';
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
      constraints: BoxConstraints(maxHeight: 70, minHeight: 30),
      width: Get.width,
      decoration: BoxDecoration(
          color: cBgBtnMovieDetail, borderRadius: BorderRadius.circular(10)),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                constraints: BoxConstraints(maxHeight: 70, minHeight: 30),
                decoration: BoxDecoration(
                    color: cAccent,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Center(
                    child: Text(
                  "$title",
                  style: TextStyle(fontSize: 13),
                )),
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10, bottom: 5, left: 5, right: 5),
                child: Text(
                  "$descirption",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ),
              flex: 4,
            )
          ]),
    );
  }
}
