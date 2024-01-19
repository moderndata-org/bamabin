import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/MyTextButton.dart';
import '../../widgets/MyTextField.dart';

class OrderlistEditListDialog extends StatefulWidget {
  const OrderlistEditListDialog({super.key});

  @override
  State<OrderlistEditListDialog> createState() =>
      _OrderlistEditListDialogState();
}

class _OrderlistEditListDialogState extends State<OrderlistEditListDialog> {
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
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 5, right: 10, left: 10, bottom: 5),
                      decoration: BoxDecoration(
                          color: cY,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          )),
                      child: MyText(
                        text: 'ویرایش',
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
            Row(
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: MyTextButton(
                      onTap: () {},
                      size: Size.fromHeight(40),
                      bgColor: cY,
                      child: MyText(
                        text: 'ثبت',
                        size: 14,
                        color: cB,
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: MyTextButton(
                      onTap: () {
                        Navigator.pop(context);
                        Get.toNamed('/order-edit-item');
                      },
                      size: Size.fromHeight(40),
                      bgColor: cY,
                      child: MyText(
                        text: 'ویرایش آیتم ها',
                        size: 14,
                        color: cB,
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
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
