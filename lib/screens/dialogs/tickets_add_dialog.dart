import 'package:bamabin/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
import '../../widgets/MyText.dart';
import '../../widgets/MyTextButton.dart';
import '../../widgets/MyTextField.dart';

class TicketsAddDialog extends StatelessWidget {
  const TicketsAddDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: cB,
      surfaceTintColor: cB,
      elevation: 20,
      backgroundColor: cPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 40,
              width: Get.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                          splashRadius: 1,
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.cancel,
                            color: cR,
                          ))),
                  Positioned(
                    top: 15,
                    child: MyText(
                      text: "افزودن تیکت",
                      color: cW,
                      size: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: MyTextField(
                borderRadius: 5,
                height: 41,
                hint: "عنوان",
                controller: new TextEditingController(),
                suffixIcon: Icon(
                  Icons.description,
                  size: 25,
                  color: cW,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomDropDown(
                  alignment: Alignment.centerRight,
                  title: 'دپارتمان',
                  borderRadius: 5,
                  buttonColor: cSecondary,
                  list: ['1', '2', '3', '4'],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: MyTextField(
                borderRadius: 5,
                maxLines: 3,
                height: 90,
                hint: "توضیحات",
                controller: new TextEditingController(),
                suffixIcon: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      Icons.description,
                      size: 25,
                      color: cW,
                    ),
                  ],
                ),
              ),
            ),
            MyTextButton(
                onTap: () {},
                size: Size(Get.width / 1.4, 35),
                bgColor: cY,
                child: MyText(
                  text: "ارسال تیکت",
                  size: 14,
                  color: cB,
                )),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
