import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/constant/strings.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/widgets/MyCircularProgress.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:bamabin/widgets/movie_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final controller = Get.find<PublicController>();
  @override
  void initState() {
    controller.isTextExpandedMovieDetail(false);
    controller.isPlayingTrailer(false);
    controller.isLoadingTrailer(true);
    controller.trailerController = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((value) {});
    controller.trailerController.addListener(() {
      if (controller.trailerController.value.position ==
          controller.trailerController.value.duration) {
        controller.isPlayingTrailer(false);
        controller.trailerController.seekTo(Duration.zero);
      }
      controller.isLoadingTrailer(false);
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.trailerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimary,
      body: ListView(
        padding: EdgeInsets.only(bottom: 20),
        children: [
          SizedBox(
            width: Get.width,
            height: 220,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                //! Background Cover
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/bg_crausel.jpg'))),
                ),
                //! Gradient
                Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: fadeGradient(),
                      ),
                    )),
                //! Poster
                Positioned(
                    right: 20,
                    bottom: -10,
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [bs010o5]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 130,
                          height: 190,
                          child: Image.asset(
                            'assets/images/monarch.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )),

                //! Geners
                Positioned(
                    right: 155,
                    bottom: 45,
                    left: 0,
                    child: Container(
                      width: Get.width,
                      height: 25,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ListView.builder(
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                              decoration: BoxDecoration(
                                  color: cPrimary.withOpacity(.8),
                                  border: Border.all(
                                    color: cStrokeGrey.withOpacity(.7),
                                  ),
                                  borderRadius: BorderRadius.circular(5)),
                              margin: EdgeInsets.symmetric(horizontal: 1),
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 4, bottom: 4),
                              child: MyText(
                                text: 'کمدی',
                                size: 11,
                              )),
                        ),
                      ),
                    )),
                //! StarRate
                Positioned(
                    left: 10,
                    bottom: 0,
                    right: 140,
                    child: Row(
                      textDirection: TextDirection.ltr,
                      children: [
                        GestureDetector(
                          onTap: () => controller.setRate(rateNum: 1),
                          child: Obx(() => Icon(
                                controller.starRate.value >= 1
                                    ? Icons.star_rounded
                                    : Icons.star_border_rounded,
                                color: cY,
                                size: 40,
                              )),
                        ),
                        GestureDetector(
                          onTap: () => controller.setRate(rateNum: 2),
                          child: Obx(() => Icon(
                                controller.starRate.value >= 2
                                    ? Icons.star_rounded
                                    : Icons.star_border_rounded,
                                color: cY,
                                size: 40,
                              )),
                        ),
                        GestureDetector(
                          onTap: () => controller.setRate(rateNum: 3),
                          child: Obx(() => Icon(
                                controller.starRate.value >= 3
                                    ? Icons.star_rounded
                                    : Icons.star_border_rounded,
                                color: cY,
                                size: 40,
                              )),
                        ),
                        GestureDetector(
                          onTap: () => controller.setRate(rateNum: 4),
                          child: Obx(() => Icon(
                                controller.starRate.value >= 4
                                    ? Icons.star_rounded
                                    : Icons.star_border_rounded,
                                color: cY,
                                size: 40,
                              )),
                        ),
                        GestureDetector(
                          onTap: () => controller.setRate(rateNum: 5),
                          child: Obx(() => Icon(
                                controller.starRate.value >= 5
                                    ? Icons.star_rounded
                                    : Icons.star_border_rounded,
                                color: cY,
                                size: 40,
                              )),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: MyText(
                text: 'The Thing Called Love',
                textAlign: TextAlign.right,
                size: 15,
                textDirection: TextDirection.ltr,
                textOverflow: TextOverflow.ellipsis,
              )),
              MyText(
                text: 'امتیاز کاربران : 4.5',
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Icon(
                  Icons.star_rounded,
                  color: cY,
                  size: 18,
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: MyText(
                text: 'چیزی به اسم عشق',
                textAlign: TextAlign.right,
                size: 15,
                textDirection: TextDirection.rtl,
                textOverflow: TextOverflow.ellipsis,
              )),
              MyTextButton(
                  borderRadius: 5,
                  size: Size(80, 30),
                  onTap: () {},
                  bgColor: cY,
                  fgColor: cB,
                  child: MyText(
                    text: 'نظر دهید',
                    color: cB,
                  )),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: Get.width,
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: MovieItemSmallDetailWidget(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Icon(
                      Icons.today_rounded,
                      color: cPrimary,
                      size: 19,
                    ),
                  ),
                  title: 'دوشنبه',
                )),
                Expanded(
                    child: MovieItemSmallDetailWidget(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Icon(
                      Icons.live_tv_rounded,
                      color: cPrimary,
                      size: 19,
                    ),
                  ),
                  title: 'NetFlix',
                )),
                Expanded(
                    child: MovieItemSmallDetailWidget(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Icon(
                      Icons.timer,
                      color: cPrimary,
                      size: 19,
                    ),
                  ),
                  title: '106 دقیقه',
                )),
                Expanded(
                    child: MovieItemSmallDetailWidget(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Icon(
                      Icons.calendar_month_rounded,
                      color: cPrimary,
                      size: 19,
                    ),
                  ),
                  title: '1993',
                )),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            width: Get.width,
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: MovieItemSmallDetailWidget(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Icon(
                      Icons.request_quote_rounded,
                      color: cPrimary,
                      size: 19,
                    ),
                  ),
                  title: '100 M \$',
                  textDirection: TextDirection.ltr,
                )),
                Expanded(
                    child: MovieItemSmallDetailWidget(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Icon(
                      Icons.monetization_on,
                      color: cPrimary,
                      size: 19,
                    ),
                  ),
                  title: '250 M \$',
                  textDirection: TextDirection.ltr,
                )),
                Expanded(
                    child: MovieItemSmallDetailWidget(
                  icon: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset('assets/images/ic_imdb.png')),
                  title: '9.5',
                )),
                Expanded(
                    child: MovieItemSmallDetailWidget(
                  icon: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset('assets/images/ic_metacritic.png')),
                  title: '9.5',
                )),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            width: Get.width,
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: MovieItemSmallDetailWidget(
                  icon: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset('assets/images/ic_rotten.png')),
                  title: '9.5',
                )),
                Spacer(
                  flex: 3,
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
          //! Buttons Section
          ButtonSectionMovieDetailWidget(),
          SizedBox(
            height: 10,
          ),
          Obx(() => GestureDetector(
                onTap: () => controller.isTextExpandedMovieDetail(
                    !controller.isTextExpandedMovieDetail.value),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: cPrimaryDark,
                  ),
                  child: Column(
                    children: [
                      MyText(
                        text: strLorem,
                        color: cW,
                        maxLines:
                            controller.isTextExpandedMovieDetail.value ? 50 : 2,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      Icon(
                        controller.isTextExpandedMovieDetail.value
                            ? Icons.expand_less_outlined
                            : Icons.expand_more_rounded,
                        color: cW,
                      )
                    ],
                  ),
                ),
              )),

          //! TrailerSection
          Container(
            width: Get.width,
            color: cPrimaryDark,
            padding: EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.theaters_rounded,
                      color: cW,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MyText(
                      text: 'تریلر',
                      size: 15,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.trailerController.value.isPlaying) {
                      controller.trailerController.pause();
                      controller.isPlayingTrailer(false);
                    } else {
                      controller.trailerController.play();
                      controller.isPlayingTrailer(true);
                    }
                  },
                  child: SizedBox(
                    height: 200,
                    width: Get.width,
                    child: Stack(
                      children: [
                        SizedBox(
                            height: 200,
                            width: Get.width,
                            child: VideoPlayer(controller.trailerController)),
                        Obx(() => controller.isPlayingTrailer.value
                            ? SizedBox()
                            : Container(
                                height: 200,
                                width: Get.width,
                                color: cB.withOpacity(.6),
                                child: Center(
                                  child: controller.isLoadingTrailer.value
                                      ? MyCircularProgress(color: cY)
                                      : Icon(
                                          Icons.play_circle_fill_rounded,
                                          color: cW.withOpacity(.7),
                                          size: 70,
                                        ),
                                ),
                              ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          //! ActorsSection
          Container(
            width: Get.width,
            color: cPrimaryDark,
            padding: EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.supervised_user_circle_rounded,
                      color: cW,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MyText(
                      text: 'بازیگران و سایر عوامل',
                      size: 15,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width,
                  height: 130,
                  child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        physics: BouncingScrollPhysics(),
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                          width: 80,
                          margin: EdgeInsets.symmetric(horizontal: 7),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: CircleAvatar(
                                  backgroundColor: cY,
                                  backgroundImage: AssetImage(
                                      'assets/images/bg_forrest.jpg'),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              MyText(
                                text: 'jason statham Test name',
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                size: 12,
                              )
                            ],
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          //! SuggestSection
          Container(
            width: Get.width,
            color: cPrimaryDark,
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Column(
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.movie_filter_rounded,
                      color: cW,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MyText(
                      text: 'پیشنهاد ها',
                      size: 15,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width,
                  height: 210,
                  child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        physics: BouncingScrollPhysics(),
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => MovieItemWidget(
                          title: 'Monarch',
                          hasSubtitle: true,
                          hasDubbed: true,
                          imdbRate: '5',
                          isSerial: true,
                          year: '2020',
                        ),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonSectionMovieDetailWidget extends StatelessWidget {
  const ButtonSectionMovieDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: Get.width,
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          SizedBox(
            width: 15,
          ),
          Expanded(
              child: MyTextButton(
                  borderRadius: 5,
                  padding: EdgeInsets.zero,
                  fgColor: cY,
                  onTap: () {},
                  bgColor: cBgBtnMovieDetail,
                  boxShadow: BoxShadow(
                      blurRadius: 30,
                      color: cB.withOpacity(.5),
                      offset: Offset(5, 10)),
                  size: Size.fromHeight(60),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Icon(
                            Icons.share_rounded,
                            size: 25,
                          ),
                        ),
                      ),
                      MyText(text: 'اشتراک گذاری', size: 11),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ))),
          SizedBox(
            width: 5,
          ),
          Expanded(
              child: MyTextButton(
                  borderRadius: 5,
                  padding: EdgeInsets.zero,
                  fgColor: cY,
                  onTap: () {},
                  bgColor: cBgBtnMovieDetail,
                  boxShadow: BoxShadow(
                      blurRadius: 30,
                      color: cB.withOpacity(.5),
                      offset: Offset(5, 10)),
                  size: Size.fromHeight(60),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Icon(
                            Icons.bookmark,
                            size: 25,
                          ),
                        ),
                      ),
                      MyText(
                        text: 'علاقه مندی',
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ))),
          SizedBox(
            width: 5,
          ),
          Expanded(
              child: MyTextButton(
                  borderRadius: 5,
                  padding: EdgeInsets.zero,
                  fgColor: cY,
                  onTap: () {},
                  bgColor: cBgBtnMovieDetail,
                  boxShadow: BoxShadow(
                      blurRadius: 30,
                      color: cB.withOpacity(.5),
                      offset: Offset(5, 10)),
                  size: Size.fromHeight(60),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Icon(
                            Icons.download_rounded,
                            size: 25,
                          ),
                        ),
                      ),
                      MyText(text: 'دانلود'),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ))),
          SizedBox(
            width: 5,
          ),
          Expanded(
              child: MyTextButton(
                  borderRadius: 5,
                  padding: EdgeInsets.zero,
                  fgColor: cY,
                  onTap: () {},
                  bgColor: cBgBtnMovieDetail,
                  boxShadow: BoxShadow(
                      blurRadius: 30,
                      color: cB.withOpacity(.5),
                      offset: Offset(5, 10)),
                  size: Size.fromHeight(60),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Icon(
                            Icons.play_arrow_rounded,
                            size: 25,
                          ),
                        ),
                      ),
                      MyText(text: 'پخش'),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ))),
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}

class MovieItemSmallDetailWidget extends StatelessWidget {
  const MovieItemSmallDetailWidget(
      {this.icon,
      this.textDirection = TextDirection.rtl,
      this.title,
      super.key});
  final Widget? icon;
  final String? title;
  final TextDirection? textDirection;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      margin: EdgeInsets.symmetric(horizontal: 2),
      padding: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
          color: cDrawerGrey, borderRadius: BorderRadius.circular(5)),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          icon ?? SizedBox(),
          Expanded(
            child: MyText(
              padding: EdgeInsets.only(top: 4),
              textAlign: TextAlign.center,
              textDirection: textDirection,
              text: '$title',
              color: cPrimary,
              size: 12,
            ),
          ),
        ],
      ),
    );
  }
}
