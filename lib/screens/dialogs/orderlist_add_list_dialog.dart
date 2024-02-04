import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/MyTextButton.dart';
import '../../widgets/MyTextField.dart';
import '../../widgets/custom_dropdown.dart';

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
                      text: 'افزودن لیست',
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
                  color: cW,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: Get.width,
                child: CustomDropDown(
                  borderRadius: 5,
                  title: 'نوع لیست',
                  list: [],
                  buttonColor: cSecondary,
                  alignment: Alignment.centerRight,
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
                  color: cW,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: Get.width,
                child: MyTextButton(
                    onTap: () {},
                    bgColor: cY,
                    child: MyText(
                      text: 'ثبت لیست',
                      size: 14,
                      color: cB,
                    )),
              ),
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
