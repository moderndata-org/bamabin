// ignore_for_file: must_be_immutable

import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/constant/utils.dart';
import 'package:bamabin/controller/detail_controller.dart';
import 'package:bamabin/models/comment_model.dart';
import 'package:bamabin/widgets/MyCircularProgress.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:bamabin/widgets/MyTextField.dart';
import 'package:bamabin/widgets/comment_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentsSection extends GetView<DetailController> {
  CommentsSection({super.key, this.comments});
  List<CommentModel>? comments;
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
          Column(
            children: (comments?.length ?? 0) <= 0
                ? []
                : List.generate(comments!.length, (index) {
                    var comment = comments![index];
                    return CommentItem(
                      isReply: comment.parentId != '0' &&
                          comment.parentId != '' &&
                          comment.parentId != null,
                      user: comment.author,
                      date: getPersianDate(dateTime: '${comment.createdAt}'),
                      text: comment.content,
                      avatar: comment.avatar,
                      replyFunc: () {
                        controller.selectedCommentForReply(comment);
                        controller.movieDetailScrollController.animateTo(
                            controller.movieDetailScrollController.position
                                .maxScrollExtent,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeIn);
                      },
                    );
                  }),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(() => controller.selectedCommentForReply.value.id == null
              ? SizedBox()
              : Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  height: 50,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: cSecondaryLight,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      IconButton(
                          onPressed: () => controller
                              .selectedCommentForReply(CommentModel()),
                          icon: Icon(
                            Icons.cancel,
                            shadows: [bsTextLowOpacity],
                            color: cR,
                          )),
                      Expanded(
                          child: MyText(
                        text:
                            '${controller.selectedCommentForReply.value.content}',
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        shadows: [bsText],
                      )),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                )),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              SizedBox(
                width: 10,
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
                  onTap: () => controller.submitComment(
                    comment: controller.txtComment!.text,
                  ),
                  child: Obx(() => controller.isSubmmitingComment.isTrue
                      ? MyCircularProgress(
                          color: cB,
                          size: 25,
                        )
                      : MyText(
                          text: 'ثبت نظر',
                          color: cB,
                        )),
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
