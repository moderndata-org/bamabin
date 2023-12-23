import 'package:bamabin/widgets/details_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../widgets/MyTextButton.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: cPrimaryBG,
      body: Container(width: Get.width,
      height: Get.height,
      child: Column(children: [
        DetailsAppBar(title: "اعلانات",
                      leftWidget: MyTextButton(
                          size: const Size(40, 40),
                          onTap: () {},
                          fgColor: cGrey,
                          bgColor: cPrimaryDark,
                          child: Icon(
                            Icons.manage_search,
                            color: cGrey,
                          )),
                      rightWidget: MyTextButton(
                          size: const Size(40, 40),
                          onTap: () {},
                          fgColor: cGrey,
                          bgColor: cPrimaryDark,
                          child: Icon(
                            Icons.menu,
                            color: cGrey,
                          ))

          ,)
      ],),
    ),));
  }
}
