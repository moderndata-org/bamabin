import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomDrawerMenu extends GetView<PublicController> {
  const CustomDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: Get.height * .93,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: cPrimary, borderRadius: BorderRadius.circular(20)),
      child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          physics: BouncingScrollPhysics(),
          children: [
            Row(
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircleAvatar(
                    backgroundColor: cGrey,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: SizedBox(
                  height: 100,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                            alignment: Alignment.centerRight,
                            child: MyText(text: 'کاربر مهمان')),
                        Obx(() {
                          return controller.hasSubscribe.isFalse
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
                                        text: 'روز از اشتراک شما باقی مانده',
                                        size: 10,
                                      ),
                                    ],
                                  ));
                        }),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: cY,
                              ),
                              padding:
                                  EdgeInsets.only(right: 10, left: 10, top: 5),
                              child: MyText(
                                text: 'ویرایش پروفایل',
                                color: cB,
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
                  bgColor: cY,
                  onTap: () {
                    controller.hasSubscribe(!controller.hasSubscribe.value);
                  },
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(
                        Icons.subscriptions_rounded,
                        color: cB,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MyText(
                        text: controller.hasSubscribe.value
                            ? 'تمدید اشتراک'
                            : 'خرید اشتراک',
                        color: cB,
                        size: 14,
                      )
                    ],
                  ));
            }),
            SizedBox(
              height: 5,
            ),
            MyTextButton(
                onTap: () {},
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Icon(
                      Icons.notifications,
                      color: cDrawerGrey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MyText(
                      text: 'اعلانات',
                      color: cDrawerGrey,
                      size: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )),
            SizedBox(
              height: 5,
            ),
            MyTextButton(
                onTap: () {},
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Icon(
                      Icons.access_time_filled_rounded,
                      color: cDrawerGrey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MyText(
                      text: 'لیست مشاهده‌ی اخیر',
                      color: cDrawerGrey,
                      size: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )),
            SizedBox(
              height: 5,
            ),
            MyTextButton(
                onTap: () {
                  Get.toNamed('/favorite');
                  controller.scaffolState.currentState!.closeEndDrawer();
                },
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: cDrawerGrey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MyText(
                      text: 'علاقه‌مندی ‌ها',
                      color: cDrawerGrey,
                      size: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )),
            SizedBox(
              height: 5,
            ),
            MyTextButton(
                onTap: () {},
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Icon(
                      Icons.download_rounded,
                      color: cDrawerGrey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MyText(
                      text: 'دانلود‌ها',
                      color: cDrawerGrey,
                      size: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )),
            SizedBox(
              height: 5,
            ),
            MyTextButton(
                onTap: () {
                  Get.toNamed('/order');
                  controller.scaffolState.currentState!.closeEndDrawer();
                },
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Icon(
                      Icons.folder_special_rounded,
                      color: cDrawerGrey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MyText(
                      text: 'لیست سفارشی',
                      color: cDrawerGrey,
                      size: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )),
            SizedBox(
              height: 5,
            ),
            MyTextButton(
                onTap: () {},
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Icon(
                      Icons.support,
                      color: cDrawerGrey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MyText(
                      text: 'تیکت',
                      color: cDrawerGrey,
                      size: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )),
            SizedBox(
              height: 5,
            ),
            MyTextButton(
                onTap: () {},
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Icon(
                      Icons.video_call_rounded,
                      color: cDrawerGrey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MyText(
                      text: 'درخواست فیلم و سریال',
                      color: cDrawerGrey,
                      size: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )),
            SizedBox(
              height: 5,
            ),
            MyTextButton(
                onTap: () {},
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Icon(
                      Icons.smart_toy_rounded,
                      color: cDrawerGrey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MyText(
                      text: 'توکن ربات و انتقال اشتراک',
                      color: cDrawerGrey,
                      size: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )),
            SizedBox(
              height: 5,
            ),
            MyTextButton(
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed('/aboutus');
                },
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Icon(
                      Icons.info_rounded,
                      color: cDrawerGrey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MyText(
                      text: 'درباره ما',
                      color: cDrawerGrey,
                      size: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )),
            SizedBox(
              height: 5,
            ),
            MyTextButton(
                bgColor: Color.fromARGB(255, 34, 158, 217),
                onTap: () {},
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    SvgPicture.asset('assets/svg/ic_telegram.svg'),
                    SizedBox(
                      width: 10,
                    ),
                    MyText(
                      text: 'تلگرام',
                      color: cDrawerGrey,
                      size: 14,
                      fontWeight: FontWeight.w400,
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
                  borderRadius: BorderRadius.circular(10),
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
                          borderRadius: BorderRadius.circular(10))),
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
                        color: cDrawerGrey,
                        size: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 5,
            ),
            MyTextButton(
                onTap: () {},
                bgColor: cR.withOpacity(.1),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Icon(
                      Icons.cancel,
                      color: cR,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MyText(
                      text: 'خروج',
                      color: cR,
                      size: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )),

            //! End Buttons
          ]),
    );
  }
}
