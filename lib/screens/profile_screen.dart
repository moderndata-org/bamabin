import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/screens/dialogs/profile_changepassword_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/MyText.dart';
import '../widgets/MyTextButton.dart';
import '../widgets/MyTextField.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late PublicController controller;
  TextEditingController? txtName;
  TextEditingController? txtFamily;
  TextEditingController? txtEmail;
  TextEditingController? txtNickname;
  TextEditingController? txtCity;
  TextEditingController? txtPhone;
  TextEditingController? txtAboutMe;
  @override
  void initState() {
    controller = Get.find<PublicController>();
    txtName = TextEditingController();
    txtFamily = TextEditingController();
    txtEmail = TextEditingController();
    txtNickname = TextEditingController();
    txtCity = TextEditingController();
    txtPhone = TextEditingController();
    txtAboutMe = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    txtName?.dispose();
    txtFamily?.dispose();
    txtEmail?.dispose();
    txtNickname?.dispose();
    txtCity?.dispose();
    txtPhone?.dispose();
    txtAboutMe?.dispose();
    super.dispose();
  }

//
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: cPrimary,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            SizedBox(
              width: Get.width,
              height: Get.height,
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 20),
                children: [
                  Container(
                    width: Get.width * .3,
                    height: Get.width * .3,
                    decoration: BoxDecoration(
                      color: cDrawerGrey,
                      boxShadow: [bs010of],
                      shape: BoxShape.circle,
                      // image: DecorationImage(
                      //   image: AssetImage('assets/images/bg_crausel.jpg'),
                      //   fit: BoxFit.cover,
                    ),
                    child: Icon(
                      Icons.account_circle_outlined,
                      color: cPrimary,
                      size: Get.width * .25,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      width: Get.width * .9,
                      decoration: BoxDecoration(
                          color: cPrimaryDark,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          MyTextField(
                            hint: 'نام کاربری',
                            controller: txtName!,
                            prefixIcon: Icon(
                              Icons.account_circle_rounded,
                              size: 30,
                              color: cGrey,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MyTextField(
                            hint: 'نام خانوادگی',
                            controller: txtFamily!,
                            prefixIcon: Icon(
                              Icons.account_circle_rounded,
                              size: 30,
                              color: cGrey,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MyTextField(
                            hint: 'ایمیل',
                            controller: txtEmail!,
                            prefixIcon: Icon(
                              Icons.mail,
                              size: 30,
                              color: cGrey,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MyTextField(
                            hint: 'نام نمایشی',
                            controller: txtNickname!,
                            prefixIcon: Icon(
                              Icons.assignment_ind,
                              size: 30,
                              color: cGrey,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MyTextField(
                            hint: 'شهر',
                            controller: txtCity!,
                            prefixIcon: Icon(
                              Icons.apartment_rounded,
                              size: 30,
                              color: cGrey,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MyTextField(
                            hint: 'شماره تماس',
                            controller: txtCity!,
                            prefixIcon: Icon(
                              Icons.phone_enabled_rounded,
                              size: 30,
                              color: cGrey,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MyTextField(
                            hint: 'درباره من',
                            controller: txtCity!,
                            maxLines: 2,
                            prefixIcon: Icon(
                              Icons.info,
                              size: 30,
                              color: cGrey,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: MyTextButton(
                                onTap: () {
                                  showDialog(
                                    barrierColor: cBgDialogColor,
                                    context: context,
                                    builder: (context) =>
                                        ProfileChangePasswordDialog(),
                                  );
                                },
                                size: Size(110, 35),
                                bgColor: cY,
                                child: MyText(
                                  text: 'تغییر رمز ورود',
                                  size: 14,
                                  color: cB,
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MyTextButton(
                              onTap: () {},
                              bgColor: cY,
                              child: MyText(
                                text: 'ذخیره تغییرات',
                                size: 14,
                                color: cB,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: MyTextButton(
                  onTap: () => Navigator.pop(context),
                  size: Size(40, 40),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: 0,
                        left: -4,
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: cGrey,
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
