import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/models/film_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PublicController extends GetxController {
  RxInt homeBannerIndex = 0.obs;
  ScrollController favoriteScrollController = ScrollController();
  RxBool hasSubscribe = false.obs;
  //! Search Page
  RxBool isShowShimmerSearch = false.obs;
  RxBool isLoadingSearchResults = false.obs;
  RxBool isAdvancedSearch = false.obs;
  RxBool hasDubbed = false.obs;
  RxBool hasSubtitle = false.obs;
  late TextEditingController txtSearch;
  int page = 1;
  String searchText = '';
  RxList<FilmModel> listSearch = <FilmModel>[].obs;
  Rx<AdvancedSearchType> selectedType = AdvancedSearchType.none.obs;
  //! Search Page End

  void clearAndOpenSearch() {
    selectedType(AdvancedSearchType.none);
    isAdvancedSearch(false);
    isShowShimmerSearch(false);
    isLoadingSearchResults(false);
    txtSearch.clear();
    searchText = '';
    listSearch.clear();
    Get.toNamed('/search');
  }

  void advancedSearch({
    required AdvancedSearchType type,
    String? fromYear,
    String? toYear,
    String? fromImdb,
    String? toImdb,
  }) {}

  void search({required bool isFirstPage}) {
    if (isLoadingSearchResults.isFalse) {
      isAdvancedSearch(false);
      isLoadingSearchResults(true);
      if (isFirstPage) {
        print('this');
        searchText = txtSearch.text.trim();
        page = 1;
        isShowShimmerSearch(true);
        listSearch.clear();
      } else {
        page += 1;
      }
      ApiProvider().search(text: searchText, page: page).then((res) {
        if (res.body != null) {
          isLoadingSearchResults(false);
          isShowShimmerSearch(false);
          if (res.body['status'] == true) {
            print(res.body);
            List tmp = res.body['result']['movies'];
            tmp.forEach((element) {
              listSearch.add(FilmModel.fromJson(element));
            });
          }
        }
      });
    }
    // if (txtSearch.text.trim().length > 0) {}
  }

  @override
  void onInit() {
    txtSearch = TextEditingController();
    super.onInit();
  }
}
