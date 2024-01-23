import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../constant/classes.dart';

class PublicController extends GetxController {
  RxInt homeBannerIndex = 0.obs;
  RxInt bottomIndex = 0.obs;
  RxDouble bottomSelectedContainerWidth = 10.0.obs;
  ScrollController mainScrollController = ScrollController();
  ScrollController favoriteScrollController = ScrollController();
  ScrollController movieDetailScrollController = ScrollController();
  RxBool isVisibleAppbar = true.obs;
  RxBool hasSubscribe = false.obs;
  RxBool isPlayingTrailer = false.obs;
  RxBool isLoadingTrailer = false.obs;
  RxBool isSerialOpenedDetail = false.obs;
  RxBool isTextExpandedMovieDetail = false.obs;
  GlobalKey<ScaffoldState> scaffolState = GlobalKey();
  RxString appBarCenterText = ''.obs;
  Rx<LikeStatus> movieLikeStatus = LikeStatus.notSelected.obs;
  RxDouble trailerPosition = 0.0.obs;
  TextEditingController? txtComment;
  RxBool showGoToTop = false.obs;

  late VideoPlayerController trailerController;

  @override
  void onInit() {
    txtComment = TextEditingController();
    mainScrollController.addListener(() {
      if (mainScrollController.offset > 10) {
        isVisibleAppbar(false);
      } else {
        isVisibleAppbar(true);
      }
    });
    movieDetailScrollController.addListener(() {
      if (movieDetailScrollController.offset > Get.height / 5) {
        showGoToTop(true);
      } else {
        showGoToTop(false);
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
