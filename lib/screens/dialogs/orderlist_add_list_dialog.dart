import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/MyTextButton.dart';
import '../../widgets/MyTextField.dart';

class OrderlistAddListDialog extends StatefulWidget {
  const OrderlistAddListDialog({super.key});

  @override
  State<OrderlistAddListDialog> createState() => _OrderlistAddListDialogState();
}

class _OrderlistAddListDialogState extends State<OrderlistAddListDialog> {
  final controller = Get.find<PublicController>();
  TextEditingController? txtAddlistTitle;
  TextEditingController? txtAddlistDescription;

  @override
  void initState() {
    txtAddlistTitle = TextEditingController();
    txtAddlistDescription = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    txtAddlistTitle?.dispose();
    txtAddlistDescription?.dispose();
    super.dispose();
  }

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
                        text: 'افزودن لیست',
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: MyTextField(
                height: 45,
                hint: 'عنوان لیست',
                controller: txtAddlistTitle!,
                maxLines: 1,
                suffixIcon: Icon(
                  Icons.article_rounded,
                  size: 25,
                  color: cGrey,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: Get.width,
              height: 45,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton(
                      // isDense: true,
                      borderRadius: BorderRadius.circular(15),
                      dropdownColor: cPrimary,
                      hint: MyText(text: '1'),
                      // isExpanded: true,
                      items: [
                        DropdownMenuItem(
                            value: 1,
                            alignment: Alignment.centerRight,
                            child:
                                SizedBox(width: 40, child: MyText(text: '1'))),
                        DropdownMenuItem(
                            value: 2,
                            alignment: Alignment.centerRight,
                            child:
                                SizedBox(width: 40, child: MyText(text: '2'))),
                        DropdownMenuItem(
                            value: 3,
                            alignment: Alignment.centerRight,
                            child:
                                SizedBox(width: 40, child: MyText(text: '3'))),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  color: cBgTextfield,
                  border: Border.all(color: cStrokeGrey),
                  borderRadius: BorderRadius.circular(15)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: MyTextField(
                height: 70,
                hint: 'توضیحات',
                controller: txtAddlistDescription!,
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
                size: Size(Get.width * .6, 35),
                bgColor: cY,
                child: MyText(
                  text: 'ثبت لیست',
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
