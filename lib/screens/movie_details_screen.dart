import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/controller/detail_controller.dart';
import 'package:bamabin/controller/favorite_controller.dart';
import 'package:bamabin/models/comment_model.dart';
import 'package:bamabin/screens/dialogs/download_movie_dialog.dart';
import 'package:bamabin/screens/dialogs/download_serial_dialog.dart';
import 'package:bamabin/screens/dialogs/report_bug_dialog.dart';
import 'package:bamabin/widgets/MyCircularProgress.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:bamabin/widgets/back_button_custom.dart';
import 'package:bamabin/widgets/collections_section.dart';
import 'package:bamabin/widgets/comments_section.dart';
import 'package:bamabin/widgets/movie_item_widget.dart';
import 'package:bamabin/widgets/scores_section.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../constant/utils.dart';
import '../controller/recent_controller.dart';
import '../models/recent_model.dart';
import '../widgets/custom_shimmer.dart';
import '../widgets/movie_detail/actors_widget.dart';
import 'package:chewie/chewie.dart';

late double padding = 10;

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final controller = Get.find<DetailController>();

  @override
  void initState() {
    controller.txtComment!.clear();
    controller.authController = Get.find<AuthController>();
    controller.isSerial(controller.selectedFilm.value.type == 'series');
    controller.getNewData();
    controller.getDepartments();
    controller.showGoToTop(false);
    controller.selectedCommentForReply(CommentModel());
    super.initState();
  }

  @override
  void dispose() {
    controller.trailerControllerChieview?.dispose();
    controller.trailerControllerTest?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(controller.selectedFilm.value.releaseYear);
    // print(controller.selectedFilm.value.releaseMovie);
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
                      duration: Duration(seconds: 1), curve: Curves.easeIn);
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
                  Obx(() => SizedBox(
                        height: 220,
                        width: Get.width,
                        child: CachedNetworkImage(
                          imageUrl:
                              '${controller.selectedFilm.value.bgThumbnail}',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                              child: CustomShimmerWidget(
                            width: Get.width,
                            height: 220 - 20,
                          )),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      )),
                  //! TopGradient
                  Positioned(
                      top: 0,
                      child: Container(
                        height: 45,
                        width: Get.width,
                        decoration: BoxDecoration(
                            gradient: fadeGradient(
                                toColor: cPrimary,
                                fromColor: Colors.transparent)),
                      )),
                  //! BottomGradient
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
                  Obx(
                    () => controller.selectedFilm.value.genresListForDetail ==
                            null
                        ? SizedBox()
                        : Positioned(
                            right: 140,
                            bottom: 60,
                            left: 0,
                            child: Container(
                              width: Get.width,
                              height: 25,
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: ListView.builder(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: padding),
                                  physics: BouncingScrollPhysics(),
                                  itemCount: controller.selectedFilm.value
                                      .genresListForDetail?.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    String genre = controller.selectedFilm.value
                                        .genresListForDetail![index];
                                    return Container(
                                        decoration: BoxDecoration(
                                            color: cbgGenerMovieDetail
                                                .withOpacity(.6),
                                            border: Border.all(
                                              color: cW.withOpacity(.2),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 1),
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 4,
                                            bottom: 4),
                                        child: MyText(
                                          text: '$genre',
                                          size: 11,
                                        ));
                                  },
                                ),
                              ),
                            )),
                  ),

                  //! Poster
                  Positioned(
                      right: padding,
                      bottom: 10,
                      child: Obx(() => Container(
                            width: 130,
                            height: 190,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: CachedNetworkImage(
                                imageUrl:
                                    '${controller.selectedFilm.value.thumbnail}',
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Center(
                                    child: CustomShimmerWidget(
                                  width: 130,
                                  height: 190,
                                )),
                                errorWidget: (context, url, error) =>
                                    CustomShimmerWidget(
                                  width: 130,
                                  height: 190,
                                ),
                              ),
                            ),
                          ))),
                  //! LikeDislikeBox
                  Positioned(
                      left: padding,
                      bottom: 0,
                      child: Obx(() => controller.isLoadingLikeStatus.isTrue
                          ? CustomShimmerWidget(width: 160, height: 30)
                          : Row(
                              textDirection: TextDirection.ltr,
                              children: [
                                //! dislike
                                GestureDetector(
                                  onTap: () => controller.setLikeAction(
                                      action: LikeAction.dislike,
                                      id: '${controller.selectedFilm.value.id}'),
                                  child: Obx(() => AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        decoration: BoxDecoration(
                                            color: controller.movieLikeStatus
                                                        .value ==
                                                    LikeAction.dislike
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                  onTap: () => controller.setLikeAction(
                                      action: LikeAction.like,
                                      id: '${controller.selectedFilm.value.id}'),
                                  child: Obx(() => AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        decoration: BoxDecoration(
                                            color: controller.movieLikeStatus
                                                        .value ==
                                                    LikeAction.like
                                                ? cSecondaryLight
                                                : cSecondaryLight
                                                    .withOpacity(.5),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            )),
                                        height: 30,
                                        width: 80,
                                        child: Row(
                                          textDirection: TextDirection.rtl,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                            ))),
                  //! Back Btn
                  Positioned(
                      left: 0,
                      child: BackButtonCustom(
                        hasPaddin: false,
                        bgColor: Colors.transparent,
                      )),

                  //! Report Problem Button
                  Positioned(
                      top: 10,
                      right: 20,
                      child: GestureDetector(
                        onTap: () => Get.find<AuthController>().isLogin.isFalse
                            ? showMessage(
                                text: 'ابتدا وارد شوید', isSucces: false)
                            : showDialog(
                                barrierColor: cBgDialogColor,
                                context: context,
                                builder: (context) {
                                  return BugReportDialog();
                                },
                              ),
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
                    child: Obx(() => Tooltip(
                          preferBelow: false,
                          showDuration: Duration(seconds: 3),
                          message: '${controller.selectedFilm.value.enTitle}',
                          child: MyText(
                            padding: EdgeInsets.only(top: 5),
                            text: '${controller.selectedFilm.value.enTitle}',
                            textAlign: TextAlign.right,
                            size: 15,
                            fontWeight: FontWeight.bold,
                            textDirection: TextDirection.ltr,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ))),
                SizedBox(
                  width: 5,
                ),
                //! like/dislike precents
                Obx(() => controller.selectedFilm.value.likeInfo == null
                    ? SizedBox()
                    : SizedBox(
                        width: 160,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //! dislike
                                MyText(
                                  text:
                                      '${controller.selectedFilm.value.likeInfo?.dislikePercent}%',
                                  size: 9,
                                ),
                                //! like
                                MyText(
                                  text:
                                      '${controller.selectedFilm.value.likeInfo?.likePercent}%',
                                  size: 9,
                                ),
                              ],
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Obx(() =>
                                  controller.selectedFilm.value.likeInfo == null
                                      ? SizedBox()
                                      : SizedBox(
                                          width: 160,
                                          child: Row(
                                            textDirection: TextDirection.ltr,
                                            children: [
                                              Container(
                                                height: 8,
                                                width: (controller
                                                            .selectedFilm
                                                            .value
                                                            .likeInfo
                                                            ?.dislikePercent ??
                                                        0) *
                                                    160 /
                                                    100,
                                                color: cR,
                                              ),
                                              Container(
                                                height: 8,
                                                width: (controller
                                                            .selectedFilm
                                                            .value
                                                            .likeInfo
                                                            ?.likePercent ??
                                                        0) *
                                                    160 /
                                                    100,
                                                color: cSecondaryLight,
                                              ),
                                            ],
                                          ),
                                        )),
                            )
                          ],
                        ),
                      )),
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
                    child: Obx(() => Tooltip(
                          preferBelow: true,
                          showDuration: Duration(seconds: 3),
                          message: '${controller.selectedFilm.value.faTitle}',
                          child: MyText(
                            text: '${controller.selectedFilm.value.faTitle}',
                            textAlign: TextAlign.right,
                            size: 15,
                            fontWeight: FontWeight.w500,
                            textDirection: TextDirection.rtl,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ))),
                MyTextButton(
                    borderRadius: 5,
                    size: Size(160, 30),
                    onTap: () {
                      controller.movieDetailScrollController.animateTo(
                          controller.movieDetailScrollController.position
                                  .maxScrollExtent +
                              500,
                          duration: Duration(seconds: 1),
                          curve: Curves.easeIn);
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
            SizedBox(
              height: 10,
            ),
            Obx(() => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Wrap(
                        runSpacing: 5,
                        direction: Axis.horizontal,
                        children: controller.selectedFilm.value
                            .generateSmallItemsList(fullWidth: Get.width - 20)),
                  ),
                )),
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
                          text: '${controller.selectedFilm.value.faSummary}',
                          color: cW,
                          maxLines: controller.isTextExpandedMovieDetail.value
                              ? 50
                              : 2,
                          textAlign: TextAlign.justify,
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

            //! TrailerSection New
            Obx(() => controller.isLoadingNewData.isTrue
                ? CustomShimmerWidget(
                    height: 200,
                    width: Get.width,
                  )
                : controller.selectedFilm.value.trailer_url == '' ||
                        controller.selectedFilm.value.trailer_url == null
                    ? SizedBox()
                    : controller.isLoadingTrailer.isTrue
                        ? CustomShimmerWidget(
                            height: 200,
                            width: Get.width,
                          )
                        : Container(
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
                                SizedBox(
                                  width: Get.width,
                                  height: 200,
                                  child: Chewie(
                                    controller:
                                        controller.trailerControllerChieview!,
                                  ),
                                )
                              ],
                            ),
                          )),
            // //! TrailerSection Bk
            // Obx(() => controller.isLoadingNewData.isTrue
            //     ? SizedBox()
            //     : controller.selectedFilm.value.trailer_url == '' ||
            //             controller.selectedFilm.value.trailer_url == null
            //         ? SizedBox()
            //         : Container(
            //             width: Get.width,
            //             color: cPrimaryDark,
            //             padding: EdgeInsets.only(top: 15),
            //             child: Column(
            //               children: [
            //                 Row(
            //                   textDirection: TextDirection.rtl,
            //                   children: [
            //                     SizedBox(
            //                       width: 15,
            //                     ),
            //                     Icon(
            //                       Icons.theaters_rounded,
            //                       color: cW,
            //                     ),
            //                     SizedBox(
            //                       width: 10,
            //                     ),
            //                     MyText(
            //                       text: 'تریلر',
            //                       size: 15,
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //                 GestureDetector(
            //                   onTap: () {
            //                     if (controller.isLoadingTrailer.isFalse) {
            //                       if (controller
            //                           .trailerController!.value.isPlaying) {
            //                         controller.trailerController?.pause();
            //                         controller.isPlayingTrailer(false);
            //                       } else {
            //                         controller.trailerController?.play();

            //                         controller.isPlayingTrailer(true);
            //                       }
            //                     }
            //                   },
            //                   child: SizedBox(
            //                     height: 200,
            //                     width: Get.width,
            //                     child: Stack(
            //                       children: [
            //                         SizedBox(
            //                             height: 200,
            //                             width: Get.width,
            //                             child: VideoPlayer(
            //                                 controller.trailerController!)),
            //                         Obx(() => controller.isPlayingTrailer.value
            //                             ? Positioned(
            //                                 bottom: 10,
            //                                 right: 10,
            //                                 left: 10,
            //                                 child: Container(
            //                                   child: Obx(() => Slider(
            //                                         inactiveColor:
            //                                             cW.withOpacity(.7),
            //                                         activeColor: cW,
            //                                         value: controller
            //                                             .trailerPosition.value,
            //                                         min: 0,
            //                                         max: controller
            //                                             .trailerController!
            //                                             .value
            //                                             .duration
            //                                             .inSeconds
            //                                             .toDouble(),
            //                                         onChanged: (value) {
            //                                           controller
            //                                               .trailerPosition(
            //                                                   value);
            //                                           controller
            //                                               .trailerController!
            //                                               .seekTo(Duration(
            //                                                   seconds: value
            //                                                       .toInt()));
            //                                         },
            //                                       )),
            //                                 ))
            //                             : Container(
            //                                 height: 200,
            //                                 width: Get.width,
            //                                 color: cB.withOpacity(.6),
            //                                 child: Center(
            //                                   child: controller
            //                                           .isLoadingTrailer.value
            //                                       ? MyCircularProgress(
            //                                           color: cY)
            //                                       : Icon(
            //                                           Icons
            //                                               .play_circle_fill_rounded,
            //                                           color: cW.withOpacity(.7),
            //                                           size: 70,
            //                                         ),
            //                                 ),
            //                               ))
            //                       ],
            //                     ),
            //                   ),
            //                 )
            //               ],
            //             ),
            //           )),
            SizedBox(
              height: 15,
            ),
            //! ActorsSection
            Obx(() => controller.selectedFilm.value.actors!.length == 0 &&
                    controller.selectedFilm.value.directors!.length == 0
                ? SizedBox()
                : Container(
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
                              child: Obx(() => ListView.builder(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    physics: BouncingScrollPhysics(),
                                    itemCount:
                                        (controller.selectedFilm.value.actors! +
                                                controller.selectedFilm.value
                                                    .directors!)
                                            .length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      var actors_list = (controller
                                              .selectedFilm.value.actors! +
                                          controller
                                              .selectedFilm.value.directors!);
                                      var actor = actors_list[index];
                                      return Container(
                                        width: 80,
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 7),
                                        child: ActorsWidget(
                                            imageUrl: '${actor.avatar}',
                                            name: '${actor.name}'),
                                      );
                                    },
                                  ))),
                        )
                      ],
                    ),
                  )),
            SizedBox(
              height: controller.selectedFilm.value.related_posts == null ||
                      controller.selectedFilm.value.related_posts == []
                  ? 0
                  : 15,
            ),
            //! SuggestSection
            Obx(() => controller.selectedFilm.value.related_posts!.isEmpty
                ? SizedBox()
                : Container(
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
                              text: 'پیشنهادها',
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
                          child: Obx(() {
                            return Directionality(
                              textDirection: TextDirection.rtl,
                              child: ListView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                physics: BouncingScrollPhysics(),
                                itemCount: controller
                                    .selectedFilm.value.related_posts!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  var film = controller
                                      .selectedFilm.value.related_posts![index];
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
                                      controller.selectedFilm(film);
                                      controller.getNewData();
                                      controller.movieDetailScrollController
                                          .animateTo(0,
                                              duration: Duration(seconds: 1),
                                              curve: Easing.standard);
                                      // Get.toNamed('/movie-detail');
                                    },
                                  );
                                },
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                  )),
            SizedBox(
              height: (controller.selectedFilm.value.summaryAwards == null ||
                          controller.selectedFilm.value.summaryAwards == '') &&
                      (controller.selectedFilm.value.top250movie == null ||
                          controller.selectedFilm.value.top250movie == '')
                  ? 0
                  : 15,
            ),
            (controller.selectedFilm.value.summaryAwards == null ||
                        controller.selectedFilm.value.summaryAwards == '') &&
                    (controller.selectedFilm.value.top250movie == null ||
                        controller.selectedFilm.value.top250movie == '')
                ? SizedBox()
                : ScoreSection(
                    award_summery: controller.selectedFilm.value.summaryAwards,
                    rank: controller.selectedFilm.value.top250movie,
                  ),
            SizedBox(
              height: 15,
            ),
            Obx(
              () => controller.selectedFilm.value.collection_posts!.isEmpty
                  ? SizedBox()
                  : CollectionsSection(),
            ),
            SizedBox(
              height: 15,
            ),
            // UserListSection(),
            // SizedBox(
            //   height: 15,
            // ),
            Obx(() => CommentsSection(
                  comments: controller.selectedFilm.value.sortedComments,
                )),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonSectionMovieDetailWidget extends GetView<DetailController> {
  const ButtonSectionMovieDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final favoritecontroller = Get.find<FavoriteController>();
    final authController = Get.find<AuthController>();
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
                  onTap: () => favoritecontroller.setFavorite(
                      id: '${controller.selectedFilm.value.id}',
                      favoriteAction:
                          controller.selectedFilm.value.is_watchlist == true
                              ? FavoriteAction.Remove
                              : FavoriteAction.Add),
                  bgColor: cGrey,
                  boxShadow: bsBtnMovieDetail,
                  size: Size.fromHeight(60),
                  child: Obx(() => favoritecontroller.isSettingFavorites.isTrue
                      ? Center(
                          child: MyCircularProgress(
                            color: cW,
                            size: 25,
                          ),
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: Center(
                                child: Obx(() => Icon(
                                      controller.selectedFilm.value
                                                  .is_watchlist ==
                                              true
                                          ? Icons.bookmark
                                          : Icons.bookmark_border_rounded,
                                      size: 25,
                                      color: cW,
                                    )),
                              ),
                            ),
                            MyText(
                              text: 'علاقه‌مندی',
                            ),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        )))),
          SizedBox(
            width: 5,
          ),
          Expanded(
              child: Obx(() => MyTextButton(
                  borderRadius: 5,
                  padding: EdgeInsets.zero,
                  fgColor: cB,
                  onTap: () {
                    if (authController.paymentController.isVip.isFalse) {
                      Get.toNamed('/subscribe');
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => controller.isSerial.value
                            ? DownloadSerialDialog(
                                actionMethod: ActionMethod.Download,
                                title: 'Monarch',
                              )
                            : DownloadMovieDialog(
                                actionMethod: ActionMethod.Download,
                                isSerial: controller.isSerial.value,
                                title: 'Forrest',
                              ),
                      );
                    }
                  },
                  bgColor: cG,
                  boxShadow: bsBtnMovieDetail,
                  size: Size.fromHeight(60),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: authController.paymentController.isVip.isFalse
                              ? SvgPicture.asset('assets/svg/ic_subscribe.svg')
                              : Icon(
                                  Icons.download_rounded,
                                  size: 25,
                                  color: cW,
                                ),
                        ),
                      ),
                      MyText(
                          text: authController.paymentController.isVip.isFalse
                              ? 'خرید اشتراک'
                              : 'دانلود'),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  )))),
          SizedBox(
            width: controller.selectedFilm.value.hasPlay != 'on' &&
                    authController.paymentController.isVip.isFalse
                ? 0
                : 5,
          ),
          //! Play Button
          controller.selectedFilm.value.hasPlay != 'on' &&
                  authController.paymentController.isVip.isFalse
              ? SizedBox()
              : Expanded(
                  child: MyTextButton(
                      borderRadius: 5,
                      padding: EdgeInsets.zero,
                      fgColor: cB,
                      onTap: () {
                        RecentModel rm = RecentModel(
                            bg_cover: controller.selectedFilm.value.bgThumbnail,
                            cover: controller.selectedFilm.value.thumbnail,
                            hasDubbed: controller.selectedFilm.value.hasDubbed,
                            hasSubtitle:
                                controller.selectedFilm.value.hasSubtitle,
                            id: controller.selectedFilm.value.id,
                            imdb: controller.selectedFilm.value.imdbRate,
                            title: controller.selectedFilm.value.title,
                            year: controller.selectedFilm.value.releaseYear);
                        Get.find<RecentContoller>()
                            .addToRecent(recentModel: rm);
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
