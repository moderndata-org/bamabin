import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/MyCircularProgress.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/movie_item_widget.dart';

class MainScreen extends GetView<PublicController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: cPrimary,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: NotificationListener<ScrollEndNotification>(
            onNotification: (notification) {
              // print('notification.scrollDelta');
              // print(notification.dragDetails);
              // print('notification.metrics');
              // print(notification.metrics);
              return true;
            },
            child: ListView(
              children: [
                SizedBox(
                  height: 200,
                  width: Get.width,
                  child: CarouselSlider(
                      options: CarouselOptions(
                        disableCenter: true,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        autoPlayAnimationDuration: const Duration(seconds: 2),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0,
                        onPageChanged: (index, reason) {
                          controller.homeBannerIndex(index);
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                      items: List.generate(
                        2,
                        (index) => Stack(
                          children: [
                            SizedBox(
                              width: Get.width,
                              height: 200,
                              child: Image.asset('assets/images/bg_crausel.jpg',
                                  fit: BoxFit.fill),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                        cB.withOpacity(.7),
                                        Colors.transparent
                                      ])),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: MyText(
                                      text: 'Star Trek 2009',
                                      padding: EdgeInsets.only(bottom: 5),
                                      size: 15,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      )),
                ),
                Obx(() => DotsIndicator(
                      dotsCount: 2,
                      position: controller.homeBannerIndex.value,
                      decorator: DotsDecorator(
                        activeColor: cR,
                        color: cGrey,
                        spacing:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                        size: const Size.square(7),
                        activeSize: const Size(20.0, 7),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    )),
                MainTitleWidget(title: 'سریال های جدید'),
                SizedBox(
                  height: 205,
                  width: Get.width,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      scrollDirection: Axis.horizontal,
                      children: [
                        MovieItemWidget(
                          isSerial: true,
                          year: '1920',
                        ),

                        MovieItemWidget(
                          title: 'Forrest Gump',
                          isSerial: false,
                          year: '1994',
                          hasDubbed: true,
                          hasSubtitle: true,
                          imdbRate: '8.7',
                          image: 'assets/images/bg_forrest.jpg',
                        ),
                        MovieItemWidget(
                          isSerial: false,
                          year: '2010',
                          hasDubbed: true,
                          hasSubtitle: false,
                          imdbRate: '5.7',
                        ),
                        MovieItemWidget(
                          isSerial: false,
                          year: '2010',
                          hasDubbed: false,
                          hasSubtitle: true,
                          imdbRate: '6',
                        ),
                      ],
                    ),
                  ),
                ),
                MainTitleWidget(title: 'ژانر ‌ها'),
                SizedBox(
                  height: 40,
                  width: Get.width,
                  child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        children: [
                          GenerItemWidget(title: 'کمدی'),
                          GenerItemWidget(title: 'علمی تخیلی'),
                          GenerItemWidget(title: 'کمدی'),
                          GenerItemWidget(title: 'علمی تخیلی'),
                          GenerItemWidget(title: 'کمدی'),
                          GenerItemWidget(title: 'علمی تخیلی'),
                          GenerItemWidget(title: 'کمدی'),
                          GenerItemWidget(title: 'علمی تخیلی'),
                        ],
                      )),
                )
              ],
            )),
      ),
    ));
  }
}

class GenerItemWidget extends StatelessWidget {
  const GenerItemWidget({
    this.title,
    super.key,
  });
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(color: cBgGener,borderRadius: BorderRadius.circular(10)),
      width: 100,
      child: MyText(
        text: title??'',
        size: 13,
      ),
    );
  }
}

class MainTitleWidget extends StatelessWidget {
  const MainTitleWidget({
    this.title,
    super.key,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 15,
        ),
        MyText(
          text: title ?? '',
          padding: EdgeInsets.only(top: 5),
        ),
        Spacer(),
        SizedBox(
          width: 66,
          child: MyTextButton(
            onTap: () {},
            bgColor: cPrimary,
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                MyText(
                  text: 'بیشتر',
                  color: cAccent,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: cAccent,
                  size: 15,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
