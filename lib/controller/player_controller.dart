import 'dart:async';

import 'package:bamabin/controller/detail_controller.dart';
import 'package:bamabin/models/dlbox_item_model.dart';
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
  Timer? timer;
  late VideoPlayerController video_controller;
  var _isBuffering = false.obs;

  Rx<DlboxItem> selectedDlBoxItem = DlboxItem().obs;
  DetailController detailController = Get.find();

  //! new
  RxBool isInit = false.obs;

  //! new

  PlayerController() {

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
      playing_status(false);
    } else {
      video_controller.play();
      playing_status(true);
    }
  }

  void StartVideo() {
    // if(!video_controller.value.isInitialized){
    print(selectedDlBoxItem.value.link!);
    video_controller = VideoPlayerController.networkUrl(Uri.parse(
        selectedDlBoxItem.value.link!))
      ..initialize().then((value) {
        video_controller.play();
        playing_status(true);
        isInit(true);

        print("Max:${video_controller.value.duration}");
        max_progress(video_controller.value.duration.inMilliseconds);

        video_controller.addListener(() {

          bool isBuffering = video_controller.value.isBuffering;
          print("Buffered:${video_controller.value.buffered[0].end.inMilliseconds} / ${video_controller.value.duration.inMilliseconds}");
          if (isBuffering != _isBuffering) {
            // TODO Here
            if (video_controller.value.buffered[0].end.inMilliseconds <
                max_progress.value){
              print("Here set current");
              current_buffer_progress(video_controller.value.buffered[0].end.inMilliseconds);

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
              playing_status(true);
            } else {
              playing_status(false);
              current_progress(0);
            }
          });
        });
      });
  }
}
