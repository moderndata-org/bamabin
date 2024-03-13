import 'dart:async';
import 'dart:convert';

import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/controller/detail_controller.dart';
import 'package:bamabin/models/dlbox_item_model.dart';
import 'package:bamabin/models/series_dlbox_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class PlayerController extends GetxController {
  var name = "".obs;
  var max_progress = 0.obs;
  var current_progress = 0.obs;
  var current_buffer_progress = 0.obs;
  var hide_bars = false.obs;
  var playing_status = false.obs;
  var fullscreen_status = false.obs;
  var is_dubbed = false.obs;
  var show_caption = false.obs;
  Timer? timer;
  late VideoPlayerController video_controller;
  var _isBuffering = false.obs;

  Rx<DlboxItem> selectedDlBoxItem = DlboxItem().obs;
  DetailController detailController = Get.find();
  var subtitle_style = {
    "bg_color": Colors.black,
    "text_opacity": 255,
    "text_color": Colors.white,
    "bg_opacity": 255
  }.obs;

  //! new
  RxBool isInit = false.obs;
  var captions = <Caption>[];

  //! new

  PlayerController() {}

  void showSeriesBox({List<SeriesModel>? serial}) {
    //! Open Series Dialog that come from Serial Detail
    print('open Dialog');
  }

  void fullScreen() {
    if (fullscreen_status.isTrue) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      fullscreen_status(false);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      fullscreen_status(true);
    }
  }

  void playPauseClicked() {
    if (playing_status.isTrue) {
      video_controller.pause();
    } else {
      video_controller.play();
    }
  }

  Future<ClosedCaptionFile>? init_subtitle() async {
    var d = jsonDecode(detailController.selectedFilm.value.dlboxSubtitle!);
    print(d);
    var value = await ApiProvider().getSubtitleContent(d["1"]["link"]);
    var c = SubRipCaptionFile(value.body);
    return c;
  }

  void StartVideo() {
    // if(!video_controller.value.isInitialized){
    print(
        "Video Link: ${jsonDecode(detailController.selectedFilm.value.dlboxSubtitle!)}");
    video_controller = VideoPlayerController.networkUrl(
        Uri.parse(selectedDlBoxItem.value.link!),
        videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true))
      ..initialize().then((value) {
        video_controller.play();
        isInit(true);
        print("is_dubbed: ${is_dubbed}");
        if (is_dubbed.isFalse) {
          video_controller.setClosedCaptionFile(init_subtitle());
          show_caption(true);
        } else {
          show_caption(false);
        }

        max_progress(video_controller.value.duration.inMilliseconds);

        video_controller.addListener(() {
          playing_status(video_controller.value.isPlaying);
          bool isBuffering = video_controller.value.isBuffering;
          if (isBuffering != _isBuffering) {
            // TODO Here
            if (video_controller.value.buffered[0].end.inMilliseconds <
                max_progress.value) {
              current_buffer_progress(
                  video_controller.value.buffered[0].end.inMilliseconds);
            }
          }

          if (video_controller.value.isPlaying != playing_status ||
              isBuffering != _isBuffering) {
            // playing_status(video_controller.value.isPlaying);
            _isBuffering(isBuffering);
          }

          video_controller.position.then((value) {
            if (value != null && value.inMilliseconds <= max_progress.toInt()) {
              current_progress(value.inMilliseconds);
            } else {
              current_progress(0);
            }
          });
        });
      });
  }
}
