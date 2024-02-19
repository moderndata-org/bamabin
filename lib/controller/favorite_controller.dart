import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/controller/auth_controller.dart';
import 'package:get/get.dart';

import '../api/api_handler.dart';
import '../models/film_model.dart';

class FavoriteController extends GetxController {
  RxList<FilmModel> listFavorites = <FilmModel>[].obs;
  RxBool isLoadingFavorites = false.obs;
  AuthController _authcontroller = Get.find<AuthController>();

  @override
  void onInit() {
    if (_authcontroller.isLogin.isTrue) {
      getFavorites();
    }
    super.onInit();
  }

  void getFavorites() {
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
      print(res.body);
    });
  }

  void setFavorite(
      {required String id, required FavoriteAction favoriteAction}) {
    String action = '';
    switch (favoriteAction) {
      case FavoriteAction.Add:
        action = 'add';
      case FavoriteAction.Remove:
        action = 'remove';
    }
    ApiProvider().setFavorite(action: action, id: id).then((res) {
      print(res.body);
    });
  }
}
