import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../constant/colors.dart';
import '../../controller/ticket_controller.dart';
import '../../widgets/MyText.dart';
import '../../widgets/custom_appbar.dart';

class TicketDetails extends GetView<TicketController> {
  const TicketDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppbar(
          title: 'تیکت',
          icon: Icon(
            Icons.support,
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
        Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(right: 10, top: 5),
        width: Get.width - 20,
        decoration: BoxDecoration(
            color: cSecondary, borderRadius: BorderRadius.circular(5)),
        child: Column(
          textDirection: TextDirection.rtl,
          children: [
            MyText(
              text: 'تیکت:${controller.selectedTicket.value.id}',
              color: cW,
              size: 17,
              fontWeight: FontWeight.w700,
              shadows: [bsText],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${controller.selectedTicket.value.title}",
                  style: TextStyle(color: cW, fontSize: 16),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  ": عنوان",
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
                  "${controller.selectedTicket.value.department_name}",
                  style: TextStyle(color: cW, fontSize: 16),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  ": دپارتمان ",
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
                  "${controller.selectedTicket.value.created_at}",
                  style: TextStyle(color: cW, fontSize: 16),
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
                  "${controller.selectedTicket.value.updated_at}",
                  style: TextStyle(color: cW, fontSize: 16),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  ": بروز شده ",
                  style: TextStyle(color: cW, fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      )
          ],
        ),
      ),
    ));
  }
}
