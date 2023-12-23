import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/screens/authentication/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
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
                    MyText(
                      text: 'فراموشی رمز عبور',
                      color: cAccent,
                      size: 15,
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                            text: 'رمز به ایمیل شما ارسال خواهد شد',
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
                onTap: () {},
                child: MyText(
                  text: 'ارسال',
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
