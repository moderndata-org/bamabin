import 'dart:async';
import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/models/film_model.dart';
import 'package:bamabin/models/genre_model.dart';
import 'package:bamabin/models/section_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
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
  Rx<Genre> selectedGenre = Genre().obs;
  RxInt selectedImdbRate = 0.obs;
  var taxonomypageNumber = 1;
  var sectionsList = <SectionModel>[].obs;
  var moreFilmList = <FilmModel>[].obs;
  AuthController? _authController;

  final pageController = PageController(initialPage: 0);
  //! Filter Screen
  RxInt filterScreenPageNumber = 0.obs;
  RxList<FilmModel> listFilterScreen = <FilmModel>[].obs;
  String _key = '';
  String _id = '';
  RxString filterScreenTitle = ''.obs;
  RxBool isLoadingDataFilterScreen = false.obs;
  RxBool isFetchingFilterScreen = false.obs;

  void openFilterScreen({
    required String key,
    required String id,
    required String title,
  }) {
    listFilterScreen.clear();
    filterScreenPageNumber(0);
    _key = key;
    _id = id;
    filterScreenTitle(title);
    isLoadingDataFilterScreen(true);
    isFetchingFilterScreen(false);
    GetDetailsForFilterScreen();
    Get.offNamed('/filter');
  }

  void GetDetailsForFilterScreen() {
    if (isFetchingFilterScreen.isFalse) {
      isFetchingFilterScreen(true);
      filterScreenPageNumber += 1;
      ApiProvider()
          .getTaxonomy(_key, _id, '${filterScreenPageNumber.value}')
          .then((res) {
        print(res.body);
        isLoadingDataFilterScreen(false);
        isFetchingFilterScreen(false);
        if (res.body != null) {
          if (res.body['results'] != null) {
            List tmp = res.body['results'];
            tmp.forEach((element) {
              listFilterScreen.add(FilmModel.fromJson(element));
            });
          }
        }

        // if(re)
      });
    }
  }

  //! Filter Screen

  @override
  void onInit() {
    Timer(Duration(milliseconds: 50), () {
      _authController = Get.find<AuthController>();
    });
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
        resetFilterMain();
        getArchive(isFirstPage: true);
      } else {
        getSliders();
        getMainSections();
      }
    });
    super.onInit();
  }

  void resetFilterMain() {
    selectedOrder(OrderBy.none);
    selectedGenre(Genre());
    selectedImdbRate(0);
  }

  void changeOrder({required OrderBy orderBy}) {
    if (isLoadingData.isFalse) {
      selectedOrder(orderBy);
      getArchive(isFirstPage: true);
    }
  }

  void changeGenre({required Genre gener}) {
    if (isLoadingData.isFalse) {
      selectedGenre(gener);
      getArchive(isFirstPage: true);
    }
  }

  void changeImdbRate({required int imdbRate}) {
    if (isLoadingData.isFalse) {
      selectedImdbRate(imdbRate);
      getArchive(isFirstPage: true);
    }
  }

  void getArchive({required bool isFirstPage}) {
    print("Getting archive for ${selectedBottomNav.value}");
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
            isLogin: _authController!.isLogin.value,
            type: selectedBottomNav.value,
            page: pageNumber == null ? null : pageNumber.toString(),
            orderBy: selectedOrder.value,
            imdb_min_rate:
                '${selectedImdbRate.value == 0 ? '' : selectedImdbRate.value}',
            genreId: '${selectedGenre.value.id ?? ''}')
        .then((res) {
      isLoadingData(false);
      if (isFirstPage) {
        selectedList.clear();
        isShowShimmer(false);
      }
      if (res.body != null && res.body['status'] == true) {
        lastPageNumber = res.body['info']['last_page_num'];
        List tmp = res.body['results'];
        for (var element in tmp) {
          selectedList.add(FilmModel.fromJson(element));
        }
      }
    });
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
      if (value.body != null) {
        if (value.body["status"] == true) {
          (value.body["result"] as List).forEach((element) {
            sectionsList.add(SectionModel.fromJson(element));
          });
        }
      }
      isLoadingMain(false);
    });
  }

  void getTaxonomy(String taxonomy, String id) {
    if (taxonomypageNumber == 1) {
      moreFilmList.clear();
    }
    isShowShimmer(true);
    ApiProvider()
        .getTaxonomy(taxonomy, id, taxonomypageNumber.toString())
        .then((value) {
      if (value.body != null) {
        if (value.body["status"] == true) {
          (value.body["results"] as List).forEach((element) {
            moreFilmList.add(FilmModel.fromJson(element));
          });
        }
      }
      isShowShimmer(false);
    });
  }

  void runBottomNavAnimation() {
    bottomSelectedContainerWidth(0);
    Timer(Duration(milliseconds: 100), () {
      bottomSelectedContainerWidth(10);
    });
  }
}
