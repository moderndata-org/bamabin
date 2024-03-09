import 'dart:async';

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

  //! new
  RxBool isInit = false.obs;

  //! new

  PlayerController() {
    // timer = Timer(Duration(seconds: 1), () {
    //   if(current_progress.value == max_progress.value){
    //     playing_status(false);
    //     update();
    //   }else{
    //     print("Playing");
    //     playing_status(true);
    //     update();
    //   }
    // });
    // playing_status.listen((p0) {
    //   print(p0);
    //   if(p0 == true){
    //     current_progress++;
    //   }else{
    //     timer!.cancel();
    //   }
    //
    //
    // });
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
    video_controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((value) {
        video_controller.play();
        playing_status(true);
        isInit(true);
        max_progress(video_controller.value.duration.inMilliseconds);

        video_controller.addListener(() {
          bool isBuffering = video_controller.value.isBuffering;
          print("Buffered:${video_controller.value.buffered}");
          if (isBuffering != _isBuffering) {
            // TODO Here
            if (video_controller.value.buffered.last.end.inMilliseconds <
                max_progress.value)
              current_buffer_progress(
                  video_controller.value.buffered.last.end.inMilliseconds);
          }
          ;
          if (video_controller.value.isPlaying != playing_status ||
              isBuffering != _isBuffering) {
            playing_status(video_controller.value.isPlaying);
            _isBuffering(isBuffering);
          }

          video_controller.position.then((value) {
            if (value != null && value.inMilliseconds <= max_progress.toInt()) {
              current_progress(value.inMilliseconds);
            } else {
              playing_status(false);
              current_progress(0);
            }
          });
        });
      });
  }
}
