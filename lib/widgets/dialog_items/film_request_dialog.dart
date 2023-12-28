import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/colors.dart';
import '../MyText.dart';
import '../MyTextButton.dart';
import '../MyTextField.dart';

class FilmRequestDialog extends StatelessWidget {
  const FilmRequestDialog({super.key});

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
                        text: "درخواست فیلم و سریال",
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

                          borderRadius: BorderRadius.circular(10),
                          hint: MyText(text: 'سال'),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: MyTextField(
                borderRadius:10,
                height: 41,
                hint:"نام فیلم،سریال،انیمه،انیمیشن",
                controller: new TextEditingController(),
                maxLines: 3,
                suffixIcon: Icon(
                  Icons.description,
                  size: 25,
                  color: cGrey,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MyTextButton(
                onTap: () {},
                size: Size(Get.width / 1.4, 35),
                bgColor: cY,
                child: MyText(
                  text:"ثبت",
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
