import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';

class RequestItem extends StatelessWidget {
  String?id;
  String?request;
  String?text;
  String?condition;
  String?referral_link;
  String?date;
  String?message;
  RequestItem({this.id,this.request,this.condition,this.referral_link,this.date,this.message,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:10),
      padding: EdgeInsets.only(right: 10, top: 20),
      width: Get.width - 20,
      height: Get.height / 3.1,
      decoration: BoxDecoration(
          color: cBgOrderItem, borderRadius: BorderRadius.circular(15)),
      child: Column(
        textDirection: TextDirection.rtl,
        children: [
          Row(
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
"$request",                style: TextStyle(color: cW, fontSize: 16),
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
"$condition" ,               style: TextStyle(color: cAccent, fontSize: 16),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                ": وضعیت "
               ,
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
                "$referral_link",
                style: TextStyle(color: cAccent, fontSize: 16),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                ": لینک ارجاع "
             ,
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
"$date"    ,            style: TextStyle(color: cAccent, fontSize: 16),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                ": تاریخ "
             ,
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
                ": پیغام "
              ,
                style: TextStyle(color: cW, fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }
}
