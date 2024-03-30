import 'dart:async';
import 'dart:convert';

import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/controller/detail_controller.dart';
import 'package:bamabin/models/dlbox_item_model.dart';
import 'package:bamabin/models/series_dlbox_model.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  PlayerController() {
    volume.listen((p0) {
      if(video_controller.value.isInitialized){
        if(show_volume.isFalse)
          show_volume(true);
       video_controller.setVolume(p0);
      }
    });

    brightness.listen((p0) {
      if(video_controller.value.isInitialized){
        if(show_brightness.isFalse)
          show_brightness(true);
       ScreenBrightness().setScreenBrightness(p0);
      }
    });






  }

  void lockUnlock(){
    is_lock(!is_lock.value);
  }
  void showQualityBox(){
    showPopover(context: Get.context!, bodyBuilder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            InkWell(
              child: Container(
                height: 50,
                color: Colors.amber[100],
                child: const Center(child: Text('Entry A')),
              ),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.amber[200],
              child: const Center(child: Text('Entry B')),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.amber[300],
              child: const Center(child: Text('Entry C')),
            ),
          ],
        ),
      );
    },
      direction: PopoverDirection.bottom,
      width: 200,
      height: 400,
      arrowHeight: 15,
      arrowWidth: 30,
    );
    switch(selectedMovieType.value){
      case MovieType.Subtitle:

        detailController.selectedFilm.value.moviesDlbox!.subtitle!.forEach((element) {
          print("Quality:${element.qualityCode} ${element.encoder}");
        });
        break;
      default:
        print("Unknown");
        break;
    }
  }
  void showSeriesBox({List<SeriesModel>? serial}) {
    //! Open Series Dialog that come from Serial Detail
    print('open Dialog');
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
          showSeriesBox(
              serial: detailController.selectedFilm.value.seriesDlbox);
        }
      } else {
        Get.toNamed('/subscribe');
      }
    } else {
      Get.toNamed('/signin');
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

  void playPauseClicked() {
    if (playing_status.isTrue) {
      video_controller.pause();
    } else {
      video_controller.play();
    }
  }

  Future<ClosedCaptionFile>? init_subtitle() async {

    var d = jsonDecode(detailController.selectedFilm.value.dlboxSubtitle!);
    var value = await ApiProvider().getSubtitleContent(d["1"]["link"]);
    var c = SubRipCaptionFile(value.body);
    return c;
  }

  void StartVideo() {
    ScreenBrightness().current.then((value){
      brightness(value);
    });
    // if(!video_controller.value.isInitialized){
    is_error(false);
    video_controller = VideoPlayerController.networkUrl(
        Uri.parse(selectedDlBoxItem.value.link!),
        videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: false))
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
      }).onError((error, stackTrace) {
        is_error(true);
      });
  }
}
