import 'package:bamabin/controller/main_controller.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/widgets/custom_shimmer.dart';
import 'package:bamabin/widgets/genre_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../constant/colors.dart';
import '../widgets/MyText.dart';
import '../widgets/main_title_widget.dart';
import '../widgets/movie_item_widget.dart';
import '../widgets/promote_widget.dart';

class HomeScreen extends GetView<PublicController> {
  HomeScreen({super.key});
  final mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 60, bottom: 20),
      controller: mainController.mainScrollController,
      physics: BouncingScrollPhysics(),
      children: [
        Obx(() => SizedBox(
              height: 200,
              width: Get.width,
              child: (mainController.isLoadingBanners.isTrue)
                  ? Shimmer(
                      child: Container(
                        height: 200,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 52, 52, 52),
                            Color.fromARGB(255, 93, 93, 93),
                            Color.fromARGB(255, 52, 52, 52),
                          ]),
                    )
                  : CarouselSlider(
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
                        mainController.sliderList.length,
                        (index) {
                          var slider = mainController.sliderList[index];
                          return Stack(
                            children: [
                              SizedBox(
                                width: Get.width,
                                height: 200,
                                child: CachedNetworkImage(
                                  imageUrl: '${slider.bgThumbnail}',
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Center(
                                      child: Shimmer(
                                    child: Container(
                                      height: 200,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color.fromARGB(255, 52, 52, 52),
                                          Color.fromARGB(255, 93, 93, 93),
                                          Color.fromARGB(255, 52, 52, 52),
                                        ]),
                                  )),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: Container(
                                    height: 50,
                                    decoration:
                                        BoxDecoration(gradient: fadeGradient()),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: MyText(
                                        text: '${slider.title}',
                                        padding: EdgeInsets.only(bottom: 5),
                                        size: 15,
                                      ),
                                    ),
                                  ))
                            ],
                          );
                        },
                      )),
            )),
        Obx(() => mainController.isLoadingBanners.value
            ? SizedBox()
            : DotsIndicator(
                dotsCount: mainController.sliderList.length,
                position: controller.homeBannerIndex.value,
                decorator: DotsDecorator(
                  activeColor: cSecondaryLight,
                  color: cW.withOpacity(.6),
                  spacing: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                  size: const Size.square(6),
                  activeSize: const Size(20.0, 6),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              )),
        PromoteWidget(
            title: 'Borat: Cultural Learnings of America for Make Benefit'),
        MainTitleWidget(title: 'سریال های جدید'),
        SizedBox(
          height: 200,
          width: Get.width,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView.builder(
              itemCount: 2,
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
            Get.toNamed('geners');
          },
        ),
        SizedBox(
          height: 60,
          width: Get.width,
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.builder(
                itemCount: 2,
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
              itemCount: 2,
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
      ],
    );
  }
}
