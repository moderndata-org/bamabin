import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/screens/dialogs/changepassword_profile_dialog.dart';
import 'package:bamabin/widgets/back_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/MyCircularProgress.dart';
import '../widgets/MyText.dart';
import '../widgets/MyTextButton.dart';
import '../widgets/MyTextField.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late AuthController controller;
  TextEditingController? txtName;
  TextEditingController? txtFamily;
  // TextEditingController? txtEmail;
  TextEditingController? txtNickname;
  TextEditingController? txtCity;
  TextEditingController? txtPhone;
  TextEditingController? txtAboutMe;
  @override
  void initState() {
    controller = Get.find<AuthController>();
    txtName = TextEditingController();
    txtFamily = TextEditingController();
    // txtEmail = TextEditingController();
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
    // txtEmail?.dispose();
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
                            hint: 'نام',
                            controller: txtName!,
                            prefixIcon: Icon(
                              Icons.account_circle_rounded,
                              size: 30,
                              color: cW,
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
                              color: cW,
                            ),
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // MyTextField(
                          //   hint: 'ایمیل',
                          //   controller: txtEmail!,
                          //   prefixIcon: Icon(
                          //     Icons.mail,
                          //     size: 30,
                          //     color: cW,
                          //   ),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          MyTextField(
                            hint: 'نام نمایشی',
                            controller: txtNickname!,
                            prefixIcon: Icon(
                              Icons.assignment_ind,
                              size: 30,
                              color: cW,
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
                              color: cW,
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
                              color: cW,
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
                              color: cW,
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
                                size: Size(110, 40),
                                bgColor: cGrey,
                                child: MyText(
                                  text: 'تغییر رمز ورود',
                                  size: 14,
                                  color: cW,
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: Get.width,
                            height: 45,
                            child: MyTextButton(
                                onTap: () => controller.updateProfile(
                                    first_name: txtName!.text,
                                    last_name: txtFamily!.text,
                                    phone: txtPhone!.text,
                                    nickname: txtNickname!.text,
                                    city: txtCity!.text,
                                    description: txtAboutMe!.text),
                                bgColor: cY,
                                child: Obx(() =>
                                    controller.isLoadingUpdateProfile.isTrue
                                        ? MyCircularProgress(
                                            color: cB,
                                            size: 25,
                                          )
                                        : MyText(
                                            text: 'ذخیره تغییرات',
                                            size: 15,
                                            color: cB,
                                            fontWeight: FontWeight.w500,
                                          ))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 10,
                left: 20,
                child: BackButtonCustom(
                  bgColor: cPrimary,
                  hasPaddin: false,
                )),
          ],
        ),
      ),
    ));
  }
}
