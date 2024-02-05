import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PublicController extends GetxController {
  RxInt homeBannerIndex = 0.obs;
  ScrollController favoriteScrollController = ScrollController();
  RxBool hasSubscribe = false.obs;

  @override
  void onInit() {
    super.onInit();
  }
}
