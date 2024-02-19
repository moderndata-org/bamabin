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
    GetConnect()
        .get('https://www.aliamaterasu.ir/api/watchlist/list',
            headers: ApiProvider().head)
        .then((res) {
      print(res.body);
    });
  }
}
