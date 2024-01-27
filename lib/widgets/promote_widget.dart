import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import 'MyText.dart';
import 'MyTextButton.dart';
import 'promote_widget_detail.dart';

class PromoteWidget extends StatelessWidget {
  const PromoteWidget({
    this.title,
    super.key,
  });
  final String? title;

  @override
  Widget build(BuildContext context) {
    double height = 470;
    double width = Get.width;
    return Container(
      decoration: BoxDecoration(boxShadow: [bs010]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              color: cSecondaryLight,
              width: width,
              height: height,
              child: Stack(
                children: [
                  SizedBox(
                    width: width,
                    height: height,
                    child: Image.asset(
                      'assets/images/rebelmoon.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: width,
                    height: height,
                    color: Colors.black.withOpacity(.3),
                  ),
                  Container(
                    width: width,
                    height: height,
                    color: cSecondaryLight.withOpacity(.3),
                  ),
                  SizedBox(
                    width: width,
                    height: height,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 70,
                          ),
                          MyText(
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.left,
                            text: '$title',
                            maxLines: 2,
                            size: 25,
                            fontWeight: FontWeight.w900,
                            shadows: [bsTextLowOpacity],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          //! Top Buttons
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              //! Play Online Button
                              MyTextButton(
                                  fgColor: cW,
                                  bgColor: cG,
                                  onTap: () {},
                                  child: Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Icon(
                                        Icons.play_circle_outline_rounded,
                                        color: cW,
                                        shadows: [bsTextLowOpacity],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      MyText(
                                        text: 'پخش آنلاین',
                                        fontWeight: FontWeight.w600,
                                        shadows: [bsTextLowOpacity],
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              //! Detail Button
                              MyTextButton(
                                  fgColor: cW,
                                  bgColor: cPrimary,
                                  onTap: () {},
                                  child: Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Icon(
                                        Icons.file_download_outlined,
                                        color: cW,
                                        shadows: [bsTextLowOpacity],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      MyText(
                                        text: 'جزئیات',
                                        fontWeight: FontWeight.w600,
                                        shadows: [bsTextLowOpacity],
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //! Details
                          PromoteDetailWidget(),
                          PromoteDetailWidget(),
                          PromoteDetailWidget(),
                          PromoteDetailWidget(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
