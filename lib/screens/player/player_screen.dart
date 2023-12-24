import 'package:bamabin/controller/player_controller.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PlayerScreen extends GetView<PlayerController> {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            if (controller.hide_bars.isTrue)
              controller.hide_bars(false);
            else
              controller.hide_bars(true);
          },
          child: Stack(
            children: [
              Container(
                width: Get.width,
                height: Get.height,
                color: Colors.grey,
              ), // Player,
              Obx(() => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: (controller.hide_bars.isFalse)
                        ? [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Text(
                                    "Monarch",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.playlist_play,
                                    color: Colors.white,
                                    size: 35,
                                  )
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                              ),
                            ),
                            Container(),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text(
                                          "01:00",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Expanded(
                                        child: SliderTheme(
                                          data:
                                              SliderTheme.of(context).copyWith(
                                            thumbShape:
                                                SliderComponentShape.noThumb,
                                          ),
                                          child: Slider(
                                            activeColor: Colors.white,
                                            inactiveColor:
                                                Colors.white.withOpacity(0.2),
                                            max: controller.max_progress.value
                                                .toDouble(),
                                            value: controller
                                                .current_progress.value
                                                .toDouble(),
                                            onChanged: (value) {
                                              controller.current_progress(
                                                  value.toInt());
                                            },
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "46:47",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Left
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.fullscreen,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.lock,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ],
                                      ),

                                      // Center
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.skip_previous,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Icon(Icons.fast_rewind,
                                              color: Colors.white, size: 30),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          (controller.playing_status.isTrue)
                                              ? IconButton(
                                                  onPressed: () {
                                                    controller
                                                        .playing_status(false);
                                                  },
                                                  icon: Icon(Icons.pause_circle,
                                                      color: Colors.white,
                                                      size: 30))
                                              : IconButton(
                                                  onPressed: () {
                                                    controller
                                                        .playing_status(true);
                                                  },
                                                  icon: Icon(Icons.play_circle,
                                                      color: Colors.white,
                                                      size: 30)),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Icon(Icons.fast_forward,
                                              color: Colors.white, size: 30),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Icon(Icons.skip_next,
                                              color: Colors.white, size: 30),
                                        ],
                                      ),

                                      //Right
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.keyboard_voice,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.hd_rounded,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.closed_caption,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ]
                        : [],
                  ))
            ],
          )),
    );
  }
}
