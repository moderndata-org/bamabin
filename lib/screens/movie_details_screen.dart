import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/constant/strings.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/screens/dialogs/download_movie_dialog.dart';
import 'package:bamabin/screens/dialogs/download_serial_dialog.dart';
import 'package:bamabin/widgets/MyCircularProgress.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:bamabin/widgets/back_button_custom.dart';
import 'package:bamabin/widgets/collections_section.dart';
import 'package:bamabin/widgets/comments_section.dart';
import 'package:bamabin/widgets/movie_item_widget.dart';
import 'package:bamabin/widgets/scores_section.dart';
import 'package:bamabin/widgets/user_list_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

late double padding = 10;

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
      ..initialize().then((value) {
        controller.isLoadingTrailer(false);
        controller.trailerController.addListener(() {
          controller.trailerPosition(
              controller.trailerController.value.position.inSeconds.toDouble());
          if (controller.trailerController.value.position ==
              controller.trailerController.value.duration) {
            controller.isPlayingTrailer(false);
            controller.trailerController.seekTo(Duration.zero);
          }
        });
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
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Obx(() => controller.showGoToTop.value
            ? FloatingActionButton(
                mini: true,
                backgroundColor: cY,
                foregroundColor: cB,
                splashColor: cB.withOpacity(.7),
                child: Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: cB,
                ),
                onPressed: () {
                  controller.movieDetailScrollController.animateTo(0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
              )
            : SizedBox()),
        backgroundColor: cPrimary,
        body: ListView(
          controller: controller.movieDetailScrollController,
          padding: EdgeInsets.only(bottom: 20),
          children: [
            Container(
              width: Get.width,
              height: 260,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  //! Background Cover
                  Container(
                    height: 220,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/bg_crausel.jpg'))),
                  ),
                  //! Gradient
                  Positioned(
                      bottom: 40,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          gradient: fadeGradient(),
                        ),
                      )),
                  //! Geners
                  Positioned(
                      right: 140,
                      bottom: 60,
                      left: 0,
                      child: Container(
                        width: Get.width,
                        height: 25,
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: padding),
                            physics: BouncingScrollPhysics(),
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Container(
                                decoration: BoxDecoration(
                                    color: cbgGenerMovieDetail.withOpacity(.6),
                                    border: Border.all(
                                      color: cW.withOpacity(.2),
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                                margin: EdgeInsets.symmetric(horizontal: 1),
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 4, bottom: 4),
                                child: MyText(
                                  text: 'علمی تخیلی',
                                  size: 11,
                                )),
                          ),
                        ),
                      )),
                  //! Poster
                  Positioned(
                      right: padding,
                      bottom: 10,
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
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
                  //! LikeDislikeBox
                  Positioned(
                      left: padding,
                      bottom: 0,
                      child: Row(
                        textDirection: TextDirection.ltr,
                        children: [
                          //! dislike
                          GestureDetector(
                            onTap: () =>
                                controller.movieLikeStatus(LikeStatus.dislike),
                            child: Obx(() => AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                      color: controller.movieLikeStatus.value ==
                                              LikeStatus.dislike
                                          ? cDisklike
                                          : cDisklike.withOpacity(.5),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                      )),
                                  height: 30,
                                  width: 80,
                                  child: Row(
                                    textDirection: TextDirection.rtl,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.thumb_down_alt_rounded,
                                        color: cW,
                                        size: 16,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      MyText(
                                        text: 'نپسندیدم',
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                          //! like
                          GestureDetector(
                            onTap: () =>
                                controller.movieLikeStatus(LikeStatus.like),
                            child: Obx(() => AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                      color: controller.movieLikeStatus.value ==
                                              LikeStatus.like
                                          ? cLike
                                          : cLike.withOpacity(.5),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      )),
                                  height: 30,
                                  width: 80,
                                  child: Row(
                                    textDirection: TextDirection.rtl,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.thumb_up_alt_rounded,
                                        color: cW,
                                        size: 16,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      MyText(
                                        text: 'پسندیدم',
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      )),
                  //! Back Btn
                  Positioned(
                      top: 10,
                      left: 10,
                      child: BackButtonCustom(
                        hasPaddin: false,
                        bgColor: cPrimary,
                      )),

                  //! Report Problem Button
                  Positioned(
                      top: 10,
                      right: 20,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          decoration: BoxDecoration(
                              boxShadow: [bsTextLowOpacity],
                              border: Border.all(color: cW, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Icon(
                                Icons.report_problem_rounded,
                                size: 13,
                                color: cW,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              MyText(
                                text: 'گزارش مشکل',
                                size: 11,
                              )
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(
                  width: padding,
                ),
                Expanded(
                    child: MyText(
                  padding: EdgeInsets.only(top: 5),
                  text: 'The Thing Called Love',
                  textAlign: TextAlign.right,
                  size: 15,
                  fontWeight: FontWeight.bold,
                  textDirection: TextDirection.ltr,
                  textOverflow: TextOverflow.ellipsis,
                )),
                SizedBox(
                  width: 160,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            text: '0%',
                            size: 9,
                          ),
                          MyText(
                            text: '100%',
                            size: 9,
                          ),
                        ],
                      ),
                      Row(
                        textDirection: TextDirection.ltr,
                        children: [
                          Container(
                            height: 8,
                            width: 160,
                            decoration: BoxDecoration(
                                color: cSecondaryLight,
                                borderRadius: BorderRadius.circular(50)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: padding,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(
                  width: padding,
                ),
                Expanded(
                    child: MyText(
                  text: 'چیزی به اسم عشق',
                  textAlign: TextAlign.right,
                  size: 15,
                  fontWeight: FontWeight.w500,
                  textDirection: TextDirection.rtl,
                  textOverflow: TextOverflow.ellipsis,
                )),
                MyTextButton(
                    borderRadius: 5,
                    size: Size(160, 30),
                    onTap: () {
                      controller.movieDetailScrollController.animateTo(
                          controller.movieDetailScrollController.position
                                  .maxScrollExtent +
                              300,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.bounceOut);
                    },
                    bgColor: cPrimary,
                    fgColor: cY,
                    strokeColor: cY,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.rtl,
                      children: [
                        Icon(
                          Icons.message_rounded,
                          color: cY,
                          size: 16,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        MyText(
                          text: 'نظر دهید',
                          color: cY,
                          size: 11,
                        ),
                      ],
                    )),
                SizedBox(
                  width: padding,
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
                    width: padding,
                  ),
                  Expanded(
                      child: MovieItemSmallDetailWidget(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Icon(
                        Icons.today_rounded,
                        color: cW,
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
                        color: cW,
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
                        color: cW,
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
                        color: cW,
                        size: 19,
                      ),
                    ),
                    title: '1993',
                  )),
                  SizedBox(
                    width: padding,
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
                    width: padding,
                  ),
                  Expanded(
                      child: MovieItemSmallDetailWidget(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Icon(
                        Icons.request_quote_rounded,
                        color: cW,
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
                        color: cW,
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
                    width: padding,
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
                    width: padding,
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
                    width: padding,
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
                    margin:
                        EdgeInsets.symmetric(horizontal: padding, vertical: 10),
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: cPrimaryDark,
                    ),
                    child: Column(
                      children: [
                        MyText(
                          text: strLorem,
                          color: cW,
                          maxLines: controller.isTextExpandedMovieDetail.value
                              ? 50
                              : 2,
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
                      if (controller.isLoadingTrailer.isFalse) {
                        if (controller.trailerController.value.isPlaying) {
                          controller.trailerController.pause();
                          controller.isPlayingTrailer(false);
                        } else {
                          controller.trailerController.play();

                          controller.isPlayingTrailer(true);
                        }
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
                              ? Positioned(
                                  bottom: 10,
                                  right: 10,
                                  left: 10,
                                  child: Container(
                                    child: Obx(() => Slider(
                                          inactiveColor: cW.withOpacity(.7),
                                          activeColor: cW,
                                          value:
                                              controller.trailerPosition.value,
                                          min: 0,
                                          max: controller.trailerController
                                              .value.duration.inSeconds
                                              .toDouble(),
                                          onChanged: (value) {
                                            controller.trailerPosition(value);
                                            controller.trailerController.seekTo(
                                                Duration(
                                                    seconds: value.toInt()));
                                          },
                                        )),
                                  ))
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
                            year: '2020',
                          ),
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ScoreSection(),
            SizedBox(
              height: 15,
            ),
            CollectionsSection(),
            SizedBox(
              height: 15,
            ),
            UserListSection(),
            SizedBox(
              height: 15,
            ),
            CommentsSection(),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonSectionMovieDetailWidget extends GetView<PublicController> {
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
            width: padding,
          ),
          Expanded(
              child: MyTextButton(
                  borderRadius: 5,
                  padding: EdgeInsets.zero,
                  fgColor: cW,
                  onTap: () {},
                  bgColor: cGrey,
                  boxShadow: bsBtnMovieDetail,
                  size: Size.fromHeight(60),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Icon(
                            Icons.share_rounded,
                            size: 25,
                            color: cW,
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
                  fgColor: cW,
                  onTap: () {},
                  bgColor: cGrey,
                  boxShadow: bsBtnMovieDetail,
                  size: Size.fromHeight(60),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Icon(
                            Icons.bookmark,
                            size: 25,
                            color: cW,
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
                  fgColor: cB,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => controller
                              .isSerialOpenedDetail.value
                          ? DownloadSerialDialog(
                              actionMethod: ActionMethod.Download,
                              title: 'Monarch',
                            )
                          : DownloadMovieDialog(
                              actionMethod: ActionMethod.Download,
                              isSerial: controller.isSerialOpenedDetail.value,
                              title: 'Forrest',
                            ),
                    );
                  },
                  bgColor: cG,
                  boxShadow: bsBtnMovieDetail,
                  size: Size.fromHeight(60),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Icon(
                            Icons.download_rounded,
                            size: 25,
                            color: cW,
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
          //! Play Button
          Expanded(
              child: MyTextButton(
                  borderRadius: 5,
                  padding: EdgeInsets.zero,
                  fgColor: cB,
                  onTap: () {
                    Get.toNamed('/player');
                    // showDialog(
                    //   context: context,
                    //   builder: (context) =>
                    //       controller.isSerialOpenedDetail.value
                    //           ? DownloadSerialDialog(
                    //               actionMethod: ActionMethod.Play,
                    //               title: 'Monarch',
                    //             )
                    //           : DownloadMovieDialog(
                    //               actionMethod: ActionMethod.Play,
                    //               title: 'Forrest',
                    //             ),
                    // );
                  },
                  bgColor: cY,
                  boxShadow: bsBtnMovieDetail,
                  size: Size.fromHeight(60),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Icon(
                            Icons.play_arrow_rounded,
                            size: 30,
                            color: cBgBtnMovieDetail,
                          ),
                        ),
                      ),
                      MyText(
                        text: 'پخش',
                        color: cBgBtnMovieDetail,
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ))),
          SizedBox(
            width: padding,
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
          boxShadow: [bsTextLowOpacity],
          color: cSecondary,
          borderRadius: BorderRadius.circular(5)),
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
              color: cW,
              size: 12,
            ),
          ),
        ],
      ),
    );
  }
}
