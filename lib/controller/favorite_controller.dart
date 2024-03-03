import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/controller/detail_controller.dart';
import 'package:bamabin/widgets/MySncakBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/api_handler.dart';
import '../constant/utils.dart';
import '../models/film_model.dart';

class FavoriteController extends GetxController {
  RxList<FilmModel> listFavorites = <FilmModel>[].obs;
  RxBool isLoadingFavorites = false.obs;
  RxBool isSettingFavorites = false.obs;

  @override
  void onInit() {
    var _authcontroller = Get.find<AuthController>();
    if (_authcontroller.isLogin.isTrue) {
      getFavoritesList();
    }
    super.onInit();
  }

  void getFavoritesList() {
    listFavorites.clear();
    isLoadingFavorites(true);
    ApiProvider().getFavorites().then((res) {
      isLoadingFavorites(false);
      if (res.body != null) {
        if (res.body['status'] == true) {
          List tmp = res.body['result'];
          for (var e in tmp) {
            listFavorites.add(FilmModel.fromJson(e));
          }
        }
      }
    });
  }

  void setFavorite(
      {required String id, required FavoriteAction favoriteAction}) {
    isSettingFavorites(true);
    String action = '';
    bool isFavorite;
    switch (favoriteAction) {
      case FavoriteAction.Add:
        {
          action = 'add';
          isFavorite = true;
        }
      case FavoriteAction.Remove:
        {
          action = 'remove';
          isFavorite = false;
        }
    }
    ApiProvider().setFavorite(action: action, id: id).then((res) {
      if (res.body != null) {
        if (res.body['status'] == true) {
          var _detailcontroller = Get.find<DetailController>();
          _detailcontroller.selectedFilm.value.is_watchlist = isFavorite;
          getFavoritesList();
          showMessage(text: res.body['message'], isSucces: true);
        } else {
          showMessage(text: res.body['message'], isSucces: false);
        }
      }
      print(res.body);
      isSettingFavorites(false);
    });
  }
}
