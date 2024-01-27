// ignore_for_file: must_be_immutable

import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentItem extends StatelessWidget {
  CommentItem({required this.isReply, super.key});
  bool? isReply;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
      width: Get.width - 20,
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          isReply == true ? Spacer() : SizedBox(),
          CircleAvatar(
            child: Image.asset("assets/images/ic_logo.png"),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: (isReply == true) ? Get.width - 100 : Get.width - 70,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
              color: cSecondary,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "M.Mohammadi",
                      style: TextStyle(color: cW, fontSize: 12),
                    ),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Icon(
                          Icons.watch_later,
                          color: cW,
                          size: 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          " 2 ماه قبل",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(color: cW),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        (isReply == true)
                            ? Container()
                            : MyTextButton(
                                borderRadius: 5,
                                size: Size(60, 30),
                                onTap: () {},
                                bgColor: cY,
                                fgColor: cB,
                                child: MyText(
                                  text: 'پاسخ',
                                  color: cB,
                                  size: 11,
                                ),
                              )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "لورم ایپسوم متنی ساختگی در صنعت چاپ است",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}