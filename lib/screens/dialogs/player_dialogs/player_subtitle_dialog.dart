import 'package:accordion/accordion.dart';
import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/player_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';

import '../../../widgets/MyText.dart';

class PlayerSubtitleDialog extends GetView<PlayerController> {
  const PlayerSubtitleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(top: 50, bottom: 90, left: 15),
            width: 250,
            height: Get.height,
            decoration: BoxDecoration(
                color: cPrimary, borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  width: Get.width,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                              splashRadius: 1,
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(
                                Icons.cancel,
                                color: cR,
                              ))),
                      Positioned(
                        top: 15,
                        child: MyText(
                          text: 'تنظیمات زیرنویس',
                          color: cW,
                          size: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Accordion(
                            headerBorderColor: cB,
                            headerBorderColorOpened: Colors.transparent,
                            headerBackgroundColorOpened: Colors.transparent,
                            contentBackgroundColor: cPrimary,
                            contentBorderColor: Colors.transparent,
                            contentBorderRadius: 5,
                            headerBorderRadius: 5,
                            headerBackgroundColor: cSecondary,
                            flipLeftIconIfOpen: true,
                            contentHorizontalPadding: 0,
                            contentBorderWidth: 2,
                            contentVerticalPadding: 0,
                            scaleWhenAnimating: true,
                            openAndCloseAnimation: true,
                            headerPadding: EdgeInsets.zero,
                            disableScrolling: true,
                            children: [
                              AccordionSection(
                                  isOpen: false,
                                  rightIcon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: cW,
                                    shadows: [bsText],
                                  ),
                                  header: Container(
                                      padding: EdgeInsets.only(right: 10),
                                      alignment: Alignment.centerRight,
                                      height: 45,
                                      child: MyText(
                                        text: 'رنگ زیرنویس',
                                        size: 13,
                                      )),
                                  contentBorderColor: cSecondary,
                                  headerBackgroundColorOpened: cSecondary,
                                  contentHorizontalPadding: 10,
                                  contentVerticalPadding: 5,
                                  content: SizedBox(
                                    width: Get.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(

                                          child: MyText(
                                            text: 'سفید',
                                          ),
                                          onTap: (){
                                            controller.subtitle_style["text_color"] = VlcSubtitleColor.white;
                                          },
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        GestureDetector(

                                          child: MyText(
                                            text: 'زرد',
                                          ),
                                          onTap: (){
                                            controller.subtitle_style["text_color"] =  VlcSubtitleColor.yellow;
                                          },
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        GestureDetector(

                                          child: MyText(
                                            text: 'قرمز',
                                          ),
                                          onTap: (){
                                            controller.subtitle_style["text_color"] =  VlcSubtitleColor.red;
                                          },
                                        ),
                                      ],
                                    ),
                                  )),
                              AccordionSection(
                                  isOpen: false,
                                  rightIcon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: cW,
                                    shadows: [bsText],
                                  ),
                                  header: Container(
                                      padding: EdgeInsets.only(right: 10),
                                      alignment: Alignment.centerRight,
                                      height: 45,
                                      child: MyText(
                                        text: 'شفافیت متن',
                                        size: 13,
                                      )),
                                  contentBorderColor: cSecondary,
                                  headerBackgroundColorOpened: cSecondary,
                                  contentHorizontalPadding: 10,
                                  contentVerticalPadding: 5,
                                  content: SizedBox(
                                    width: Get.width,
                                    child: SizedBox(
                                      width: Get.width,
                                      height: 25,
                                      child: Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: SliderTheme(
                                          data: SliderThemeData(
                                              trackHeight: 1,
                                              thumbColor: cW,
                                              activeTrackColor: cW,
                                              activeTickMarkColor: cW,
                                              thumbShape: RoundSliderThumbShape(
                                                  enabledThumbRadius: 5)),
                                          child: Obx(() => Slider(
                                            min: 1,
                                            max: 255,
                                            value: (controller.subtitle_style["text_opacity"] as int).toDouble(),
                                            onChanged: (value) {
                                              controller.subtitle_style["text_opacity"] = value.toInt();
                                            },
                                          )),
                                        ),
                                      ),
                                    ),
                                  )),
                              AccordionSection(
                                  isOpen: false,
                                  rightIcon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: cW,
                                    shadows: [bsText],
                                  ),
                                  header: Container(
                                      padding: EdgeInsets.only(right: 10),
                                      alignment: Alignment.centerRight,
                                      height: 45,
                                      child: MyText(
                                        text: 'رنگ پس زمینه',
                                        size: 13,
                                      )),
                                  contentBorderColor: cSecondary,
                                  headerBackgroundColorOpened: cSecondary,
                                  contentHorizontalPadding: 10,
                                  contentVerticalPadding: 5,
                                  content: SizedBox(
                                    width: Get.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(

                                          child: MyText(
                                          text: 'سفید',
                                        ),
                                        onTap: (){
                                            controller.subtitle_style["bg_color"] =  VlcSubtitleColor.white;
                                            print("Callll");
                                        },
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        GestureDetector(

                                          child: MyText(
                                            text: 'زرد',
                                          ),
                                          onTap: (){
                                            controller.subtitle_style["bg_color"] =  VlcSubtitleColor.yellow;
                                          },
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        GestureDetector(

                                          child: MyText(
                                            text: 'قرمز',
                                          ),
                                          onTap: (){
                                            controller.subtitle_style["bg_color"] =  VlcSubtitleColor.red;
                                          },
                                        ),
                                      ],
                                    ),
                                  )),
                              AccordionSection(
                                  isOpen: false,
                                  rightIcon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: cW,
                                    shadows: [bsText],
                                  ),
                                  header: Container(
                                      padding: EdgeInsets.only(right: 10),
                                      alignment: Alignment.centerRight,
                                      height: 45,
                                      child: MyText(
                                        text: 'شفافیت پس زمینه',
                                        size: 13,
                                      )),
                                  contentBorderColor: cSecondary,
                                  headerBackgroundColorOpened: cSecondary,
                                  contentHorizontalPadding: 10,
                                  contentVerticalPadding: 5,
                                  content: SizedBox(
                                    width: Get.width,
                                    child: SizedBox(
                                      width: Get.width,
                                      height: 25,
                                      child: Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: SliderTheme(
                                          data: SliderThemeData(
                                              trackHeight: 1,
                                              thumbColor: cW,
                                              activeTrackColor: cW,
                                              activeTickMarkColor: cW,
                                              thumbShape: RoundSliderThumbShape(
                                                  enabledThumbRadius: 5)),
                                          child: Obx(() => Slider(
                                            min: 1,
                                            max: 255,
                                            value: (controller.subtitle_style["bg_opacity"] as int).toDouble(),
                                            onChanged: (value) {
                                              controller.subtitle_style["bg_opacity"] = value.toInt();
                                            },
                                          )),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
