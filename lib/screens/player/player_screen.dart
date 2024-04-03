import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/detail_controller.dart';
import 'package:bamabin/controller/player_controller.dart';
import 'package:bamabin/screens/dialogs/player_dialogs/player_season_dialog.dart';
import 'package:bamabin/screens/dialogs/player_dialogs/player_subtitle_dialog.dart';
import 'package:bamabin/widgets/MyCircularProgress.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
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
      controller.init();

    }
  }

  String convertSecondsToHMS(int seconds) {
    int hours = seconds ~/ 3600;
    int remainingSeconds = seconds % 3600;
    int minutes = remainingSeconds ~/ 60;
    int finalSeconds = remainingSeconds % 60;

    String formattedTime = '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${finalSeconds.toString().padLeft(2, '0')}';

    return formattedTime;
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    controller.video_controller.dispose();
    controller.current_progress(0);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.black,
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
              onTap: () {
                print("Tapppp");
                if (controller.hide_bars.isTrue)
                  controller.hide_bars(false);
                else
                  controller.hide_bars(true);
              },
              onHorizontalDragUpdate: (details) {},
              onVerticalDragUpdate: (details) {
                if(controller.is_lock.isFalse){
                  if ((Get.width / 2) <= (details.globalPosition.dx)) {
                    double delta = details.primaryDelta ?? 0;
                    double sensitivity = 1;
                    double newVolume =
                        controller.volume.value - (delta * sensitivity);
                    if (newVolume < 00) {
                      newVolume = 0;
                    } else if (newVolume > 100) {
                      newVolume = 100;
                    }
                    controller.volume(newVolume.toInt());

                  } else {

                    double delta = details.primaryDelta ?? 0;
                    double sensitivity = 0.01;
                    double newBrightness =
                        controller.brightness.value - (delta * sensitivity);
                    if (newBrightness < 0.0) {
                      newBrightness = 0.0;
                    } else if (newBrightness > 1.0) {
                      newBrightness = 1.0;
                    }

                    controller.brightness(newBrightness);
                  }
                }
              },
              onVerticalDragEnd: (details) {
                controller.show_volume(false);
                controller.show_brightness(false);
              },

              child: Obx(
                    () {
                  print("State updated");
                  print(
                      "Playing status is:${controller.current_buffer_progress.value.toDouble()}");
                  return Stack(
                    children: [
                      Obx(() => Container(
                        width: Get.width,
                        height: Get.height,
                        child: controller.isInit.value
                            ? AspectRatio(
                          aspectRatio: controller
                              .video_controller.value.aspectRatio,
                          child:
                          VlcPlayer(
                            controller: controller.video_controller,
                            aspectRatio: 1 / 1,
                            placeholder: Center(child: CircularProgressIndicator(color: Colors.blue,)),
                          ),
                        )
                            : Container(
                          child: Center(
                            child: (controller.is_error.isTrue)
                                ? Text(
                              "خطایی در بارگزاری ویدئو رخ داده است",
                              style: TextStyle(color: cR),
                            )
                                : Container(),
                          ),
                        ),
                      )),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        alignment: Alignment.centerRight,
                        child: Obx(
                              () => (controller.show_volume.isTrue) ? RotatedBox(
                            quarterTurns: -1,
                            child: SizedBox(
                              height: 20,
                              width: Get.width / 4,
                              child: Slider(
                                min: 0,
                                max: 100,
                                allowedInteraction: SliderInteraction.tapOnly,
                                activeColor: cAccent,
                                value: controller.volume.value.toDouble(),
                                onChanged: (value) {},
                              ),),
                          ) : Container(),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        alignment: Alignment.centerLeft,
                        child: Obx(
                              () => (controller.show_brightness.isTrue) ? RotatedBox(
                            quarterTurns: -1,
                            child: SizedBox(
                              height: 20,
                              width: Get.width / 4,
                              child: Slider(
                                min: 0.0,
                                max: 1.0,
                                allowedInteraction: SliderInteraction.tapOnly,
                                activeColor: cAccent,
                                value: controller.brightness.value,
                                onChanged: (value) {},
                              ),),
                          ) : Container(),
                        ),
                      ),

                      Obx(() {
                        if(controller.is_lock.isTrue){
                          return GestureDetector(
                            onTap: (){
                              controller.lockUnlock();
                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.only(bottom: 15),
                              alignment: Alignment.bottomLeft,
                              child: Icon(Icons.lock_open,color: Colors.white,),
                            ),
                          );
                        }

                        return Container(
                        child: AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: controller.hide_bars.isFalse ? 1 : 0,
                            child: controller.hide_bars.isTrue
                                ? SizedBox()
                                : Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
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
                                        text:
                                        "${detailController.selectedFilm.value.name} ${controller.selectedDlBoxItem.value.quality}",
                                        fontWeight: FontWeight.w500,
                                        size: 15,
                                      ),
                                      Spacer(),
                                      //! Serial List
                                      (detailController.selectedFilm.value
                                          .type ==
                                          "series")
                                          ? IconButton(
                                          onPressed: () {
                                            controller.video_controller
                                                .pause();
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
                                          ))
                                          : Container(),
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
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            MyText(
                                              text:
                                              '${convertSecondsToHMS(controller.video_controller.value.position.inSeconds)}',
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
                                                  inactiveColor: Colors
                                                      .white
                                                      .withOpacity(0.2),
                                                  max: controller
                                                      .max_progress
                                                      .toDouble(),
                                                  value: controller
                                                      .current_progress
                                                      .toDouble(),
                                                  secondaryActiveColor:
                                                  Colors.blueAccent,
                                                  secondaryTrackValue:
                                                  controller
                                                      .current_buffer_progress
                                                      .value
                                                      .toDouble(),
                                                  onChanged: (value) {
                                                    controller
                                                        .current_progress(
                                                        value.toInt());
                                                    controller
                                                        .video_controller
                                                        .seekTo(Duration(
                                                        seconds: value
                                                            .toInt()));
                                                  },
                                                ),
                                              ),
                                            ),
                                            MyText(
                                              text:
                                              '${convertSecondsToHMS(controller.video_controller.value.duration.inSeconds)}',
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
                                                        controller
                                                            .fullScreen();
                                                      },
                                                      icon: Icon(
                                                        Icons.fullscreen,
                                                        color: Colors.white,
                                                        size: 25,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {
                                                        controller.lockUnlock();
                                                      },
                                                      icon: Icon(
                                                        Icons.lock,
                                                        color: Colors.white,
                                                        size: 25,
                                                      )),



                                                  Visibility(
                                                    visible: controller
                                                        .is_dubbed.isFalse,
                                                    child: IconButton(
                                                        onPressed: () {

                                                          controller
                                                              .video_controller
                                                              .pause();
                                                          showDialog(
                                                            context:
                                                            context,
                                                            builder:
                                                                (context) =>
                                                                PlayerSubtitleDialog(),
                                                          );
                                                        },
                                                        icon: Icon(
                                                          Icons.tune,
                                                          color:
                                                          Colors.white,
                                                          size: 25,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize:
                                              MainAxisSize.min,
                                              textDirection:
                                              TextDirection.ltr,
                                              children: [
                                                Visibility(
                                                  visible: controller
                                                      .selectedDlBoxItem
                                                      .value
                                                      .type ==
                                                      "series",
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .skip_previous_rounded,
                                                        color: Colors.white,
                                                        size: 40,
                                                      ),
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      controller.seekRelative(Duration(seconds: -10));
                                                    },
                                                    icon: Icon(
                                                        Icons
                                                            .replay_10_rounded,
                                                        color: Colors.white,
                                                        size: 30)),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                (controller.playing_status
                                                    .isTrue)
                                                    ? IconButton(
                                                    onPressed: () {
                                                      controller
                                                          .playPauseClicked();
                                                    },
                                                    icon: Icon(
                                                        Icons
                                                            .pause_rounded,
                                                        color: Colors
                                                            .white,
                                                        size: 60))
                                                    : IconButton(
                                                    onPressed: () {
                                                      controller
                                                          .playPauseClicked();
                                                    },
                                                    icon: Icon(
                                                        Icons
                                                            .play_arrow_rounded,
                                                        color: Colors
                                                            .white,
                                                        size: 60)),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                IconButton(onPressed: (){
                                                  controller.seekRelative(Duration(seconds: 10));

                                                }, icon: Icon(
                                                    Icons
                                                        .forward_10_rounded,
                                                    color: Colors.white,
                                                    size: 30)),
                                                Visibility(
                                                  visible: controller
                                                      .selectedDlBoxItem
                                                      .value
                                                      .type ==
                                                      "series",
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                      Icon(
                                                          Icons
                                                              .skip_next_rounded,
                                                          color:
                                                          Colors.white,
                                                          size: 40),
                                                    ],
                                                  ),
                                                ),
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
                                                    onPressed: () {
                                                      controller.getAudioTracks();
                                                    },
                                                    icon: Icon(
                                                      Icons.mic,
                                                      color: Colors.white,
                                                      size: 30,
                                                    ),
                                                  ),
                                                  Visibility(
                                                      visible: controller
                                                          .is_dubbed
                                                          .isFalse,
                                                      child: IconButton(
                                                        onPressed: () {
                                                          controller.getSubtitleTracks();

                                                          // if (controller
                                                          //     .show_caption
                                                          //     .isTrue)
                                                          //   controller
                                                          //       .show_caption(
                                                          //       false);
                                                          // else
                                                          //   controller
                                                          //       .show_caption(
                                                          //       true);
                                                        },
                                                        icon: Icon(
                                                          (controller
                                                              .show_caption
                                                              .isTrue)
                                                              ? Icons
                                                              .closed_caption
                                                              : Icons
                                                              .closed_caption_off,
                                                          color:
                                                          Colors.white,
                                                          size: 30,
                                                        ),
                                                      )),
                                                  IconButton(
                                                    onPressed: () {
                                                      // controller
                                                      //     .showQualityBox();
                                                    },
                                                    icon: SizedBox(
                                                      width: 30,
                                                      height: 30,
                                                      child: Stack(
                                                        clipBehavior:
                                                        Clip.none,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .display_settings_rounded,
                                                            color: Colors
                                                                .white,
                                                            size: 30,
                                                          ),
                                                          Positioned(
                                                              top: -10,
                                                              left: -5,
                                                              child:
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                    2),
                                                                decoration: BoxDecoration(
                                                                    color:
                                                                    cR,
                                                                    borderRadius:
                                                                    BorderRadius.circular(3)),
                                                                child:
                                                                MyText(
                                                                  text:
                                                                  '${controller.selectedDlBoxItem.value.qualityCode}',
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
                          ),);
                      },)

                    ],
                  );
                },
              )),
        )
    );
  }
}
