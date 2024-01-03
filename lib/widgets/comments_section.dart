import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/comment_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentsSection extends StatelessWidget {
  const CommentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: cPrimaryDark,
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.question_answer,
                color: cW,
              ),
              SizedBox(
                width: 10,
              ),
              MyText(
                text: 'نظرات',
                size: 15,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          CommentItem(
            isReply: false,
          ),
          CommentItem(
            isReply: true,
          ),
        ],
      ),
    );
  }
}
