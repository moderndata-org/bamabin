import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/widgets/MyCircularProgress.dart';
import 'package:bamabin/widgets/back_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
import '../../constant/utils.dart';
import '../../widgets/MyText.dart';
import '../../widgets/MyTextButton.dart';
import '../../widgets/MyTextField.dart';

class ForgetPasswordScreen extends GetView<AuthController> {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: cPrimary,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: BackButtonCustom(
                  bgColor: cPrimary,
                )),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: Get.width * .6,
              child: Image.asset('assets/images/ic_logotype.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: Get.width * .8,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                  color: cPrimaryDark, borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  MyText(
                    text: 'فراموشی رمز عبور',
                    color: cAccent,
                    size: 15,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    hint: 'ایمیل',
                    controller: controller.txtEmail,
                    prefixIcon: Icon(
                      Icons.account_circle_rounded,
                      size: 30,
                      color: cW,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(
                        size: 25,
                        Icons.info,
                        color: cGrey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: MyText(
                          textAlign: TextAlign.right,
                          text:
                              'لینک بازیابی رمزعبور به ایمیل شما ارسال خواهد شد',
                          color: cW,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
            MyTextButton(
              size: Size(Get.width * .8, 55),
              bgColor: cAccent,
              onTap: () {
                if (controller.txtEmail.text.trim().isNotEmpty) {
                  controller.forgotPassword(
                      email: controller.txtEmail.text.trim());
                } else {
                  showMessage(
                      text: "لطفا ایمیل را صحیح وارد کنید.", isSucces: false);
                }
              },
              child: Obx(() {
                return (controller.isForgotPasswordRegister.isTrue)
                    ? MyCircularProgress(
                        color: Colors.black,
                        size: 28,
                      )
                    : MyText(
                        text: 'ارسال',
                        color: cB,
                        size: 15,
                      );
              }),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    ));
  }
}
