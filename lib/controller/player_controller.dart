import 'dart:async';
import 'dart:convert';

import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/controller/detail_controller.dart';
import 'package:bamabin/models/dlbox_item_model.dart';
import 'package:bamabin/models/series_dlbox_model.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:video_player/video_player.dart';

import '../models/film_model.dart';
import '../models/recent_model.dart';
import 'recent_controller.dart';

class PlayerController extends GetxController {
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
    "bg_color": VlcSubtitleColor.black,
    "text_opacity": 255,
    "text_color": VlcSubtitleColor.white,
    "bg_opacity": 255
  }.obs;

  //! new
  RxBool isInit = false.obs;
  var captions = <Caption>[];

  Future<void> getSubtitleTracks() async {

    final subtitleTracks = await video_controller.getSpuTracks();
    //
    if (subtitleTracks.isNotEmpty) {
      final selectedSubId = await showDialog<int>(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: cPrimary,
            title: const Text('زیر نویس را انتخاب کنید',style: TextStyle(color: Colors.white),textDirection: TextDirection.rtl,textAlign: TextAlign.right,),
            content: SizedBox(
              width: double.maxFinite,
              height: 250,
              child: ListView.builder(
                itemCount: subtitleTracks.keys.length + 1,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      index < subtitleTracks.keys.length
                          ? subtitleTracks.values.elementAt(index)
                          : 'غیرفعال',
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(
                        context,
                        index < subtitleTracks.keys.length
                            ? subtitleTracks.keys.elementAt(index)
                            : -1,
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      );

      if (selectedSubId != null) {
        await video_controller.setSpuTrack(selectedSubId);
      }
    }
  }

  Future<void> getAudioTracks() async {

    final audioTracks = await video_controller.getAudioTracks();
    //
    if (audioTracks.isNotEmpty) {
      final selectedAudioTrackId = await showDialog<int>(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: cPrimary,
            title: const Text('صدا را انتخاب کنید',style:  TextStyle(color: Colors.white),textDirection: TextDirection.rtl,textAlign: TextAlign.right,),
            content: SizedBox(
              width: double.maxFinite,
              height: 250,
              child: ListView.builder(
                itemCount: audioTracks.keys.length + 1,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      index < audioTracks.keys.length
                          ? audioTracks.values.elementAt(index)
                          : 'غیرفعال',
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(
                        context,
                        index < audioTracks.keys.length
                            ? audioTracks.keys.elementAt(index)
                            : -1,
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      );

      if (selectedAudioTrackId != null) {
        await video_controller.setAudioTrack(selectedAudioTrackId);

      }
    }
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

  void playMovie() {
    final authController = Get.find<AuthController>();
    if (authController.isLogin.value) {
      if (authController.paymentController.isVip.value) {
        RecentModel rm = RecentModel(
            bg_cover: detailController.selectedFilm.value.bgThumbnail,
            cover: detailController.selectedFilm.value.thumbnail,
            hasDubbed: detailController.selectedFilm.value.hasDubbed,
            hasSubtitle: detailController.selectedFilm.value.hasSubtitle,
            id: detailController.selectedFilm.value.id,
            imdb: detailController.selectedFilm.value.imdbRate,
            title: detailController.selectedFilm.value.title,
            year: detailController.selectedFilm.value.releaseYear);
        Get.find<RecentContoller>().addToRecent(recentModel: rm);

        if (detailController.selectedFilm.value.type == 'movies') {
          if (detailController.selectedFilm.value.moviesDlbox?.subtitle !=
              null ||
              detailController.selectedFilm.value.moviesDlbox?.subtitle != []) {
            selectedMovieType(MovieType.Subtitle);
            bool has720 = false;
            bool has480 = false;
            DlboxItem p720 = DlboxItem();
            DlboxItem p480 = DlboxItem();
            detailController.selectedFilm.value.moviesDlbox?.subtitle!
                .forEach((sub) {
              if (sub.qualityCode == '720p') {
                has720 = true;
                p720 = sub;
              }
              if (sub.qualityCode == '480p') {
                has480 = true;
                p480 = sub;
              }
            });
            if (has720) {
              // print('will play 720');
              selectedDlBoxItem(p720);
              Get.toNamed('/player');
            } else if (has480) {
              // print('will play 480');
              selectedDlBoxItem(p480);
              Get.toNamed('/player');
            }
          } else if (detailController.selectedFilm.value.moviesDlbox?.dubbed !=
              null ||
              detailController.selectedFilm.value.moviesDlbox?.dubbed != []) {
            selectedMovieType(MovieType.Dubbed);
            bool has720 = false;
            bool has480 = false;
            DlboxItem p720 = DlboxItem();
            DlboxItem p480 = DlboxItem();
            detailController.selectedFilm.value.moviesDlbox?.dubbed!
                .forEach((sub) {
              if (sub.qualityCode == '720p') {
                has720 = true;
                p720 = sub;
              }
              if (sub.qualityCode == '480p') {
                has480 = true;
                p480 = sub;
              }
            });
            if (has720) {
              // print('will play 720');
              selectedDlBoxItem(p720);
              Get.toNamed('/player');
            } else if (has480) {
              // print('will play 480');
              selectedDlBoxItem(p480);
              Get.toNamed('/player');
            }
          }
        } else if (detailController.selectedFilm.value.type == 'series') {
          // showSeriesBox(
          //     serial: detailController.selectedFilm.value.seriesDlbox);
        }
      } else {
        Get.toNamed('/subscribe');
      }
    } else {
      Get.toNamed('/signin');
    }
  }

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
  VlcSubtitleOptions getOptions(){
    print("Calllllllllllllll");
    return VlcSubtitleOptions([
      VlcSubtitleOptions.boldStyle(true),
      VlcSubtitleOptions.color(subtitle_style["text_color"] as VlcSubtitleColor),
      VlcSubtitleOptions.backgroundColor(subtitle_style["bg_color"] as VlcSubtitleColor),
      VlcSubtitleOptions.backgroundOpacity((subtitle_style["bg_opacity"] as int)),
      VlcSubtitleOptions.opacity((subtitle_style["text_opacity"] as int)),

    ]);
  }
  void init(){
    if(isInit.isFalse){

      video_controller = VlcPlayerController.network(
        selectedDlBoxItem.value.link!,
        hwAcc: HwAcc.full,
        autoPlay: true,
        options: VlcPlayerOptions(
          subtitle: getOptions(),
        )


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
