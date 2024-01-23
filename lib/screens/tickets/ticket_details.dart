import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
import '../../widgets/custom_appbar.dart';

class TicketDetails extends StatelessWidget {
  const TicketDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppbar(
          title: 'خرید اشتراک',
          icon: Icon(
            Icons.subscriptions,
            color: cW,
            size: 25,
            shadows: [bsText],
          )),
      backgroundColor: cPrimary,
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            // DetailsAppBar(
            //     leftWidget: MyTextButton(
            //         size: const Size(40, 40),
            //         onTap: () {
            //           Get.back();
            //         },
            //         fgColor: cGrey,
            //         bgColor: cPrimaryDark,
            //         child: Icon(
            //           Icons.arrow_back_ios,
            //           color: cGrey,
            //         )),
            //     rightWidget: MyTextButton(
            //         size: const Size(40, 40),
            //         onTap: () {
            //           Get.back();
            //         },
            //         fgColor: cGrey,
            //         bgColor: cPrimaryDark,
            //         child: Icon(
            //           Icons.support,
            //           color: cAccent,
            //         )),
            //     title: "عنوان تیکت")
          ],
        ),
      ),
    ));
  }
}
