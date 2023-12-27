import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/MyTextButton.dart';
import '../../widgets/MyTextField.dart';

class ProfileChangePasswordDialog extends StatefulWidget {
  const ProfileChangePasswordDialog({super.key});

  @override
  State<ProfileChangePasswordDialog> createState() =>
      _ProfileChangePasswordDialogState();
}

class _ProfileChangePasswordDialogState
    extends State<ProfileChangePasswordDialog> {
  final controller = Get.find<PublicController>();
  TextEditingController? txtOldPassword;
  TextEditingController? txtNewPassword;
  TextEditingController? txtNewPasswordRepeat;

  @override
  void initState() {
    txtOldPassword = TextEditingController();
    txtNewPassword = TextEditingController();
    txtNewPasswordRepeat = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    txtOldPassword?.dispose();
    txtNewPassword?.dispose();
    txtNewPasswordRepeat?.dispose();
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
                        text: 'تغییر رمز ورود',
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
                hint: 'رمز عبور قبلی',
                controller: txtOldPassword!,
                maxLines: 1,
                prefixIcon: Icon(
                  Icons.lock,
                  size: 25,
                  color: cGrey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: MyTextField(
                height: 45,
                hint: 'رمز عبور جدید',
                controller: txtNewPassword!,
                maxLines: 1,
                prefixIcon: Icon(
                  Icons.lock,
                  size: 25,
                  color: cGrey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: MyTextField(
                height: 45,
                hint: 'تکرار رمز عبور جدید',
                controller: txtNewPasswordRepeat!,
                maxLines: 1,
                prefixIcon: Icon(
                  Icons.lock,
                  size: 25,
                  color: cGrey,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: MyTextButton(
                  onTap: () {},
                  size: Size.fromHeight(40),
                  bgColor: cY,
                  child: MyText(
                    text: 'ثبت',
                    size: 15,
                    color: cB,
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