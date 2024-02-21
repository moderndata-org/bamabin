import 'package:bamabin/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketMessage extends StatelessWidget {
  bool? isSelf;
  String? content;
  String? user_profile;

  TicketMessage({this.isSelf, this.content, this.user_profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: Get.width,
      child: Row(
        textDirection: (isSelf == true) ? TextDirection.rtl : TextDirection.ltr,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/ic_logo.png"),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            decoration: BoxDecoration(
              color: cPrimaryDark,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Text("${content}",style: TextStyle(color: Colors.white),),
          )
        ],
      ),
    );
  }
}
