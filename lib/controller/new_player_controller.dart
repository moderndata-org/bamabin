import 'dart:async';
import 'dart:convert';

import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/controller/detail_controller.dart';
import 'package:bamabin/models/dlbox_item_model.dart';
import 'package:bamabin/models/series_dlbox_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:video_player/video_player.dart';

import '../models/film_model.dart';
import '../models/recent_model.dart';
import 'recent_controller.dart';

class NewPlayerController extends GetxController {
  var name = "".obs;
  var max_progress = 0.obs;
  var current_progress = 0.obs;
  var current_buffer_progress = 0.obs;
  var hide_bars = false.obs;
  var playing_status = false.obs;
  var fullscreen_status = false.obs;
  var is_dubbed = false.obs;
  var is_error = false.obs;
  var is_lock = false.obs;
  var show_caption = false.obs;
  var selectedMovieType = MovieType.None.obs;

  var volume = 0.5.obs;
  var brightness = 0.5.obs;
  var show_volume = false.obs;
  var show_brightness = false.obs;
  Timer? timer;
  late VlcPlayerController video_controller;
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

  void playPauseClicked() {
    if (video_controller.value.playingState == PlayingState.playing) {
      video_controller.pause();
    } else {
      video_controller.play();
    }
  }

  PlayerController() {

  }

  void seekRelative(Duration seekStep) {
    if(video_controller.value.isInitialized){
      video_controller.seekTo(video_controller.value.position + seekStep);
    }

  }

  void init(){
    if(isInit.isFalse){
      video_controller = VlcPlayerController.network(
        'https://media.w3.org/2010/05/sintel/trailer.mp4',
        hwAcc: HwAcc.full,
        autoPlay: true,


      );
      isInit(true);
      video_controller.addListener(() {


        switch(video_controller.value.playingState){
          case PlayingState.initialized:
            break;
          case PlayingState.playing:
            max_progress(video_controller.value.duration.inSeconds);
            playing_status(true);
            current_progress(video_controller.value.position.inSeconds);
            break;
          default:
            playing_status(false);
            break;
        }
      });


      video_controller.addListener(() {

      });
    }

  }


}
