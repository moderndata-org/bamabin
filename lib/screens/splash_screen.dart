import 'dart:async';

import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/controller/detail_controller.dart';
import 'package:bamabin/widgets/MyCircularProgress.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  AuthController authController = Get.find();

  void initFireBase() async {
    authController.checkVersion();
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/images/ic_logo.png'), context);
    Timer(Duration.zero, () {
      initFireBase();
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    Get.find<DetailController>().width(Get.width);
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
                  dimension: Get.width * .5,
                  child: Image.asset('assets/images/ic_logo.png'),
                ),
                MyText(
                  text: 'Bamabin',
                  size: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                MyText(
                  text: 'هزاران فیلم و سریال رو با بامابین ببین!',
                  size: 18,
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
