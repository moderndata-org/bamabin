import 'package:accordion/accordion.dart';
import 'package:bamabin/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SerialItemDialogWidget extends StatelessWidget {
  const SerialItemDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Accordion(
      headerBorderColor: cB,
      headerBorderColorOpened: Colors.transparent,
      headerBackgroundColorOpened: Colors.transparent,
      contentBackgroundColor: cPrimary,
      contentBorderColor: Colors.transparent,
      contentBorderRadius: 15,
      headerBorderRadius: 15,
      headerBackgroundColor: cPrimary,
      contentHorizontalPadding: 0,
      contentBorderWidth: 0,
      contentVerticalPadding: 0,
      scaleWhenAnimating: true,
      openAndCloseAnimation: true,
      headerPadding: EdgeInsets.zero,
      disableScrolling: true,
      children: [
        AccordionSection(
          isOpen: true,
          leftIcon: null,
          rightIcon: SizedBox(
            width: 0,
          ),
          header: Container(
            width: Get.width,
            height: 150,
            decoration: BoxDecoration(
                color: cB, borderRadius: BorderRadius.circular(15)),
          ),
          content: Container(
            margin: EdgeInsets.only(top: 5),
            width: Get.width,
            height: 100,
            decoration: BoxDecoration(
                color: cGrey, borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ],
    );
  }
}
