import 'package:accordion/accordion.dart';
import 'package:bamabin/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieItemDialogWidget extends StatelessWidget {
  const MovieItemDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: Get.width,
      height: 100,
      decoration: BoxDecoration(
        color: cGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(children: []),
    );
  }
}
