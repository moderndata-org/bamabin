import 'package:bamabin/controller/main_controller.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/widgets/genre_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../constant/colors.dart';
import '../controller/detail_controller.dart';
import '../widgets/MyText.dart';
import '../widgets/movie_detail/main_title_widget.dart';
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
        Obx(() => (mainController.isLoadingMain.isTrue)
            ? Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: CircularProgressIndicator(
                    color: cAccent,
                  ),
                ),
              )
            : Column(
                children:
                    List.generate(mainController.sectionsList.length, (index) {
                  var section = mainController.sectionsList[index];
                  switch (section.type) {
                    case "genres":
                      return Column(
                        children: [
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
                                  itemCount: section.genres!.length,
                                  physics: BouncingScrollPhysics(),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    var genre = section.genres![index];
                                    return Center(
                                      child: GenreItem(
                                        width: 100,
                                        height: 55,
                                        title: genre.name,
                                        imageUrl: genre.icon,
                                        backgroundUrl: genre.background_url,
                                        margin: EdgeInsets.only(right: 5),
                                        boxShadow: BoxShadow(
                                            blurRadius: 2,
                                            offset: Offset(0, 1),
                                            color:
                                                Colors.black.withOpacity(.2)),
                                      ),
                                    );
                                  },
                                )),
                          )
                        ],
                      );
                    case "last_data":
                      return Column(
                        children: [
                          MainTitleWidget(
                            icon: (section.icon != null)
                                ? CachedNetworkImage(imageUrl: section.icon!)
                                : null,
                            title: '${section.name}',
                            onTapMore: () {
                              Get.toNamed("/more", arguments: {
                                "title": "${section.name}",
                                "filter_key": (section.taxonomy != null)
                                    ? section.taxonomy
                                    : "type",
                                "filter_value": (section.taxonomy != null)
                                    ? section.id
                                    : section.post_type![0]
                              });
                            },
                          ),
                          SizedBox(
                            height: 200,
                            width: Get.width,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: ListView.builder(
                                itemCount: section.posts!.length,
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  var film = section.posts![index];
                                  return MovieItemWidget(
                                    title: '${film.titleMovie}',
                                    hasDubbed: film.hasDubbed != '',
                                    hasSubtitle: film.hasSubtitle == 'on',
                                    imdbRate: '${film.imdbRate}',
                                    year: film.release!.length > 0
                                        ? '${film.release?.first.name}'
                                        : '',
                                    image: film.thumbnail,
                                    onTap: () {
                                      var detail = Get.find<DetailController>();
                                      detail.selectedFilm(film);
                                      Get.toNamed('/movie-detail');
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    case "single":
                      if (section.post == null) return Container();
                      return PromoteWidget(
                        title: "${section.post?.enTitle}",
                        imageUrl: section.post!.bgThumbnail,
                        onDetail: () {
                          var detail = Get.find<DetailController>();
                          detail.selectedFilm(section.post);
                          Get.toNamed('/movie-detail');
                        },
                      );
                  }

                  return Text("data");
                }),
              ))
      ],
    );
  }
}
