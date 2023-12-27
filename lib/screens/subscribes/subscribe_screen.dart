import 'package:bamabin/widgets/subscribe_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscribeScreen extends StatelessWidget {
  const SubscribeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body:Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            SubscribeItem()
          ],
        ),
      ) ,
    ));
  }
}
