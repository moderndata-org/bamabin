import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
import '../../widgets/MyText.dart';
import '../../widgets/MyTextButton.dart';
import '../../widgets/MyTextField.dart';
import '../../widgets/custom_dropdown.dart';

class SearchAdvancedDialog extends StatefulWidget {
  SearchAdvancedDialog({super.key});
  final controller = Get.find<PublicController>();

  @override
  State<SearchAdvancedDialog> createState() => _SearchAdvancedDialogState();
}

class _SearchAdvancedDialogState extends State<SearchAdvancedDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: cB,
      surfaceTintColor: cB,
      elevation: 20,
      backgroundColor: cPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
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
                    top: 15,
                    child: MyText(
                      text: "جستجوی پیشرفته",
                      color: cW,
                      size: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Obx(() => CustomDropDown(
                          title: switch (widget.controller.selectedType.value) {
                            AdvancedSearchType.none => 'نوع',
                            AdvancedSearchType.all => 'همه',
                            AdvancedSearchType.animations => 'انیمیشن‌ها',
                            AdvancedSearchType.anime => 'انیمه‌ها',
                            AdvancedSearchType.movies => 'فیلم‌ها',
                            AdvancedSearchType.series => 'سریال‌ها',
                          },
                          borderRadius: 5,
                          list: [
                            DropdownMenuItem(
                                onTap: () => widget.controller
                                    .selectedType(AdvancedSearchType.all),
                                value: 0,
                                child: MyText(text: 'همه')),
                            DropdownMenuItem(
                                onTap: () => widget.controller.selectedType(
                                    AdvancedSearchType.animations),
                                value: 0,
                                child: MyText(text: 'انیمیشن‌ها')),
                          ],
                        ))),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: CustomDropDown(
                  title: 'رده سنی',
                  borderRadius: 5,
                  list: [],
                )),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: CustomDropDown(
                  title: 'کشور',
                  borderRadius: 5,
                  list: [],
                )),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: CustomDropDown(
                  title: 'ژانر',
                  borderRadius: 5,
                  list: [],
                )),
                SizedBox(
                  width: 20,
                ),
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                //   width: Get.width / 3,
                //   height: 45,
                //   child: Directionality(
                //     textDirection: TextDirection.rtl,
                //     child: DropdownButtonHideUnderline(
                //       child: ButtonTheme(
                //         alignedDropdown: true,
                //         child: DropdownButton(
                //           // isDense: true,

                //           dropdownColor: cPrimary,
                //           borderRadius: BorderRadius.circular(10),
                //           hint: MyText(text: 'کشور'),
                //           // isExpanded: true,
                //           items: [
                //             DropdownMenuItem(
                //                 value: 1,
                //                 alignment: Alignment.centerRight,
                //                 child: SizedBox(
                //                     width: 40, child: MyText(text: '1'))),
                //             DropdownMenuItem(
                //                 value: 2,
                //                 alignment: Alignment.centerRight,
                //                 child: SizedBox(
                //                     width: 40, child: MyText(text: '2'))),
                //             DropdownMenuItem(
                //                 value: 3,
                //                 alignment: Alignment.centerRight,
                //                 child: SizedBox(
                //                     width: 40, child: MyText(text: '3'))),
                //           ],
                //           onChanged: (value) {},
                //         ),
                //       ),
                //     ),
                //   ),
                //   decoration: BoxDecoration(
                //       color: cBgTextfield,
                //       border: Border.all(color: cStrokeGrey),
                //       borderRadius: BorderRadius.circular(10)),
                // ),
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                //   width: Get.width / 3,
                //   height: 45,
                //   child: Directionality(
                //     textDirection: TextDirection.rtl,
                //     child: DropdownButtonHideUnderline(
                //       child: ButtonTheme(
                //         alignedDropdown: true,
                //         child: DropdownButton(
                //           // isDense: true,
                //           dropdownColor: cPrimary,
                //           borderRadius: BorderRadius.circular(10),
                //           hint: MyText(text: 'ژانر'),
                //           // isExpanded: true,
                //           items: [
                //             DropdownMenuItem(
                //                 value: 1,
                //                 alignment: Alignment.centerRight,
                //                 child: SizedBox(
                //                     width: 40, child: MyText(text: '1'))),
                //             DropdownMenuItem(
                //                 value: 2,
                //                 alignment: Alignment.centerRight,
                //                 child: SizedBox(
                //                     width: 40, child: MyText(text: '2'))),
                //             DropdownMenuItem(
                //                 value: 3,
                //                 alignment: Alignment.centerRight,
                //                 child: SizedBox(
                //                     width: 40, child: MyText(text: '3'))),
                //           ],
                //           onChanged: (value) {},
                //         ),
                //       ),
                //     ),
                //   ),
                //   decoration: BoxDecoration(
                //       color: cBgTextfield,
                //       border: Border.all(color: cStrokeGrey),
                //       borderRadius: BorderRadius.circular(10)),
                // ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 20, top: 12, left: 20),
              alignment: Alignment.topRight,
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    "دوبله فارسی",
                    style: TextStyle(color: cW, fontSize: 13),
                    textAlign: TextAlign.right,
                  ),
                  Spacer(),
                  Transform.scale(
                    scale: .8,
                    child: CupertinoSwitch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20, top: 12, left: 20),
              alignment: Alignment.topRight,
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    "زیرنویس فارسی",
                    style: TextStyle(color: cW, fontSize: 13),
                    textAlign: TextAlign.right,
                  ),
                  Spacer(),
                  Transform.scale(
                    scale: .8,
                    child: CupertinoSwitch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Expanded(
                      child: MyTextField(
                        borderRadius: 5,
                        hint: "از سال",
                        controller: new TextEditingController(),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: MyTextField(
                        borderRadius: 5,
                        hint: "تا سال",
                        controller: new TextEditingController(),
                      ),
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Expanded(
                      child: MyTextField(
                        borderRadius: 5,
                        hint: "امتیاز از",
                        controller: new TextEditingController(),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: MyTextField(
                        borderRadius: 5,
                        hint: "امتیاز تا",
                        controller: new TextEditingController(),
                      ),
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
