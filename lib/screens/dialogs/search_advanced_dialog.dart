import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/models/age_model.dart';
import 'package:bamabin/models/country_model.dart';
import 'package:bamabin/models/genre_model.dart';
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

  @override
  State<SearchAdvancedDialog> createState() => _SearchAdvancedDialogState();
}

class _SearchAdvancedDialogState extends State<SearchAdvancedDialog> {
  TextEditingController txtFromYear = TextEditingController();
  TextEditingController txtToYear = TextEditingController();
  TextEditingController txtFromImdb = TextEditingController();
  TextEditingController txtToImdb = TextEditingController();
  final controller = Get.find<PublicController>();

  @override
  Widget build(BuildContext context) {
    controller.hasDubbed(false);
    controller.hasSubtitle(false);
    controller.selectedAge(AgeRate());
    controller.selectedCountry(Country());
    controller.selectedGenre(Genre());
    controller.selectedType(AdvancedSearchType.none);
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
                          title: switch (controller.selectedType.value) {
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
                                onTap: () => controller
                                    .selectedType(AdvancedSearchType.all),
                                value: 0,
                                child:
                                    Center(child: MyText(text: 'همه نوع‌ها'))),
                            DropdownMenuItem(
                                onTap: () => controller
                                    .selectedType(AdvancedSearchType.movies),
                                value: 0,
                                child: Center(child: MyText(text: 'فیلم‌ها'))),
                            DropdownMenuItem(
                                onTap: () => controller
                                    .selectedType(AdvancedSearchType.series),
                                value: 0,
                                child: Center(child: MyText(text: 'سریال‌ها'))),
                            DropdownMenuItem(
                                onTap: () => controller.selectedType(
                                    AdvancedSearchType.animations),
                                value: 0,
                                child:
                                    Center(child: MyText(text: 'انیمیشن‌ها'))),
                            DropdownMenuItem(
                                onTap: () => controller
                                    .selectedType(AdvancedSearchType.anime),
                                value: 0,
                                child: Center(child: MyText(text: 'انیمه‌ها'))),
                          ],
                        ))),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: Obx(() => CustomDropDown(
                          title: controller.selectedAge.value.name ?? 'رده سنی',
                          borderRadius: 5,
                          list:
                              List.generate(controller.listAge.length, (index) {
                            AgeRate age = controller.listAge[index];
                            return DropdownMenuItem(
                                onTap: () => controller.selectedAge(age),
                                value: index,
                                child:
                                    Center(child: MyText(text: '${age.name}')));
                          }),
                        ))),
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
                    child: Obx(() => CustomDropDown(
                          title:
                              controller.selectedCountry.value.name ?? 'کشور',
                          borderRadius: 5,
                          list: List.generate(controller.listCountry.length,
                              (index) {
                            Country coun = controller.listCountry[index];
                            return DropdownMenuItem(
                                onTap: () => controller.selectedCountry(coun),
                                value: index,
                                child: Center(
                                    child: MyText(text: '${coun.name}')));
                          }),
                        ))),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: Obx(() => CustomDropDown(
                          title: controller.selectedGenre.value.name ?? 'ژانر',
                          borderRadius: 5,
                          list: List.generate(controller.listGenre.length,
                              (index) {
                            Genre gen = controller.listGenre[index];
                            return DropdownMenuItem(
                                onTap: () => controller.selectedGenre(gen),
                                value: index,
                                child:
                                    Center(child: MyText(text: '${gen.name}')));
                          }),
                        ))),
                SizedBox(
                  width: 20,
                ),
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
                    child: Obx(() => CupertinoSwitch(
                          value: controller.hasDubbed.value,
                          onChanged: (value) {
                            controller.hasDubbed(value);
                          },
                        )),
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
                    child: Obx(() => CupertinoSwitch(
                          value: controller.hasSubtitle.value,
                          onChanged: (value) {
                            controller.hasSubtitle(value);
                          },
                        )),
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
                        controller: txtFromYear,
                        inputType: TextInputType.number,
                        maxLength: 4,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: MyTextField(
                        borderRadius: 5,
                        hint: "تا سال",
                        controller: txtToYear,
                        inputType: TextInputType.number,
                        maxLength: 4,
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
                        inputType: TextInputType.number,
                        controller: txtFromImdb,
                        maxLength: 2,
                        onchangedAction: (text) {
                          if (text.length == 2) {
                            if (int.tryParse(text)! > 10) {
                              txtFromImdb.clear();
                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: MyTextField(
                        borderRadius: 5,
                        hint: "امتیاز تا",
                        inputType: TextInputType.number,
                        controller: txtToImdb,
                        maxLength: 2,
                        onchangedAction: (text) {
                          if (text.length == 2) {
                            if (int.tryParse(text)! > 10) {
                              txtToImdb.clear();
                            }
                          }
                        },
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MyTextButton(
                  onTap: () {
                    controller.checkAndSendAdvancedSearch(
                      FromImdb:
                          txtFromImdb.text == '' ? null : txtFromImdb.text,
                      ToImdb: txtToImdb.text == '' ? null : txtToImdb.text,
                      FromYear:
                          txtFromYear.text == '' ? null : txtFromYear.text,
                      ToYear: txtToYear.text == '' ? null : txtToYear.text,
                    );
                  },
                  size: Size(Get.width, 40),
                  bgColor: cY,
                  child: MyText(
                    text: "جستجو",
                    size: 15,
                    color: cB,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
