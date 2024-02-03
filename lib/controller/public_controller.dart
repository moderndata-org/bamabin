import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../constant/classes.dart';

class PublicController extends GetxController {
  RxInt homeBannerIndex = 0.obs;
  ScrollController favoriteScrollController = ScrollController();
  ScrollController movieDetailScrollController = ScrollController();
  RxBool hasSubscribe = false.obs;
  RxBool isPlayingTrailer = false.obs;
  RxBool isLoadingTrailer = false.obs;
  RxBool isSerialOpenedDetail = false.obs;
  RxBool isTextExpandedMovieDetail = false.obs;
  Rx<LikeStatus> movieLikeStatus = LikeStatus.notSelected.obs;
  RxDouble trailerPosition = 0.0.obs;
  TextEditingController? txtComment;
  RxBool showGoToTop = false.obs;
  RxBool isFavorite = false.obs;

  late VideoPlayerController trailerController;

  @override
  void onInit() {
    txtComment = TextEditingController();
    movieDetailScrollController.addListener(() {
      if (movieDetailScrollController.offset > Get.height / 5) {
        showGoToTop(true);
      } else {
        showGoToTop(false);
      }
    });
    super.onInit();
  }
}
