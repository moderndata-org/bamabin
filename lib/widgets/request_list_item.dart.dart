// ignore_for_file: must_be_immutable

import 'package:bamabin/controller/detail_controller.dart';
import 'package:bamabin/models/film_model.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../constant/utils.dart';
import 'MyTextButton.dart';

class RequestItem extends GetView<DetailController> {
  String? id;
  String? request;
  String? condition;
  FilmModel? post;
  String? date;
  String? message;
  RequestItem(
      {this.id,
      this.request,
      this.condition,
      this.post,
      this.date,
      this.message,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(right: 10, top: 20, bottom: 20),
      width: Get.width - 20,
      decoration: BoxDecoration(
          color: cSecondary, borderRadius: BorderRadius.circular(5)),
      child: Column(
        textDirection: TextDirection.rtl,
        children: [
          Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "$id",
                style: TextStyle(color: cW, fontSize: 16),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                ": شناسه",
                style: TextStyle(color: cW, fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ": درخواست",
                style: TextStyle(color: cW, fontSize: 16),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: MyText(
                  text: "$request",
                  size: 16,
                  color: cW,
                ),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "$condition",
                style: TextStyle(color: cAccent, fontSize: 16),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                ": وضعیت ",
                style: TextStyle(color: cW, fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              (post == null)
                  ? Text(
                      "ندارد",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  : MyTextButton(
                      onTap: () {
                        controller.selectedFilm(post);
                        Get.toNamed('/movie-detail');
                      },
                      size: Size(70, 35),
                      bgColor: cAccent,
                      child: Text(
                        "مشاهده",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
              SizedBox(
                width: 5,
              ),
              Text(
                ": لینک ارجاع ",
                style: TextStyle(color: cW, fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "$date",
                style: TextStyle(color: cAccent, fontSize: 16),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                ": تاریخ ",
                style: TextStyle(color: cW, fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "$message",
                style: TextStyle(color: cAccent, fontSize: 16),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                ": پیغام ",
                style: TextStyle(color: cW, fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }
}
