import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/widgets/details_app_bar.dart';
import 'package:bamabin/widgets/dialog_items/tickets_add_dialog.dart';
import 'package:bamabin/widgets/tickets_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/MyTextButton.dart';
import '../../widgets/dialog_items/tokenBot_dialog.dart';
import '../../widgets/request_list_item.dart.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: cAccent,
            shape: CircleBorder(),
            onPressed: () {
              showDialog(context: context, builder:
              (context) {

                return TokenBotDialog();
              },);
            },
            child: Icon(Icons.add),
          ),
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
                          Icons.support_outlined,
                          color: cAccent,
                        )),
                    title: "تیکت"),
                Expanded(child:    ListView(
                  padding: EdgeInsets.only(right: 10,left: 10),

                  children: [
                    TicketsItem(),



                  ],
                ))
              ],
            ),
          ),
        ));
  }
}
