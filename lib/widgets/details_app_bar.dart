import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({Key? key,@required this.leftWidget, @required this.rightWidget,@required this.title}) : super(key: key);
  final Widget? leftWidget;
  final Widget? rightWidget;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
      width: Get.width,
      decoration: BoxDecoration(color: cPrimary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        leftWidget!,
        Text("$title",style: TextStyle(color: cAccent),),
        rightWidget!

      ],),
    );
  }
}
