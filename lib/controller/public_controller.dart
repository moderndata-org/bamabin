import 'package:bamabin/api/api_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PublicController extends GetxController {
  RxInt homeBannerIndex = 0.obs;
  ScrollController favoriteScrollController = ScrollController();
  RxBool hasSubscribe = false.obs;
  RxBool isShowShimmerSearch = false.obs;
  RxBool isLoadingSearchResults = false.obs;
  late TextEditingController txtSearch;
  int page = 1;

  void search({required bool loadMore}) {
    if (loadMore) {
      page += 1;
    } else {
      page = 1;
      isShowShimmerSearch(true);
    }
    ApiProvider().serach(text: txtSearch.text.trim(), page: page).then((res) {
      if (res.body != null && res.body['status'] == true) {
        List tmp = res.body['result']['movies'];
        // tmp.
      }
    });
    // if (txtSearch.text.trim().length > 0) {}
  }

  @override
  void onInit() {
    txtSearch = TextEditingController();
    super.onInit();
  }
}
