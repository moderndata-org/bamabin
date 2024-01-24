import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/player_controller.dart';
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: (controller.hide_bars.isFalse)
                            ? [
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
                                      Text(
                                        "Monarch",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Spacer(),
                                      IconButton(
                                          onPressed: () {},
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
                                        bottom: 0,
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
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(
                                                    Icons.lock,
                                                    color: Colors.white,
                                                    size: 25,
                                                  ),
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
                                                  width: 15,
                                                ),
                                                Icon(Icons.replay_10_rounded,
                                                    color: Colors.white,
                                                    size: 35),
                                                SizedBox(
                                                  width: 15,
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
                                                            size: 50))
                                                    : IconButton(
                                                        onPressed: () {
                                                          controller
                                                              .playPauseClicked();
                                                        },
                                                        icon: Icon(
                                                            Icons
                                                                .play_arrow_rounded,
                                                            color: Colors.white,
                                                            size: 50)),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Icon(Icons.forward_10_rounded,
                                                    color: Colors.white,
                                                    size: 35),
                                                SizedBox(
                                                  width: 15,
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
                                                  Icon(
                                                    Icons.mic,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(
                                                    Icons.closed_caption,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .display_settings_rounded,
                                                    color: Colors.white,
                                                    size: 30,
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
                              ]
                            : [],
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
