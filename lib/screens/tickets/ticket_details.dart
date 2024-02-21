import 'package:bamabin/widgets/ticket_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../constant/colors.dart';
import '../../controller/ticket_controller.dart';
import '../../widgets/MyText.dart';
import '../../widgets/MyTextField.dart';
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
            Expanded(
                child: Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              padding: EdgeInsets.all(5),
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
                  SizedBox(
                    height: 15,
                  ),
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
                  Container(
                    width: Get.width,
                    height: 1,
                    color: Colors.white.withOpacity(0.2),
                  ),
                  SizedBox(height: 10,),
                  Expanded(child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                    return TicketMessage(isSelf: index % 2 == 0,content: "این پیام تستی",);
                  },),

                  ),
                  SizedBox(height: 10,),
                  Row(children: [
                    Expanded(child: Container(
                      padding: EdgeInsets.all(5),
                      height: 50,
                      decoration: BoxDecoration(
                          color: cPrimaryDark,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: MyTextField(
                          textDirection: TextDirection.rtl,
                          borderRadius: 5,
                          hint: "پیام جدید",
                          controller: new TextEditingController(),
                        ),
                      ),)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.send),style: IconButton.styleFrom(backgroundColor: cAccent),)
                  ],)
                ],
              ),
            )),

            SizedBox(height: 20)
          ],
        ),
      ),
    ));
  }
}
