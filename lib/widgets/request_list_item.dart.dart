// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../constant/utils.dart';
import 'MyTextButton.dart';

class RequestItem extends StatelessWidget {
  String? id;
  String? request;
  String? condition;
  String? referral_link;
  String? date;
  String? message;
  RequestItem(
      {this.id,
      this.request,
      this.condition,
      this.referral_link,
      this.date,
      this.message,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(right: 10, top: 20),
      width: Get.width - 20,
      height: Get.height / 3.1,
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
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "$request",
                style: TextStyle(color: cW, fontSize: 16),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                ": درخواست",
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
              (referral_link == null)
                  ? Text(
                      "ندارد",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  : MyTextButton(
                      onTap: () => launchTheUrl(url: '$referral_link'),
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
