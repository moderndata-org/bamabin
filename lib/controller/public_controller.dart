import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class PublicController extends GetxController {
  RxInt homeBannerIndex = 0.obs;
  RxInt bottomIndex = 0.obs;
  RxDouble bottomSelectedContainerWidth = 10.0.obs;
  ScrollController mainScrollController = ScrollController();
  ScrollController favoriteScrollController = ScrollController();
  RxBool isVisibleAppbar = true.obs;
  RxBool hasSubscribe = false.obs;
  RxBool isPlayingTrailer = false.obs;
  RxBool isLoadingTrailer = false.obs;
  RxBool isSerialOpenedDetail = false.obs;
  RxBool isTextExpandedMovieDetail = false.obs;
  GlobalKey<ScaffoldState> scaffolState = GlobalKey();
  RxInt starRate = 0.obs;
  RxString appBarCenterText = ''.obs;

  late VideoPlayerController trailerController;

  void setRate({required int rateNum}) {
    starRate(rateNum);
  }

  @override
  void onInit() {
    mainScrollController.addListener(() {
      if (mainScrollController.offset > 10) {
        isVisibleAppbar(false);
      } else {
        isVisibleAppbar(true);
      }
    });
    super.onInit();
  }

  void runBottomNavAnimation() {
    bottomSelectedContainerWidth(0);
    Timer(Duration(milliseconds: 100), () {
      bottomSelectedContainerWidth(10);
    });
  }
}
