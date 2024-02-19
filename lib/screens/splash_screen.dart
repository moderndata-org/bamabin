import 'dart:async';

import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/widgets/MyCircularProgress.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/images/ic_logo.png'), context);
    Timer(Duration.zero, () {
      authController.checkLogin();
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
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
