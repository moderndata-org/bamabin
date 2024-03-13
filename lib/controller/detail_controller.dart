import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/controller/player_controller.dart';
import 'package:bamabin/models/dlbox_item_model.dart';
import 'package:bamabin/models/film_model.dart';
import 'package:chewie/chewie.dart';
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
  // VideoPlayerController? trailerController;
  VideoPlayerController? trailerController;
  ChewieController? trailerControllerChieview;
  AuthController? authController;
  RxList<DepartmentModel> departments = <DepartmentModel>[].obs;
  RxBool loadingDepartments = false.obs;
  RxBool showTrailer = false.obs;
  Rx<DepartmentModel> selectedDepartment = DepartmentModel().obs;
  Rx<CommentModel> selectedCommentForReply = CommentModel().obs;
  FocusNode txtCommentFocus = FocusNode();

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
                showMessage(
                    text:
                        'نظر شما با موفقیت ثبت شد و پس از تایید نمایش داده میشود.',
                    isSucces: true);
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

  void playMovieOrSerial() {
    final playerController = Get.find<PlayerController>();
    if (selectedFilm.value.type == 'movies') {
      if (selectedFilm.value.moviesDlbox?.subtitle != null ||
          selectedFilm.value.moviesDlbox?.subtitle != []) {
        bool has720 = false;
        bool has480 = false;
        DlboxItem p720 = DlboxItem();
        DlboxItem p480 = DlboxItem();
        selectedFilm.value.moviesDlbox?.subtitle!.forEach((sub) {
          if (sub.qualityCode == '720p') {
            has720 = true;
            p720 = sub;
          }
          if (sub.qualityCode == '480p') {
            has480 = true;
            p480 = sub;
          }
        });
        if (has720) {
          // print('will play 720');
          playerController.selectedDlBoxItem(p720);
          Get.toNamed('/player');
        } else if (has480) {
          // print('will play 480');
          playerController.selectedDlBoxItem(p480);
          Get.toNamed('/player');
        }
      } else if (selectedFilm.value.moviesDlbox?.dubbed != null ||
          selectedFilm.value.moviesDlbox?.dubbed != []) {
        bool has720 = false;
        bool has480 = false;
        DlboxItem p720 = DlboxItem();
        DlboxItem p480 = DlboxItem();
        selectedFilm.value.moviesDlbox?.dubbed!.forEach((sub) {
          if (sub.qualityCode == '720p') {
            has720 = true;
            p720 = sub;
          }
          if (sub.qualityCode == '480p') {
            has480 = true;
            p480 = sub;
          }
        });
        if (has720) {
          // print('will play 720');
          playerController.selectedDlBoxItem(p720);
          Get.toNamed('/player');
        } else if (has480) {
          // print('will play 480');
          playerController.selectedDlBoxItem(p480);
          Get.toNamed('/player');
        }
      }
    }
    if (selectedFilm.value.type == 'series') {
      playerController.showSeriesBox(serial: selectedFilm.value.seriesDlbox);
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
    showTrailer(false);
    // trailerController = null;
    // trailerControllerTest = null;
    bool isInitialize = false;
    if (GetUtils.isURL('${selectedFilm.value.trailer_url}')) {
      trailerController = VideoPlayerController.networkUrl(
          Uri.parse('${selectedFilm.value.trailer_url}'),
          videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true))
        ..initialize().then((value) async {
          // print('oopsssssssssss Before ');
          trailerControllerChieview = await ChewieController(
              videoPlayerController: trailerController!,
              materialProgressColors: ChewieProgressColors(
                  handleColor: Colors.white,
                  bufferedColor: Colors.white.withOpacity(.3),
                  backgroundColor: Colors.white.withOpacity(.1),
                  playedColor: Colors.white.withOpacity(.7)),
              autoInitialize: true,
              autoPlay: false,
              allowFullScreen: false,
              fullScreenByDefault: false,
              allowMuting: false,
              cupertinoProgressColors: ChewieProgressColors(
                  backgroundColor: Colors.white.withOpacity(.3),
                  playedColor: Colors.white),
              showOptions: false,
              aspectRatio: Get.width / 200,
              looping: false,
              showControlsOnInitialize: true,
              showControls: true,
              hideControlsTimer: Duration(seconds: 2));
        });
      trailerController!.addListener(() {
        // if (trailerControllerChieview
        //         ?.videoPlayerController.value.hasError ==
        //     true) {
        //   print('shit');
        // }
        // if(trailerController.value.errorDescription !=null){

        // }
        if (trailerController!.value.hasError) {
          print('catch it');
          showTrailer(false);
          isLoadingTrailer(false);
          selectedFilm.value.trailer_url = '';
          selectedFilm.refresh();
          trailerControllerChieview = null;
        } else {
          print('catch iss');
          showTrailer(true);
          isLoadingTrailer(false);
        }
      });
    } else {
      isLoadingTrailer(false);
      showTrailer(false);
    }
    //! When url is currupt or is filter
    // if (isInitialize) {
    //   trailerController!.addListener(() {
    //     if (trailerController!.value.hasError) {
    //       // print('catch it');
    //       selectedFilm.value.trailer_url = '';
    //       selectedFilm.refresh();
    //       trailerControllerChieview = null;
    //     } else {
    //       showTrailer(true);
    //     }
    //   });
    // } else {
    //   selectedFilm.value.trailer_url = null;
    //   selectedFilm.refresh();
    //   trailerControllerChieview = null;
    // }

    print('isInitialize : $isInitialize');
  }

  void getNewData() {
    movieLikeStatus(LikeAction.notSelected);
    isLoadingNewData(true);
    ApiProvider()
        .getMovieDetail(
            id: '${selectedFilm.value.id}',
            isLogin: authController!.isLogin.value)
        .then((res) {
      isLoadingNewData(false);
      if (res.body != null) {
        selectedFilm(FilmModel.fromJson(res.body['result']));
        print(selectedFilm.value.trailer_url);
        setNewurlTrailer();
        isTextExpandedMovieDetail(false);
      }
    });
  }

  @override
  void onInit() {
    txtComment = TextEditingController();
    movieDetailScrollController.addListener(() {
      if (txtCommentFocus.hasFocus ==
          false) if (movieDetailScrollController.offset > Get.height / 5) {
        showGoToTop(true);
      } else {
        showGoToTop(false);
      }
    });
    super.onInit();
  }
}
