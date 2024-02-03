import 'dart:async';

import 'package:bamabin/api/api_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/classes.dart';

class MainController extends GetxController {
  int? pageNumber;
  RxInt bottomIndex = 0.obs;
  RxDouble bottomSelectedContainerWidth = 10.0.obs;
  ScrollController mainScrollController = ScrollController();
  RxBool isVisibleAppbar = true.obs;
  GlobalKey<ScaffoldState> scaffolState = GlobalKey();
  RxString appBarCenterText = ''.obs;

  @override
  void onInit() {
    mainScrollController.addListener(() {
      if (mainScrollController.offset > 10) {
        isVisibleAppbar(false);
      } else {
        isVisibleAppbar(true);
      }
    });
    bottomIndex.listen((p0) {
      if (p0 != 0) {
        isVisibleAppbar(true);
      }
      switch (p0) {
        case 0:
          {
            if (mainScrollController.offset > 10) {
              isVisibleAppbar(false);
            } else {
              isVisibleAppbar(true);
            }
          }
        case 1:
          {
            getArchive(type: BottomNavType.movies);
          }
        case 2:
          {
            getArchive(type: BottomNavType.series);
          }
        case 3:
          {
            getArchive(type: BottomNavType.animations);
          }
        case 4:
          {
            getArchive(type: BottomNavType.anime);
          }
      }
    });
    super.onInit();
  }

  void getArchive({required BottomNavType type}) {
    pageNumber = null;
    ApiProvider()
        .archive(
            type: type, page: pageNumber == null ? null : pageNumber.toString())
        .then((res) {
      print('res.statusText');
      print(res.statusText);
      print(res.statusCode);
      print(res.body);
    });
  }

  void runBottomNavAnimation() {
    bottomSelectedContainerWidth(0);
    Timer(Duration(milliseconds: 100), () {
      bottomSelectedContainerWidth(10);
    });
  }
}
