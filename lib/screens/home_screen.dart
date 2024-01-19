import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/widgets/genre_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/colors.dart';
import '../widgets/MyText.dart';
import '../widgets/main_title_widget.dart';
import '../widgets/movie_item_widget.dart';

class HomeScreen extends GetView<PublicController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 60, bottom: 20),
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
                          decoration: BoxDecoration(gradient: fadeGradient()),
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
                activeColor: cSecondaryLight,
                color: cGrey,
                spacing: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                size: const Size.square(6),
                activeSize: const Size(20.0, 6),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            )),
        MainTitleWidget(title: 'سریال های جدید'),
        SizedBox(
          height: 200,
          width: Get.width,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView.builder(
              itemCount: 10,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => MovieItemWidget(
                onTap: () {
                  Get.toNamed('/movie-detail');
                  controller.isSerialOpenedDetail(true);
                },
                title: 'Monarch',
                year: '1920',
                imdbRate: '9',
              ),
            ),
          ),
        ),
        MainTitleWidget(
          title: 'ژانر ‌ها',
          onTapMore: () {
            controller.bottomIndex(5);
            controller.appBarCenterText('ژانر ها');
          },
        ),
        SizedBox(
          height: 60,
          width: Get.width,
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.builder(
                itemCount: 10,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Center(
                  child: GenreItem(
                    width: 100,
                    height: 55,
                    margin: EdgeInsets.only(right: 5),
                    boxShadow: BoxShadow(
                        blurRadius: 2,
                        offset: Offset(0, 1),
                        color: Colors.black.withOpacity(.2)),
                  ),
                ),
              )),
        ),
        MainTitleWidget(title: 'فیلم های جدید'),
        SizedBox(
          height: 205,
          width: Get.width,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) => MovieItemWidget(
                onTap: () {
                  Get.toNamed('/movie-detail');
                  controller.isSerialOpenedDetail(false);
                },
                title: 'Forrest Gump',
                year: '1994',
                hasDubbed: true,
                hasSubtitle: true,
                imdbRate: '8.7',
                image: 'assets/images/bg_forrest.jpg',
              ),
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
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
                  year: '1920',
                ),
                MovieItemWidget(
                  title: 'Forrest Gump',
                  year: '1994',
                  hasDubbed: true,
                  hasSubtitle: true,
                  imdbRate: '8.7',
                  image: 'assets/images/bg_forrest.jpg',
                ),
                MovieItemWidget(
                  year: '2010',
                  hasDubbed: true,
                  hasSubtitle: false,
                  imdbRate: '5.7',
                ),
                MovieItemWidget(
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
