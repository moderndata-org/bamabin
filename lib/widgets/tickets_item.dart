// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import 'MyTextButton.dart';

class TicketsItem extends StatelessWidget {
  String? id;
  String? title;
  String? department;
  String? condition;
  String? date;
  String? status;
  String? updated;
  Function? onShow;
  TicketsItem(
      {this.id,
      this.title,
      this.department,
      this.status,
      this.updated,
      this.date,
        this.onShow,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(right: 10, top: 5),
      width: Get.width - 20,
      decoration: BoxDecoration(
          color: cSecondary, borderRadius: BorderRadius.circular(5)),
      child: Column(
        textDirection: TextDirection.rtl,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: MyTextButton(
                  size: Size(90, 35),
                  bgColor: cSecondaryLight,
                  child: Text(
                    "مشاهده",
                    style: TextStyle(color: cW, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    if(onShow != null){
                      onShow!();
                    }
                  },
                ),
              ),
              onTap: (){

              },
              ),
              Row(
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
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "$title",
                style: TextStyle(color: cW, fontSize: 16),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                ": عنوان",
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
                "$department",
                style: TextStyle(color: cW, fontSize: 16),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                ": دپارتمان ",
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
                "$status",
                style: TextStyle(color: cW, fontSize: 16),
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "$date",
                style: TextStyle(color: cW, fontSize: 16),
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
                "$updated",
                style: TextStyle(color: cW, fontSize: 16),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                ": بروز شده ",
                style: TextStyle(color: cW, fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
