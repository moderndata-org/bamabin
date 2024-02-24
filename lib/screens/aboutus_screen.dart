import 'package:bamabin/constant/utils.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../widgets/custom_appbar.dart';

class AboutusScreen extends GetView<PublicController> {
  const AboutusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: cPrimary,
      appBar: CustomAppbar(
          title: 'درباره ما',
          icon: Icon(
            Icons.info,
            color: cW,
            shadows: [bsTextLowOpacity],
          )),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            Obx(() => controller.isLoadingAboutUs.isTrue
                ? Container(
                    margin: EdgeInsets.only(top: 50),
                    width: Get.width * .9,
                    height: 150,
                    child:
                        CustomShimmerWidget(width: Get.width * .9, height: 150),
                  )
                : Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: MyText(
                      text: '${controller.aboutUs.value.about}',
                      color: cW,
                      lineHeight: 2,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                    ),
                    width: Get.width * .9,
                    decoration: BoxDecoration(
                        color: cPrimaryDark,
                        borderRadius: BorderRadius.circular(5)),
                  )),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              textDirection: TextDirection.rtl,
              children: [
                // SizedBox.square(
                //     dimension: 50,
                //     child: SvgPicture.asset('assets/svg/ic_twitter.svg')),
                GestureDetector(
                  onTap: () {
                    launchTheUrl(
                        url: '${controller.aboutUs.value.telegramChannel}');
                  },
                  child: SizedBox.square(
                      dimension: 50,
                      child: SvgPicture.asset(
                          'assets/svg/ic_telegram_aboutus.svg')),
                ),
                GestureDetector(
                  onTap: () {
                    launchTheUrl(
                        url: '${controller.aboutUs.value.instagramPage}');
                  },
                  child: SizedBox.square(
                      dimension: 50,
                      child: SvgPicture.asset(
                          'assets/svg/ic_instagram_aboutus.svg')),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }
}
