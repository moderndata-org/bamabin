import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/models/film_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../constant/classes.dart';
import '../widgets/MySncakBar.dart';

class DetailController extends GetxController {
  Rx<FilmModel> selectedFilm = FilmModel().obs;
  RxBool isTextExpandedMovieDetail = false.obs;
  RxBool isSerial = false.obs;
  ScrollController movieDetailScrollController = ScrollController();
  RxBool isPlayingTrailer = false.obs;
  RxBool isLoadingTrailer = false.obs;
  Rx<LikeAction> movieLikeStatus = LikeAction.notSelected.obs;
  RxDouble trailerPosition = 0.0.obs;
  TextEditingController? txtComment;
  RxBool showGoToTop = false.obs;
  RxBool isFavorite = false.obs;
  RxBool isLoadingLikeStatus = false.obs;
  late VideoPlayerController trailerController;

  void setLikeAction({required LikeAction action, required String id}) {
    isLoadingLikeStatus(true);
    String act = action == LikeAction.like ? 'like' : 'dislike';
    ApiProvider().setLike(id: id, action: act).then((res) {
      if (res.body != null) {
        isLoadingLikeStatus(true);
        if (res.body['status'] == true) {
          movieLikeStatus(action);
          showMessage(message: res.body['message'], isSucces: true);
        } else {
          showMessage(message: res.body['message'], isSucces: false);
        }
      }
      print(res.body);
      isLoadingLikeStatus(false);
    });
  }

  void getNewData() {
    ApiProvider()
        .getMovieDetail(
      id: '${selectedFilm.value.id}',
    )
        .then((res) {
      if (res.body != null) {
        selectedFilm(FilmModel.fromJson(res.body['result']));
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

  void showMessage({required String message, required bool isSucces}) {
    MySnackBar(
      message: message,
      color: isSucces ? Colors.green : Colors.amber,
      icon: Icon(
        isSucces ? Icons.check_circle_rounded : Icons.warning_rounded,
        color: isSucces ? Colors.green : Colors.amber,
      ),
    );
  }
}
