import 'dart:async';

import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/models/film_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/classes.dart';

class MainController extends GetxController {
  int? pageNumber;
  int? lastPageNumber;
  RxDouble bottomSelectedContainerWidth = 10.0.obs;
  ScrollController mainScrollController = ScrollController();
  RxBool isVisibleAppbar = true.obs;
  GlobalKey<ScaffoldState> scaffolState = GlobalKey();
  RxString appBarCenterText = ''.obs;
  RxList<FilmModel> selectedList = <FilmModel>[].obs;
  RxBool isShowShimmer = false.obs;
  RxBool isLoadingData = false.obs;
  RxBool hasContinue = false.obs;
  Rx<BottomNavType> selectedBottomNav = BottomNavType.home.obs;
  Rx<OrderBy> selectedOrder = OrderBy.none.obs;

  @override
  void onInit() {
    mainScrollController.addListener(() {
      if (mainScrollController.offset > 10) {
        isVisibleAppbar(false);
      } else {
        isVisibleAppbar(true);
      }
    });
    selectedBottomNav.listen((p0) {
      if (selectedBottomNav.value != BottomNavType.home) {
        getArchive(isFirstPage: true);
      }
    });
    // bottomIndex.listen((p0) {
    //   if (p0 != 0) {
    //     isVisibleAppbar(true);
    //   }
    //   switch (p0) {
    //     case 0:
    //       {
    //         if (mainScrollController.offset > 10) {
    //           isVisibleAppbar(false);
    //         } else {
    //           isVisibleAppbar(true);
    //         }
    //         break;
    //       }
    //     case 1:
    //       getArchive(type: BottomNavType.movies);
    //       break;
    //     case 2:
    //       getArchive(type: BottomNavType.series);
    //       break;
    //     case 3:
    //       getArchive(type: BottomNavType.animations);
    //       break;
    //     case 4:
    //       getArchive(type: BottomNavType.anime);
    //       break;
    //   }
    // });
    super.onInit();
  }

  void changeOrder({required OrderBy orderBy}) {
    selectedOrder(orderBy);
    getArchive(isFirstPage: true);
  }

  void getArchive({required bool isFirstPage}) {
    if (isLoadingData.isFalse &&
        ((pageNumber != null && pageNumber! < lastPageNumber!) ||
            pageNumber == null)) {
      isLoadingData(true);
      if (isFirstPage) {
        pageNumber = null;
        isShowShimmer(true);
        hasContinue(true);
      } else {
        pageNumber == null ? pageNumber = 2 : pageNumber = pageNumber! + 1;
      }
      ApiProvider()
          .archive(
              type: selectedBottomNav.value,
              page: pageNumber == null ? null : pageNumber.toString(),
              orderBy: selectedOrder.value)
          .then((res) {
        if (res.body != null && res.body['status'] == true) {
          lastPageNumber = res.body['info']['last_page_num'];
          print('ssssss $pageNumber');
          isLoadingData(false);
          if (isFirstPage) {
            selectedList.clear();
            isShowShimmer(false);
          }

          List tmp = res.body['results'];
          for (var element in tmp) {
            selectedList.add(FilmModel.fromJson(element));
          }
          // switch (type) {
          //   case BottomNavType.movies:
          //     {
          //       break;
          //     }
          //   case BottomNavType.series:
          //     {
          //       break;
          //     }
          //   case BottomNavType.animations:
          //     {
          //       break;
          //     }
          //   case BottomNavType.anime:
          //     {
          //       break;
          //     }
          // }
          // print('res.statusText');
          // print(res.statusText);
          // print(res.statusCode);
          // print(res.body);
        }
      });
    }
  }

  void runBottomNavAnimation() {
    bottomSelectedContainerWidth(0);
    Timer(Duration(milliseconds: 100), () {
      bottomSelectedContainerWidth(10);
    });
  }
}
