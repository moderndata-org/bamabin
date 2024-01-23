import 'package:bamabin/constant/strings.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../widgets/custom_appbar.dart';

class DownloadManagerScreen extends GetView<PublicController> {
  const DownloadManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: cPrimary,
      appBar: CustomAppbar(
          title: 'دانلود‌ها',
          icon: Icon(
            Icons.download_rounded,
            color: cW,
            shadows: [bsTextLowOpacity],
          )),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: ListView.builder(
          itemCount: 20,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemBuilder: (context, index) => DownloadManagerItemWidget(),
        ),
      ),
    ));
  }
}

class DownloadManagerItemWidget extends StatelessWidget {
  const DownloadManagerItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: Get.width,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: cW.withOpacity(.7), width: 1)),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: MyText(
                  text: 'Monarch E01 S01',
                  fontWeight: FontWeight.w500,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    textDirection: TextDirection.ltr,
                    text: '1 mbps',
                    size: 11,
                  ),
                  MyText(
                      textDirection: TextDirection.ltr, text: '35%', size: 11),
                ],
              ),
              SizedBox(
                width: 5,
              ),
              MyTextButton(size: Size(70, 35), child: MyText(text: 'ادامه')),
              SizedBox(
                width: 15,
              ),
            ],
          )),
          SizedBox(
            height: 20,
            width: Get.width,
            child: SliderTheme(
                data: SliderThemeData(
                    disabledActiveTrackColor: cSecondaryLight,
                    disabledInactiveTrackColor: cW.withOpacity(.4),
                    trackHeight: 2,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0)),
                child: Slider(
                  thumbColor: Colors.transparent,
                  value: 20,
                  min: 0,
                  max: 100,
                  onChanged: null,
                )),
          )
        ],
      ),
    );
  }
}
