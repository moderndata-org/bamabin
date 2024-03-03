import 'dart:async';

import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/controller/recent_controller.dart';
import 'package:bamabin/models/film_model.dart';
import 'package:bamabin/models/recent_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../constant/classes.dart';
import '../constant/utils.dart';
import '../models/comment_model.dart';
import '../models/department_model.dart';

class DetailController extends GetxController {
  Rx<FilmModel> selectedFilm = FilmModel().obs;
  RxBool isTextExpandedMovieDetail = false.obs;
  RxBool isSerial = false.obs;
  RxDouble seekBarOpacity = 0.0.obs;
  RxBool isLoadingNewData = false.obs;
  RxBool isSubmmitingComment = false.obs;
  ScrollController movieDetailScrollController = ScrollController();
  RxBool isPlayingTrailer = false.obs;
  RxBool isLoadingTrailer = false.obs;
  Rx<LikeAction> movieLikeStatus = LikeAction.notSelected.obs;
  RxDouble trailerPosition = 0.0.obs;
  TextEditingController? txtComment;
  RxBool showGoToTop = false.obs;
  RxBool isLoadingLikeStatus = false.obs;
  RxBool isSubmittingBugReport = false.obs;
  VideoPlayerController? trailerController;
  AuthController? authController;
  RxList<DepartmentModel> departments = <DepartmentModel>[].obs;
  RxBool loadingDepartments = false.obs;
  Rx<DepartmentModel> selectedDepartment = DepartmentModel().obs;
  Rx<CommentModel> selectedCommentForReply = CommentModel().obs;

  void setLikeAction({required LikeAction action, required String id}) {
    isLoadingLikeStatus(true);
    String act = action == LikeAction.like ? 'like' : 'dislike';
    ApiProvider().setLike(id: id, action: act).then((res) {
      if (res.body != null) {
        isLoadingLikeStatus(false);
        if (res.body['status'] == true) {
          movieLikeStatus(action);
          selectedFilm.value.likeInfo =
              LikeInfoModel.fromJson(res.body['result']);
          selectedFilm.refresh();
        } else {
          showMessage(text: res.body['message'], isSucces: false);
        }
      }
      isLoadingLikeStatus(false);
    });
  }

  void submitBugReport({required String text}) {
    if (isSubmittingBugReport.isFalse) {
      isSubmittingBugReport(true);
      ApiProvider()
          .sendBugReport(
              department: '${selectedDepartment.value.id}', content: '${text}')
          .then((res) {
        isSubmittingBugReport(false);
        if (res.body != null) {
          if (res.body['status'] == true) {
            Get.back();
            showMessage(text: 'باموفقیت ثبت شد', isSucces: true);
          }
        }
      });
    }
  }

  void submitComment({
    required String comment,
  }) {
    String replyCommentId = selectedCommentForReply.value.id ?? '';
    if (authController!.isLogin.isTrue) {
      if (isSubmmitingComment.isFalse) {
        if (comment.trim().length > 3) {
          isSubmmitingComment(true);
          ApiProvider()
              .submitComment(
                  post_id: '${selectedFilm.value.id}',
                  content_comment: comment,
                  reply_comment_id: replyCommentId)
              .then((res) {
            txtComment!.clear();
            isSubmmitingComment(false);
            if (res.body != null) {
              if (res.body['status'] == true) {
                showMessage(text: 'نظر شما با موفقیت ثبت شد و پس از تایید نمایش داده میشود.', isSucces: true);
                getNewData();
              }
            }
          });
        } else {
          showMessage(text: 'لطفا متن را وارد نمایید', isSucces: false);
        }
      }
    } else {
      showMessage(text: 'لطفا وارد شوید', isSucces: false);
    }
  }

  void getDepartments() {
    if (authController!.isLogin.value) {
      departments.clear();
      loadingDepartments(true);
      ApiProvider().reportDepartments().then((value) {
        if (value.isOk) {
          if (value.body["status"] == true) {
            (value.body["result"] as List).forEach((element) {
              departments.add(DepartmentModel.fromJson(element));
            });
          } else {
            showMessage(text: value.body["message"], isSucces: false);
          }
        }
        loadingDepartments(false);
      });
    }
  }

  void setNewurlTrailer() {
    isLoadingTrailer(true);
    trailerController = null;
    trailerController = VideoPlayerController.networkUrl(
        Uri.parse('${selectedFilm.value.trailer_url}'))
      ..initialize().then((value) {
        isLoadingTrailer(false);
        trailerController?.addListener(() {
          trailerPosition(
              trailerController?.value.position.inSeconds.toDouble());
          isPlayingTrailer(trailerController!.value.isPlaying);
          if (trailerController?.value.position ==
              trailerController?.value.duration) {
            isPlayingTrailer(false);
            trailerController?.seekTo(Duration.zero);
          }
        });
      });
  }

  void getNewData() {
    movieLikeStatus(LikeAction.notSelected);
    isLoadingNewData(true);
    if (selectedFilm.value.trailer_url != '' &&
        selectedFilm.value.trailer_url != null) {
      setNewurlTrailer();
      isPlayingTrailer(false);
      isLoadingTrailer(true);
    }
    ApiProvider()
        .getMovieDetail(
            id: '${selectedFilm.value.id}',
            isLogin: authController!.isLogin.value)
        .then((res) {
      isLoadingNewData(false);
      if (res.body != null) {
        selectedFilm(FilmModel.fromJson(res.body['result']));
        setNewurlTrailer();
        isTextExpandedMovieDetail(false);
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
