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
    GetConnect()
        .get('https://www.aliamaterasu.ir/api/watchlist/list',
            headers: ApiProvider().head)
        .then((res) {
      isLoadingFavorites(false);
      if (res.body != null) {
        if (res.body['status'] == true) {
          List tmp = res.body['result'];
        } else {}
      }
      print(res.body);
    });
  }

  void setFavorites(
      {required String id, required FavoriteAction favoriteAction}) {
    String action = '';
    switch (favoriteAction) {
      case FavoriteAction.Add:
        action = 'add';
      case FavoriteAction.Remove:
        action = 'remove';
    }
    FormData frm = FormData({
      'post_id': '71970',
      'action': action,
    });
    GetConnect()
        .post('https://www.aliamaterasu.ir/api/watchlist/set', frm,
            headers: ApiProvider().head)
        .then((res) {
      print(res.body);
    });
  }
}
