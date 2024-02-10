import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/models/film_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../constant/classes.dart';

class DetailController extends GetxController {
  Rx<FilmModel> selectedFilm = FilmModel().obs;
  RxBool isTextExpandedMovieDetail = false.obs;
  RxBool isSerial = false.obs;
  ScrollController movieDetailScrollController = ScrollController();
  RxBool isPlayingTrailer = false.obs;
  RxBool isLoadingTrailer = false.obs;
  Rx<LikeStatus> movieLikeStatus = LikeStatus.notSelected.obs;
  RxDouble trailerPosition = 0.0.obs;
  TextEditingController? txtComment;
  RxBool showGoToTop = false.obs;
  RxBool isFavorite = false.obs;
  late VideoPlayerController trailerController;

  void getNewData() {
    print('${selectedFilm.value.id}');
    ApiProvider().getMovieDetail(id: '${selectedFilm.value.id}').then((res) {
      if (res.body != null) {
        print(res.body);
      }
    });
  }

  @override
  void onInit() {
    txtComment = TextEditingController();
    movieDetailScrollController.addListener(() {
      if (movieDetailScrollController.offset > Get.height / 5) {
        showGoToTop(true);
      } else {
        showGoToTop(false);
      }
    });
    super.onInit();
  }
}
