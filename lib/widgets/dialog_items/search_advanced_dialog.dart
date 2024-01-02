import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
import '../MyText.dart';
import '../MyTextButton.dart';
import '../MyTextField.dart';

class SearchAdvancedDialog extends StatelessWidget {
  const SearchAdvancedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: cB,
      surfaceTintColor: cB,
      elevation: 20,
      backgroundColor: cPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 5, right: 10, left: 10, bottom: 5),
                      decoration: BoxDecoration(
                          color: cY,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          )),
                      child: MyText(
                        text: "پیشرفته",
                        color: cB,
                        size: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  width: Get.width / 3,
                  height: 45,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton(
                          // isDense: true,
                          dropdownColor: cPrimary,

                          borderRadius: BorderRadius.circular(10),
                          hint: MyText(text: 'رده سنی'),
                          // isExpanded: true,
                          items: [
                            DropdownMenuItem(
                                value: 1,
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                    width: 40, child: MyText(text: '1'))),
                            DropdownMenuItem(
                                value: 2,
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                    width: 40, child: MyText(text: '2'))),
                            DropdownMenuItem(
                                value: 3,
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                    width: 40, child: MyText(text: '3'))),
                          ],
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: cBgTextfield,
                      border: Border.all(color: cStrokeGrey),
                      borderRadius: BorderRadius.circular(10)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  width: Get.width / 3,
                  height: 45,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton(
                          // isDense: true,

                          dropdownColor: cPrimary,
                          borderRadius: BorderRadius.circular(10),
                          hint: MyText(text: 'نوع'),
                          // isExpanded: true,
                          items: [
                            DropdownMenuItem(
                                value: 1,
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                    width: 40, child: MyText(text: '1'))),
                            DropdownMenuItem(
                                value: 2,
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                    width: 40, child: MyText(text: '2'))),
                            DropdownMenuItem(
                                value: 3,
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                    width: 40, child: MyText(text: '3'))),
                          ],
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: cBgTextfield,
                      border: Border.all(color: cStrokeGrey),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  width: Get.width / 3,
                  height: 45,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton(
                          // isDense: true,

                          dropdownColor: cPrimary,
                          borderRadius: BorderRadius.circular(10),
                          hint: MyText(text: 'کشور'),
                          // isExpanded: true,
                          items: [
                            DropdownMenuItem(
                                value: 1,
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                    width: 40, child: MyText(text: '1'))),
                            DropdownMenuItem(
                                value: 2,
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                    width: 40, child: MyText(text: '2'))),
                            DropdownMenuItem(
                                value: 3,
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                    width: 40, child: MyText(text: '3'))),
                          ],
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: cBgTextfield,
                      border: Border.all(color: cStrokeGrey),
                      borderRadius: BorderRadius.circular(10)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  width: Get.width / 3,
                  height: 45,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton(
                          // isDense: true,

                          dropdownColor: cPrimary,
                          borderRadius: BorderRadius.circular(10),
                          hint: MyText(text: 'ژانر'),
                          // isExpanded: true,
                          items: [
                            DropdownMenuItem(
                                value: 1,
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                    width: 40, child: MyText(text: '1'))),
                            DropdownMenuItem(
                                value: 2,
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                    width: 40, child: MyText(text: '2'))),
                            DropdownMenuItem(
                                value: 3,
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                    width: 40, child: MyText(text: '3'))),
                          ],
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: cBgTextfield,
                      border: Border.all(color: cStrokeGrey),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 20, top: 12),
              alignment: Alignment.topRight,
              child: Text(
                "دوبله فارسی",
                style: TextStyle(color: cW, fontSize: 12),
                textAlign: TextAlign.right,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20, top: 12),
              alignment: Alignment.topRight,
              child: Text(
                "زیرنویس فارسی",
                style: TextStyle(color: cW, fontSize: 12),
                textAlign: TextAlign.right,
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  children: [
                    MyTextField(
                      width: Get.width / 3,
                      borderRadius: 10,
                      height: 41,
                      hint: "تا سال",
                      controller: new TextEditingController(),
                      maxLines: 3,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MyTextField(
                      width: Get.width / 3,
                      borderRadius: 10,
                      height: 41,
                      hint: "از سال",
                      controller: new TextEditingController(),
                      maxLines: 3,
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    MyTextField(
                      width: Get.width / 3,
                      borderRadius: 10,
                      height: 41,
                      hint: "امتیاز تا",
                      controller: new TextEditingController(),
                      maxLines: 3,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MyTextField(
                      width: Get.width / 3,
                      borderRadius: 10,
                      height: 41,
                      hint: "امتیاز از",
                      controller: new TextEditingController(),
                      maxLines: 3,
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            MyTextButton(
                onTap: () {},
                size: Size(Get.width / 1.4, 35),
                bgColor: cY,
                child: MyText(
                  text: "جستجو",
                  size: 14,
                  color: cB,
                )),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
