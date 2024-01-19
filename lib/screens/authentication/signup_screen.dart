import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextField.dart';
import 'package:bamabin/widgets/back_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bamabin/widgets/MyTextButton.dart';

class SignupScreen extends GetView<AuthController> {
  const SignupScreen({super.key});

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
                  MyTextField(
                    hint: 'نام کاربری',
                    controller: controller.txtUsername,
                    prefixIcon: Icon(
                      Icons.account_circle_rounded,
                      size: 30,
                      color: cGrey,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MyTextField(
                    hint: 'رمز عبور',
                    controller: controller.txtPasswrod,
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 25,
                      color: cGrey,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MyTextField(
                    hint: 'تکرار رمز عبور',
                    controller: controller.txtPasswrod,
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 25,
                      color: cGrey,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Obx(() => Checkbox(
                            checkColor: cW,
                            splashRadius: 0,
                            visualDensity: VisualDensity.compact,
                            activeColor: cSecondaryLight,
                            side: BorderSide(color: cSecondaryLight),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            value: controller.terms.value,
                            onChanged: (value) => controller.terms(value),
                          )),
                      MyText(
                        text: 'با شرایط و قوانین موافقم',
                        textAlign: TextAlign.right,
                        color: cW,
                        textDecoration: TextDecoration.underline,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            MyTextButton(
              size: Size(Get.width * .8, 55),
              bgColor: cAccent,
              onTap: () {},
              child: MyText(
                text: 'ثبت نام',
                color: cB,
                size: 15,
                fontWeight: FontWeight.bold,
              ),
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
