import 'package:bamabin/controller/public_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../widgets/MyText.dart';
import '../widgets/gener_item_main_widget.dart';
import '../widgets/main_title_widget.dart';
import '../widgets/movie_item_widget.dart';

class HomeScreen extends GetView<PublicController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 60,bottom: 20),
      controller: controller.mainScrollController,
      physics: BouncingScrollPhysics(),
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
                spacing: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
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
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              children: [
                MovieItemWidget(
                  isSerial: true,
                  year: '1920',
                  imdbRate: '9',
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
          height: 45,
          width: Get.width,
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                children: [
                  GenerItemMainWidget(
                    title: 'کمدی',
                    onTap: () {},
                  ),
                  GenerItemMainWidget(
                    title: 'علمی تخیلی',
                    onTap: () {},
                  ),
                  GenerItemMainWidget(
                    title: 'کمدی',
                    onTap: () {},
                  ),
                  GenerItemMainWidget(
                    title: 'علمی تخیلی',
                    onTap: () {},
                  ),
                  GenerItemMainWidget(
                    title: 'کمدی',
                    onTap: () {},
                  ),
                  GenerItemMainWidget(
                    title: 'علمی تخیلی',
                    onTap: () {},
                  ),
                  GenerItemMainWidget(
                    title: 'کمدی',
                    onTap: () {},
                  ),
                  GenerItemMainWidget(
                    title: 'علمی تخیلی',
                    onTap: () {},
                  ),
                ],
              )),
        ),
        MainTitleWidget(title: 'سریال های جدید'),
        SizedBox(
          height: 205,
          width: Get.width,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
              physics: BouncingScrollPhysics(),
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
        MainTitleWidget(title: 'سریال های جدید'),
        SizedBox(
          height: 205,
          width: Get.width,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
              physics: BouncingScrollPhysics(),
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
      ],
    );
  }
}
