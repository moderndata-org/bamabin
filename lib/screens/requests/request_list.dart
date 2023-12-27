import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/widgets/details_app_bar.dart';
import 'package:bamabin/widgets/subscribe_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/MyTextButton.dart';
import '../../widgets/request_list_item.dart.dart';

class RequestListScreen extends StatelessWidget {
  const RequestListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: cPrimary,
          body: Container(
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [
                DetailsAppBar(
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
                        onTap: () {
                          Get.back();
                        },
                        fgColor: cGrey,
                        bgColor: cPrimaryDark,
                        child: Icon(
                          Icons.video_call,
                          color: cAccent,
                        )),
                    title: "درخواست فیلم و سریال"),
                Expanded(child:    ListView(
                  padding: EdgeInsets.only(right: 10,left: 10),

                  children: [
                    RequestItem()


                  ],
                ))
              ],
            ),
          ),
        ));
  }
}
