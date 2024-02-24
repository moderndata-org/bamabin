import 'dart:async';

import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/auth_controller.dart';
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

  void initFireBase() async{

    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    // await remoteConfig.setDefaults(const {
    //   "api_url": "https://www.aliamaterasu.ir/api/",
    // });

    authController.checkLogin();

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
