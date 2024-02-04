import 'package:bamabin/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/colors.dart';
import '../../widgets/MyText.dart';
import '../../widgets/MyTextButton.dart';
import '../../widgets/MyTextField.dart';

class FilmRequestDialog extends StatelessWidget {
  const FilmRequestDialog({super.key});

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
                      text: "درخواست فیلم و سریال",
                      color: cW,
                      size: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
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
                  width: 10,
                ),
                Expanded(
                    child: CustomDropDown(
                  alignment: Alignment.centerRight,
                  borderRadius: 5,
                  buttonColor: cSecondary,
                  title: 'نوع',
                  list: [],
                )),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: CustomDropDown(
                  buttonColor: cSecondary,
                  alignment: Alignment.centerRight,
                  borderRadius: 5,
                  title: 'سال',
                  list: [],
                )),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: MyTextField(
                        textDirection: TextDirection.rtl,
                        borderRadius: 5,
                        hint: "نام فیلم،سریال،انیمه،انیمیشن",
                        controller: new TextEditingController(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: MyTextField(
                      borderRadius: 5,
                      hint: 'IMDB',
                      controller: new TextEditingController(),
                    ),
                  ),
                ],
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
                  text: "ثبت",
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
