import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/widgets/MyCircularProgress.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: cPrimary,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox.square(
                  dimension: Get.width * .8,
                  child: Image.asset('assets/images/ic_logo.png'),
                ),
                MyText(
                  text: 'Bamabin',
                  size: 20,
                )
              ],
            ),
            Positioned(bottom: 15, child: MyCircularProgress(color: cAccent))
          ],
        ),
      ),
    ));
  }
}
