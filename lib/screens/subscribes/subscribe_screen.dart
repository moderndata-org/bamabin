import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/widgets/details_app_bar.dart';
import 'package:bamabin/widgets/subscribe_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/MyTextButton.dart';

class SubscribeScreen extends StatelessWidget {
  const SubscribeScreen({super.key});

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
                      Icons.subscriptions,
                      color: cAccent,
                    )),
                title: "خرید اشتراک"),
    Expanded(child:    ListView(
      padding: EdgeInsets.only(right: 10,left: 10),

      children: [
        SubscribeItem(
          price: "35,000",
          price_of: "30,000",
        ),
        SubscribeItem(
          is_selected: true,
          price: "45,000",
          price_of: "35,000",
        )
      ],
    ))
          ],
        ),
      ),
    ));
  }
}
