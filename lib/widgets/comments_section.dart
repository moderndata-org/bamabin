import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/detail_controller.dart';
import 'package:bamabin/models/comment_model.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:bamabin/widgets/MyTextField.dart';
import 'package:bamabin/widgets/comment_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentsSection extends GetView<DetailController> {
  CommentsSection({super.key,this.comments});
  List<Comment>? comments;
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
                width: 10,
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
          Column(children: List.generate(comments!.length, (index){
            var comment = comments![index];
            return CommentItem(
              isReply: false,
              user: comment.commentAuthor,
              date: comment.commentDateGmt,
              text: comment.commentContent,
            );
          }),),
          SizedBox(
            height: 10,
          ),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              SizedBox(
                width: 15,
              ),
              Expanded(
                  child: MyTextField(
                      maxLines: null,
                      hint: 'نظر خود را بنویسید',
                      controller: controller.txtComment!)),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 50,
                child: MyTextButton(
                  size: null,
                  child: MyText(
                    text: 'ثبت نظر',
                    color: cB,
                  ),
                  bgColor: cY,
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          )
        ],
      ),
    );
  }
}
