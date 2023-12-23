import 'package:bamabin/widgets/details_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
import '../../widgets/MyTextButton.dart';

class TicketDetails extends StatelessWidget {
  const TicketDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: cPrimaryBG,
      body: Container(
      width: Get.width,
      height: Get.height,
      child: Column(children: [
        DetailsAppBar(leftWidget: MyTextButton(
            size: const Size(40, 40),
            onTap: () {
              Get.back();
            },
            fgColor: cGrey,
            bgColor: cPrimaryDark,
            child: Icon(
              Icons.arrow_back_ios,
              color: cGrey,
            )), rightWidget: MyTextButton(
            size: const Size(40, 40),
            onTap: () {
              Get.back();
            },
            fgColor: cGrey,
            bgColor: cPrimaryDark,
            child: Icon(
              Icons.support,
              color: cAccent,
            )), title: "عنوان تیکت")
      ],),
    ),));
  }
}
