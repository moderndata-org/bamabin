import 'dart:ffi';

import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/widgets/genre_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bamabin/controller/main_controller.dart';
import '../widgets/custom_appbar.dart';
import 'package:get/get.dart';

class MoreScreen extends StatelessWidget {
  MoreScreen({Key? key}) : super(key: key);
  final mainController = Get.find<MainController>();
  final publicController = Get.find<PublicController>();

  var title = Get.arguments["title"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: cPrimary,
        appBar: CustomAppbar(
            title: '${title}',
            icon: Icon(
              Icons.hotel_class_rounded,
              color: cW,
              shadows: [bsTextLowOpacity],
            )),
        body: Container(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
