import 'package:bamabin/controller/movie_request_controller.dart';
import 'package:bamabin/widgets/MyCircularProgress.dart';
import 'package:bamabin/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/classes.dart';
import '../../constant/colors.dart';
import '../../widgets/MyText.dart';
import '../../widgets/MyTextButton.dart';
import '../../widgets/MyTextField.dart';

class FilmRequestDialog extends GetView<MovieRequestController> {
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
                    child: Obx(() => CustomDropDown(
                          alignment: Alignment.centerRight,
                          borderRadius: 5,
                          buttonColor: cSecondary,
                          title: switch (controller.selectedType.value) {
                            AdvancedSearchType.none => 'نوع',
                            AdvancedSearchType.animations => 'انیمیشن‌ها',
                            AdvancedSearchType.anime => 'انیمه‌ها',
                            AdvancedSearchType.movies => 'فیلم‌ها',
                            AdvancedSearchType.series => 'سریال‌ها',
                            AdvancedSearchType.all => '',
                          },
                          list: [
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
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: MyTextField(
                      textDirection: TextDirection.rtl,
                      borderRadius: 5,
                      hint: 'سال',
                      inputType: TextInputType.number,
                      controller: controller.txtYear,
                    ),
                  ),
                ),
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
                        controller: controller.txtMovieName,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MyTextButton(
                  onTap: () => controller.submitRequest(),
                  size: Size(Get.width, 35),
                  bgColor: cY,
                  child: Obx(() => controller.isLoadingSubmitting.value
                      ? MyCircularProgress(
                          color: cB,
                          size: 20,
                        )
                      : MyText(
                          text: "ثبت",
                          fontWeight: FontWeight.bold,
                          size: 15,
                          color: cB,
                        ))),
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
