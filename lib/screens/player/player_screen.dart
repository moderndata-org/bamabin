import 'dart:async';

import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/detail_controller.dart';
import 'package:bamabin/controller/player_controller.dart';
import 'package:bamabin/screens/dialogs/player_dialogs/player_season_dialog.dart';
import 'package:bamabin/screens/dialogs/player_dialogs/player_subtitle_dialog.dart';
import 'package:bamabin/widgets/MyCircularProgress.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  PlayerController controller = Get.find();
  DetailController detailController = Get.find<DetailController>();

  @override
  void initState() {
    super.initState();
    controller.isInit(false);
    if (mounted) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.bottom]);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      controller.StartVideo();
      controller.video_controller.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    controller.video_controller.dispose();
    detailController.selectedFilm.value
        .generateSmallItemsList(fullWidth: Get.width);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: GestureDetector(onTap: () {
          if (controller.hide_bars.isTrue)
            controller.hide_bars(false);
          else
            controller.hide_bars(true);
        }, child: Obx(
          () {
            print("State updated");
            print("Playing status is:${controller.playing_status}");
            return Stack(
              children: [
                Obx(() => Container(
                      width: Get.width,
                      height: Get.height,
                      child: controller.isInit.value
                          ? AspectRatio(
                              aspectRatio:
                                  controller.video_controller.value.aspectRatio,
                              child: VideoPlayer(controller.video_controller),
                            )
                          : Container(
                              child: Center(
                                child:
                                    MyCircularProgress(color: cSecondaryLight),
                              ),
                            ),
                    )),
                Obx(() => // Player,
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: controller.hide_bars.isFalse ? 1 : 0,
                      child: controller.hide_bars.isTrue
                          ? SizedBox()
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //! Top Bar
                                Container(
                                  decoration: BoxDecoration(
                                      gradient: fadeGradient(
                                          toColor: cB.withOpacity(.5),
                                          fromColor: Colors.transparent)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Row(
                                    textDirection: TextDirection.ltr,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(
                                            Icons.arrow_back_ios,
                                            color: Colors.white,
                                            size: 25,
                                          )),
                                      Spacer(),
                                      MyText(
                                        text: "Monarch",
                                        fontWeight: FontWeight.w500,
                                        size: 15,
                                      ),
                                      Spacer(),
                                      //! Serial List
                                      IconButton(
                                          onPressed: () {
                                            controller.video_controller.pause();
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  PlayerSeasonDialog(),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.playlist_play,
                                            color: Colors.white,
                                            size: 35,
                                          )),
                                    ],
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                  ),
                                ),
                                //! Bottom Bar
                                Container(
                                  height: 130,
                                  decoration: BoxDecoration(
                                      gradient: fadeGradient(
                                          fromColor: cB.withOpacity(.5),
                                          toColor: Colors.transparent)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 5,
                                        right: 0,
                                        left: 0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            MyText(
                                              text:
                                                  '${controller.video_controller.value.position.inMinutes}:${controller.video_controller.value.position.inSeconds}',
                                              size: 15,
                                            ),
                                            Expanded(
                                              child: SliderTheme(
                                                data: SliderThemeData(
                                                    thumbShape:
                                                        RoundSliderThumbShape(
                                                            enabledThumbRadius:
                                                                5),
                                                    trackHeight: 2),
                                                child: Slider(
                                                  activeColor: Colors.white,
                                                  inactiveColor: Colors.white
                                                      .withOpacity(0.2),
                                                  max: controller
                                                      .video_controller
                                                      .value
                                                      .duration
                                                      .inSeconds
                                                      .toDouble(),
                                                  value: controller
                                                      .video_controller
                                                      .value
                                                      .position
                                                      .inSeconds
                                                      .toDouble(),
                                                  onChanged: (value) {
                                                    controller.current_progress(
                                                        value.toInt());
                                                    controller.video_controller
                                                        .seekTo(Duration(
                                                            seconds:
                                                                value.toInt()));
                                                  },
                                                ),
                                              ),
                                            ),
                                            MyText(
                                              text:
                                                  '${controller.video_controller.value.duration.inMinutes}:${controller.video_controller.value.duration.inSeconds}',
                                              size: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -10,
                                        right: 0,
                                        left: 0,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            //! Left
                                            Positioned(
                                              left: 0,
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        controller.fullScreen();
                                                      },
                                                      icon: Icon(
                                                        Icons.fullscreen,
                                                        color: Colors.white,
                                                        size: 25,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.lock,
                                                        color: Colors.white,
                                                        size: 25,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {
                                                        controller
                                                            .video_controller
                                                            .pause();
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              PlayerSubtitleDialog(),
                                                        );
                                                      },
                                                      icon: Icon(
                                                        Icons.tune,
                                                        color: Colors.white,
                                                        size: 25,
                                                      )),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              textDirection: TextDirection.ltr,
                                              children: [
                                                Icon(
                                                  Icons.skip_previous_rounded,
                                                  color: Colors.white,
                                                  size: 40,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Icon(Icons.replay_10_rounded,
                                                    color: Colors.white,
                                                    size: 30),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                (controller
                                                        .playing_status.isTrue)
                                                    ? IconButton(
                                                        onPressed: () {
                                                          controller
                                                              .playPauseClicked();
                                                        },
                                                        icon: Icon(
                                                            Icons.pause_rounded,
                                                            color: Colors.white,
                                                            size: 60))
                                                    : IconButton(
                                                        onPressed: () {
                                                          controller
                                                              .playPauseClicked();
                                                        },
                                                        icon: Icon(
                                                            Icons
                                                                .play_arrow_rounded,
                                                            color: Colors.white,
                                                            size: 60)),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Icon(Icons.forward_10_rounded,
                                                    color: Colors.white,
                                                    size: 30),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Icon(Icons.skip_next_rounded,
                                                    color: Colors.white,
                                                    size: 40),
                                              ],
                                            ),
                                            //! Right
                                            Positioned(
                                              right: 0,
                                              child: Row(
                                                textDirection:
                                                    TextDirection.rtl,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.mic,
                                                      color: Colors.white,
                                                      size: 30,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.closed_caption,
                                                      color: Colors.white,
                                                      size: 30,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: SizedBox(
                                                      width: 30,
                                                      height: 30,
                                                      child: Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .display_settings_rounded,
                                                            color: Colors.white,
                                                            size: 30,
                                                          ),
                                                          Positioned(
                                                              top: -10,
                                                              left: -5,
                                                              child: Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            2),
                                                                decoration: BoxDecoration(
                                                                    color: cR,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            3)),
                                                                child: MyText(
                                                                  text: '1080p',
                                                                  color: cW,
                                                                  size: 7,
                                                                ),
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                    ))
              ],
            );
          },
        )),
      ),
    );
  }
}
