// ignore_for_file: must_be_immutable

import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:bamabin/widgets/custom_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CommentItem extends StatelessWidget {
  CommentItem(
      {required this.isReply,
      super.key,
      this.user,
      this.replyFunc,
      this.date,
      this.avatar,
      this.text});
  bool? isReply;
  String? user;
  String? date;
  String? text;
  String? avatar;
  final Function()? replyFunc;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
      width: Get.width - 20,
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          SizedBox(
            width: isReply == true ? 20 : 0,
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: ClipOval(
              child: avatar == null
                  ? Image.asset("assets/images/ic_logo.png")
                  : CachedNetworkImage(
                      imageUrl: avatar!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Center(child: CustomShimmerWidget()),
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/images/ic_logo.png"),
                    ),
            ),
          ),
          // avatar == null
          //     ? CircleAvatar(
          //         backgroundImage: AssetImage("assets/images/ic_logo.png"),
          //       )
          //     : CircleAvatar(
          //         backgroundImage: CachedNetworkImageProvider(
          //           avatar!,
          //           errorListener: (p0) {},
          //         ),
          //       ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              // width: (isReply == true) ? Get.width - 100 : Get.width - 70,
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
                      MyText(
                        textDirection: TextDirection.rtl,
                        text: "$user",
                        size: 12,
                        color: cW,
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
                            "${date}",
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
                                  onTap: replyFunc,
                                  bgColor: cY,
                                  fgColor: cB,
                                  child: FittedBox(
                                    fit: BoxFit.fitHeight,
                                    child: MyText(
                                      text: 'پاسخ',
                                      color: cB,
                                      size: 12,
                                    ),
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
                    "${text}",
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
