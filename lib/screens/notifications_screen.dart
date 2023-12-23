import 'package:bamabin/widgets/details_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Container(width: Get.width,
      height: Get.height,
      child: Column(children: [
        DetailsAppBar()
      ],),
    ),));
  }
}
