import 'package:bamabin/widgets/details_app_bar.dart';
import 'package:bamabin/widgets/notification_item.dart';
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
                          onTap: () {
                            Get.back();
                          },
                          fgColor: cGrey,
                          bgColor: cPrimaryDark,
                          child: Icon(
                            Icons.arrow_back_ios,
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

          ,),
        Expanded(child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
          return NotificationItem(text: "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است",);
        },))

      ],),
    ),));
  }
}
