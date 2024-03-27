import 'package:bamabin/controller/download_manager_controller.dart';
import 'package:bamabin/models/dlbox_item_model.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/colors.dart';
import '../../constant/utils.dart';
import '../../widgets/MyText.dart';

class DownloadMethodDialog extends StatelessWidget {
  const DownloadMethodDialog({required this.dlboxItem, super.key});
  final DlboxItem dlboxItem;

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
                      text: 'دانلود',
                      color: cW,
                      size: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: MyTextButton(
                    onTap: () {
                      Get.back();
                      openADM(url: '${dlboxItem.link}');
                    },
                    child: MyText(text: 'دانلود با ADM'))),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: MyTextButton(
                    onTap: () {
                      Get.back();
                      launchTheUrl(url: '${dlboxItem.link}');
                    },
                    child: MyText(text: 'دانلود با مرورگر'))),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
