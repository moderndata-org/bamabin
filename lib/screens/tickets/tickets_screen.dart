import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/screens/dialogs/tickets_add_dialog.dart';
import 'package:bamabin/widgets/tickets_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_appbar.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppbar(
          title: 'تیکت',
          icon: Icon(
            Icons.confirmation_num_rounded,
            color: cW,
            size: 25,
            shadows: [bsText],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: cSecondaryLight,
        shape: CircleBorder(),
        onPressed: () {
          showDialog(
            barrierColor: cBgDialogColor,
            context: context,
            builder: (context) {
              return TicketsAddDialog();
            },
          );
        },
        child: Icon(
          Icons.add,
          color: cW,
        ),
      ),
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
            //           Icons.support_outlined,
            //           color: cAccent,
            //         )),
            //     title: "تیکت"),
            Expanded(
                child: ListView(
              padding: EdgeInsets.only(right: 10, left: 10),
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
