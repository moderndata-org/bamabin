import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PublicController extends GetxController {
  RxInt homeBannerIndex = 0.obs;
  RxInt bottomIndex = 2.obs;
  RxDouble bottomSelectedContainerWidth = 10.0.obs;
  ScrollController mainScrollController = ScrollController();
  ScrollController favoriteScrollController = ScrollController();
  RxBool isVisibleAppbar = true.obs;
  RxBool hasSubscribe = false.obs;
  GlobalKey<ScaffoldState> scaffolState = GlobalKey();

  @override
  void onInit() {
    mainScrollController.addListener(() {
      if (mainScrollController.offset > 5) {
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
