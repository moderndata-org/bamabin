import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/controller/main_controller.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../screens/dialogs/tokenBot_dialog.dart';

class CustomDrawerMenu extends GetView<MainController> {
  CustomDrawerMenu({super.key});
  final publicController = Get.find<PublicController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: Get.height,
      margin: EdgeInsets.only(right: 10, top: 10, bottom: 10),
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: cBgDrawer, borderRadius: BorderRadius.circular(5)),
                child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    physics: BouncingScrollPhysics(),
                    children: [
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: cDrawerGrey,
                              boxShadow: [bsTextLowOpacity],
                              shape: BoxShape.circle,
                              // image: DecorationImage(
                              //   image: AssetImage('assets/images/bg_crausel.jpg'),
                              //   fit: BoxFit.cover,
                            ),
                            child: Icon(
                              shadows: [bsTextLowOpacity],
                              Icons.account_circle_outlined,
                              color: cPrimary,
                              size: 60,
                            ),
                          ),

                          // child:
                          // CircleAvatar(
                          //   backgroundColor: cGrey,
                          //   backgroundImage: AssetImage(''),
                          // ),

                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: SizedBox(
                            height: 100,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: MyText(text: 'کاربر مهمان')),
                                  Obx(() {
                                    return publicController.hasSubscribe.isFalse
                                        ? SizedBox()
                                        : Align(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              textDirection: TextDirection.rtl,
                                              children: [
                                                MyText(
                                                  text: '50',
                                                  color: cY,
                                                  size: 10,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                MyText(
                                                  text:
                                                      'روز از اشتراک شما باقی مانده',
                                                  size: 10,
                                                ),
                                              ],
                                            ));
                                  }),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        (authController.isLogin.isTrue)
                                            ? Get.toNamed('/profile')
                                            : Get.toNamed('/signin');
                                        controller.scaffolState.currentState!
                                            .closeEndDrawer();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [bsTextLowOpacity],
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: cBgDrawerItem,
                                        ),
                                        padding: EdgeInsets.only(
                                            right: 10,
                                            left: 10,
                                            top: 5,
                                            bottom: 5),
                                        child: MyText(
                                          text: (authController.isLogin.isTrue)
                                              ? 'ویرایش پروفایل'
                                              : 'ورود / ثبت نام',
                                          color: cW,
                                          size: 13,
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                          ))
                        ],
                      ),
                      //! Start Buttons
                      SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        return MyTextButton(
                            size: Size.fromHeight(45),
                            boxShadow: bsTextLowOpacity,
                            bgColor: cBgDrawerItem,
                            onTap: () {
                              publicController.hasSubscribe(
                                  !publicController.hasSubscribe.value);
                              if (publicController.hasSubscribe.value) {
                                Get.toNamed('/subscribe');
                                controller.scaffolState.currentState!
                                    .closeEndDrawer();
                              }
                            },
                            child: Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                Icon(
                                  shadows: [bsTextLowOpacity],
                                  Icons.subscriptions_rounded,
                                  color: cW,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                MyText(
                                  text: publicController.hasSubscribe.value
                                      ? 'تمدید اشتراک'
                                      : 'خرید اشتراک',
                                  color: cW,
                                  size: 14,
                                  shadows: [bsText],
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ));
                      }),
                      SizedBox(
                        height: 5,
                      ),
                      MyTextButton(
                          size: Size.fromHeight(45),
                          boxShadow: bsTextLowOpacity,
                          bgColor: cBgDrawerItem,
                          onTap: () {
                            Get.toNamed('/notifications');
                            controller.scaffolState.currentState!
                                .closeEndDrawer();
                          },
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Icon(
                                shadows: [bsTextLowOpacity],
                                Icons.notifications,
                                color: cW,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MyText(
                                text: 'اعلانات',
                                color: cW,
                                size: 14,
                                shadows: [bsText],
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      MyTextButton(
                          size: Size.fromHeight(45),
                          boxShadow: bsTextLowOpacity,
                          bgColor: cBgDrawerItem,
                          onTap: () {
                            Get.toNamed('/recent-views');
                            controller.scaffolState.currentState!
                                .closeEndDrawer();
                          },
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Icon(
                                shadows: [bsTextLowOpacity],
                                Icons.access_time_filled_rounded,
                                color: cW,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MyText(
                                text: 'لیست مشاهده‌ی اخیر',
                                color: cW,
                                size: 14,
                                shadows: [bsText],
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      MyTextButton(
                          size: Size.fromHeight(45),
                          boxShadow: bsTextLowOpacity,
                          bgColor: cBgDrawerItem,
                          onTap: () {
                            Get.toNamed('/favorite');
                            controller.scaffolState.currentState!
                                .closeEndDrawer();
                          },
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Icon(
                                shadows: [bsTextLowOpacity],
                                Icons.favorite,
                                color: cW,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MyText(
                                text: 'علاقه‌مندی ‌ها',
                                color: cW,
                                size: 14,
                                shadows: [bsText],
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      MyTextButton(
                          size: Size.fromHeight(45),
                          boxShadow: bsTextLowOpacity,
                          bgColor: cBgDrawerItem,
                          onTap: () {
                            Get.toNamed('/download-manager');
                            controller.scaffolState.currentState!
                                .closeEndDrawer();
                          },
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Icon(
                                shadows: [bsTextLowOpacity],
                                Icons.download_rounded,
                                color: cW,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MyText(
                                text: 'دانلود‌ها',
                                color: cW,
                                size: 14,
                                shadows: [bsText],
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      MyTextButton(
                          size: Size.fromHeight(45),
                          boxShadow: bsTextLowOpacity,
                          bgColor: cBgDrawerItem,
                          onTap: () {
                            Get.toNamed('/order');
                            controller.scaffolState.currentState!
                                .closeEndDrawer();
                          },
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Icon(
                                shadows: [bsTextLowOpacity],
                                Icons.folder_special_rounded,
                                color: cW,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MyText(
                                text: 'لیست سفارشی',
                                color: cW,
                                size: 14,
                                shadows: [bsText],
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      MyTextButton(
                          size: Size.fromHeight(45),
                          boxShadow: bsTextLowOpacity,
                          bgColor: cBgDrawerItem,
                          onTap: () {
                            Get.toNamed('/tickets');
                            controller.scaffolState.currentState!
                                .closeEndDrawer();
                          },
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Icon(
                                shadows: [bsTextLowOpacity],
                                Icons.confirmation_num_rounded,
                                color: cW,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MyText(
                                text: 'تیکت',
                                color: cW,
                                size: 14,
                                shadows: [bsText],
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      MyTextButton(
                          size: Size.fromHeight(45),
                          boxShadow: bsTextLowOpacity,
                          bgColor: cBgDrawerItem,
                          onTap: () {
                            Get.toNamed('/request');
                            controller.scaffolState.currentState!
                                .closeEndDrawer();
                          },
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Icon(
                                shadows: [bsTextLowOpacity],
                                Icons.video_call_rounded,
                                color: cW,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MyText(
                                text: 'درخواست فیلم و سریال',
                                color: cW,
                                size: 14,
                                shadows: [bsText],
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      MyTextButton(
                          size: Size.fromHeight(45),
                          boxShadow: bsTextLowOpacity,
                          bgColor: cBgDrawerItem,
                          onTap: () {
                            showDialog(
                              barrierColor: cBgDialogColor,
                              context: context,
                              builder: (context) {
                                return TokenBotDialog();
                              },
                            );
                          },
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Icon(
                                shadows: [bsTextLowOpacity],
                                Icons.smart_toy_rounded,
                                color: cW,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MyText(
                                text: 'توکن ربات و انتقال اشتراک',
                                color: cW,
                                size: 14,
                                shadows: [bsText],
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      MyTextButton(
                          size: Size.fromHeight(45),
                          boxShadow: bsTextLowOpacity,
                          bgColor: cBgDrawerItem,
                          onTap: () {
                            Navigator.pop(context);
                            Get.toNamed('/aboutus');
                          },
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Icon(
                                shadows: [bsTextLowOpacity],
                                Icons.info_rounded,
                                color: cW,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MyText(
                                text: 'درباره ما',
                                color: cW,
                                size: 14,
                                shadows: [bsText],
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      MyTextButton(
                          size: Size.fromHeight(45),
                          boxShadow: bsTextLowOpacity,
                          bgColor: cBgDrawerItem,
                          onTap: () {},
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Icon(
                                shadows: [bsTextLowOpacity],
                                Icons.cancel,
                                color: cR,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MyText(
                                text: 'خروج',
                                color: cW,
                                size: 14,
                                shadows: [bsText],
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )),

                      //! End Buttons
                    ]),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            MyTextButton(
                size: Size.fromHeight(45),
                boxShadow: bsTextLowOpacity,
                bgColor: Color.fromARGB(255, 34, 158, 217),
                onTap: () {},
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/ic_telegram.svg',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MyText(
                      text: 'تلگرام',
                      color: cW,
                      size: 14,
                      shadows: [bsText],
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                )),
            SizedBox(
              height: 5,
            ),
            Container(
              width: Get.width,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 238, 42, 123),
                    Color.fromARGB(255, 98, 40, 215)
                  ])),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: cW.withOpacity(.1),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {},
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      SvgPicture.asset('assets/svg/ic_instagram.svg'),
                      SizedBox(
                        width: 10,
                      ),
                      MyText(
                        text: 'اینستاگرام',
                        color: cW,
                        size: 14,
                        shadows: [bsText],
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
