import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/screens/authentication/signin_screen.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextField.dart';
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
      body: Stack(
        children: [
          BottomBlackGradientWidget(),
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: MyTextButton(
                        size: const Size(40, 40),
                        onTap: () => Navigator.pop(context),
                        fgColor: cGrey,
                        bgColor: cPrimaryDark,
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: cGrey,
                        )),
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
                    color: cPrimaryDark,
                    borderRadius: BorderRadius.circular(20)),
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
                              checkColor: cPrimaryDark,
                              splashRadius: 0,
                              visualDensity: VisualDensity.compact,
                              activeColor: cAccent,
                              side: BorderSide(color: cAccent),
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
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ],
      ),
    ));
  }
}
