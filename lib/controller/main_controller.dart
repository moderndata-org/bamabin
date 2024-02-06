import 'dart:async';

import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/models/film_model.dart';
import 'package:bamabin/models/section_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
  RxList<FilmModel> sliderList = <FilmModel>[].obs;
  RxBool isLoadingItems = false.obs;
  RxBool isLoadingBanners = false.obs;
  RxBool isShowShimmer = false.obs;
  RxBool isLoadingData = false.obs;
  RxBool isLoadingMain = false.obs;
  RxBool hasContinue = false.obs;
  Rx<BottomNavType> selectedBottomNav = BottomNavType.home.obs;
  Rx<OrderBy> selectedOrder = OrderBy.none.obs;

  var sectionsList = <SectionModel>[].obs;

  @override
  void onInit() {
    //! on open screen
    getSliders();
    getMainSections();
    //!
    mainScrollController.addListener(() {
      if (selectedBottomNav.value == BottomNavType.home) {
        if (mainScrollController.offset > 10) {
          isVisibleAppbar(false);
        } else {
          isVisibleAppbar(true);
        }
      }
    });
    selectedBottomNav.listen((p0) {
      if (selectedBottomNav.value != BottomNavType.home) {
        getArchive(isFirstPage: true);
        selectedOrder(OrderBy.none);
      } else {
        getSliders();
        getMainSections();
      }
    });
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
        isLoadingData(false);
        if (isFirstPage) {
          selectedList.clear();
          isShowShimmer(false);
        }
        if (res.body != null && res.body['status'] == true) {
          lastPageNumber = res.body['info']['last_page_num'];
          print('ssssss $pageNumber');

          List tmp = res.body['results'];
          print(res.body);
          for (var element in tmp) {
            selectedList.add(FilmModel.fromJson(element));
          }
        }
      });
    }
  }

  void getSliders() {
    isLoadingBanners(true);
    ApiProvider().getSliders().then((value) {
      sliderList.clear();
      if (value.isOk) {
        if (value.body["status"] == true) {
          (value.body["result"] as List).forEach((element) {
            sliderList.add(FilmModel.fromJson(element));
          });
        }
        isLoadingBanners(false);
      }
    });
  }

  void getMainSections() {
    sectionsList.clear();
    isLoadingMain(true);
    ApiProvider().getMainSections().then((value) {
      sectionsList.clear();

      if (value.body["status"] == true) {
        (value.body["result"] as List).forEach((element) {
          sectionsList.add(SectionModel.fromJson(element));
        });
      }
      isLoadingMain(false);
    });
  }

  void runBottomNavAnimation() {
    bottomSelectedContainerWidth(0);
    Timer(Duration(milliseconds: 100), () {
      bottomSelectedContainerWidth(10);
    });
  }
}
