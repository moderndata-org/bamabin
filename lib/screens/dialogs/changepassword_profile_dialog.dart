import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/widgets/MyCircularProgress.dart';
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
  final controller = Get.find<AuthController>();
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
                      text: 'تغییر رمز ورود',
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
                hint: 'رمز عبور قبلی',
                controller: txtOldPassword!,
                isPassword: true,
                maxLines: 1,
                prefixIcon: Icon(
                  Icons.lock,
                  size: 25,
                  color: cW,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: MyTextField(
                height: 45,
                hint: 'رمز عبور جدید',
                controller: txtNewPassword!,
                isPassword: true,
                maxLines: 1,
                prefixIcon: Icon(
                  Icons.lock,
                  size: 25,
                  color: cW,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: MyTextField(
                height: 45,
                hint: 'تکرار رمز عبور جدید',
                controller: txtNewPasswordRepeat!,
                isPassword: true,
                maxLines: 1,
                prefixIcon: Icon(
                  Icons.lock,
                  size: 25,
                  color: cW,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: MyTextButton(
                  onTap: () => controller.changePassword(
                      current_password: txtOldPassword!.text,
                      password: txtNewPassword!.text,
                      re_password: txtNewPasswordRepeat!.text),
                  size: Size.fromHeight(40),
                  bgColor: cY,
                  child: Obx(() => controller.isChangingPassword.isTrue
                      ? MyCircularProgress(
                          color: cB,
                          size: 20,
                        )
                      : MyText(
                          text: 'ثبت',
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
