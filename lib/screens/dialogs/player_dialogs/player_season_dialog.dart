import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/MyText.dart';

class PlayerSeasonDialog extends StatelessWidget {
  const PlayerSeasonDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: Get.width,
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
                      text: 'انتخاب قسمت',
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
              children: List.generate(
                  5,
                  (index) => Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              MyText(
                                text: 'فصل ${index + 1}',
                                size: 15,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Container(
                                height: 1,
                                color: cSecondaryLight,
                              )),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Wrap(
                                spacing: 5,
                                direction: Axis.horizontal,
                                children: List.generate(
                                    15,
                                    (index) => MyTextButton(
                                        borderRadius: 5,
                                        bgColor: cSecondaryLight,
                                        child:
                                            MyText(text: 'قسمت ${index + 1}'))),
                              ),
                            ),
                          )
                        ],
                      )),
            ))
          ],
        ),
      ),
    );
  }
}
