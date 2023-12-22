import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bamabin/widgets/MyTextButton.dart';

class SigninScreen extends GetView<AuthController> {
  const SigninScreen({super.key});

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
                        onTap: () {},
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
                      controller: controller.txtUsername,
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 25,
                        color: cGrey,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Get.toNamed('/signup'),
                          child: MyText(
                            text: 'ثبت نام کنید',
                            color: cAccent,
                            textDecoration: TextDecoration.underline,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed('/forgetpassword'),
                          child: MyText(
                            text: 'فراموشی رمز ورود',
                            color: cAccent,
                            textDecoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              Spacer(),
              MyTextButton(
                size: Size(Get.width * .8, 55),
                bgColor: cAccent,
                onTap: () =>Get.toNamed('/main'),
                child: MyText(
                  text: 'ورود',
                  color: cB,
                  size: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: Get.width * .8,
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Expanded(
                      child: MyTextButton(
                        size: Size.fromHeight(55),
                        onTap: () {},
                        bgColor: Colors.transparent,
                        strokeColor: cAccent,
                        child: Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.qr_code_scanner_rounded,
                              color: cAccent,
                            ),
                            MyText(
                              text: 'ورود آسان',
                              color: cW,
                              size: 13,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: MyTextButton(
                        size: Size.fromHeight(55),
                        bgColor: Colors.transparent,
                        onTap: () {},
                        strokeColor: cAccent,
                        child: Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox.square(
                                dimension: 25,
                                child: Image.asset(
                                    'assets/images/ic_google_logo.png')),
                            MyText(
                              text: 'ورود با گوگل',
                              color: cW,
                              size: 13,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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

class BottomBlackGradientWidget extends StatelessWidget {
  const BottomBlackGradientWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      bottom: 0,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [cB.withOpacity(.5), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
      ),
    );
  }
}
