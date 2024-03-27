import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/download_manager_controller.dart';
import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/controller/player_controller.dart';
import 'package:bamabin/models/film_model.dart';
import 'package:bamabin/screens/dialogs/download_method_dialog.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/dialog_items/movie_item_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/utils.dart';
import '../../widgets/download_section_widget.dart';

class DownloadMovieDialog extends StatelessWidget {
  const DownloadMovieDialog({required this.film, super.key});
  final FilmModel film;

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
        backgroundColor: cPrimary,
        child: Container(
          color: cPrimary,
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  SizedBox(
                    width: 50,
                    height: 40,
                    child: IconButton(
                        splashRadius: 10,
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.cancel,
                          color: cR,
                        )),
                  ),
                  Expanded(
                    child: Container(
                      constraints: BoxConstraints(minHeight: 40),
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                          top: 5, right: 10, left: 10, bottom: 5),
                      decoration: BoxDecoration(
                          color: cSecondaryLight,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          )),
                      child: Row(textDirection: TextDirection.rtl, children: [
                        Icon(
                          Icons.download_rounded,
                          color: cW,
                          shadows: [bsText],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Center(
                            child: MyText(
                              textDirection: TextDirection.rtl,
                              text: 'لینک ${film.title}',
                              color: cW,
                              shadows: [bsText],
                              size: 15,
                              maxLines: 2,
                              textOverflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  )
                ],
              ),
              Expanded(
                  child: ListView(
                      physics: BouncingScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                      children: generateList()))
            ],
          ),
        ));
  }

  bool checkIsVip() {
    final auth = Get.find<AuthController>();
    bool a = auth.paymentController.isVip.value;
    if (a) {
      return true;
    } else {
      if (auth.isLogin.value) {
        Get.toNamed('/subscribe');
      } else {
        Get.toNamed('/signin');
      }
      return false;
    }
  }

  List<Widget> generateList() {
    // final downloadManagerController = Get.find<DownloadManagerController>();
    final videoController = Get.find<PlayerController>();
    List<Widget> a = [];
    //!  Subtitles
    if (film.moviesDlbox?.subtitle != null &&
        film.moviesDlbox?.subtitle != []) {
      a.add(
        downloadSectionWidget(
          icon: Icons.closed_caption,
          color: cSecondaryLight,
          title: 'نسخه زیرنویس چسبیده',
        ),
      );
      film.moviesDlbox!.subtitle!.forEach((item) {
        // print(item.size);
        a.add(
          MovieItemDialogWidget(
            hasOnlinePlay: item.playStatus == 'on',
            quality: item.originalQuality ?? '',
            movieType: MovieType.Subtitle,
            subtitleType: item.subtitleType == 'soft'
                ? SubtitleType.SoftSub
                : SubtitleType.HardSub,
            margin: EdgeInsets.symmetric(vertical: 5),
            encoder: item.encoder ?? '',
            movieSize: computeTheCapacity(size: item.size!),
            onPlayTap: () {
              if (checkIsVip()) {
                Get.toNamed('/player');
                videoController.selectedDlBoxItem(item);
                videoController.is_dubbed(false);
                videoController.selectedMovieType(MovieType.Subtitle);
              }
            },
            onDownloadTap: () {
              if (checkIsVip()) {
                showDialog(
                  barrierColor: cBgDialogColor,
                  context: Get.context!,
                  builder: (context) {
                    return DownloadMethodDialog(
                      dlboxItem: item,
                    );
                  },
                );
                // downloadManagerController.download(
                //     goingToDownloadPage: true, dlBox: item);
              }
            },
          ),
        );
      });
    }
    //! Noskhe Kham
    if (film.moviesDlbox?.native != null && film.moviesDlbox?.native != []) {
      a.add(
        downloadSectionWidget(
          icon: Icons.local_movies_rounded,
          color: cY,
          title: 'نسخه خام',
        ),
      );
      film.moviesDlbox!.native!.forEach((item) {
        // print(item.size);
        a.add(
          MovieItemDialogWidget(
            onDownloadTap: () {
              if (checkIsVip()) {
                showDialog(
                  barrierColor: cBgDialogColor,
                  context: Get.context!,
                  builder: (context) {
                    return DownloadMethodDialog(
                      dlboxItem: item,
                    );
                  },
                );
                // downloadManagerController.download(
                //     goingToDownloadPage: true, dlBox: item);
              }
            },
            onPlayTap: () {
              if (checkIsVip()) {
                Get.toNamed('/player');
                videoController.selectedDlBoxItem(item);
                videoController.is_dubbed(false);
                videoController.selectedMovieType(MovieType.None);
              }
            },
            hasOnlinePlay: item.playStatus == 'on',
            quality: item.originalQuality ?? '',
            movieType: MovieType.None,
            margin: EdgeInsets.symmetric(vertical: 5),
            encoder: item.encoder ?? '',
            movieSize: computeTheCapacity(size: item.size!),
          ),
        );
      });
    }

    //! cam
    if (film.moviesDlbox?.screen != null && film.moviesDlbox?.screen != []) {
      a.add(
        downloadSectionWidget(
          icon: Icons.movie_creation_rounded,
          color: cGreyLight,
          title: 'نسخه روی پرده',
        ),
      );
      film.moviesDlbox!.screen!.forEach((item) {
        // print(item.size);
        a.add(
          MovieItemDialogWidget(
            onDownloadTap: () {
              if (checkIsVip()) {
                showDialog(
                  barrierColor: cBgDialogColor,
                  context: Get.context!,
                  builder: (context) {
                    return DownloadMethodDialog(
                      dlboxItem: item,
                    );
                  },
                );
                // downloadManagerController.download(
                //     goingToDownloadPage: true, dlBox: item);
              }
            },
            onPlayTap: () {
              if (checkIsVip()) {
                Get.toNamed('/player');
                videoController.selectedDlBoxItem(item);
                videoController.is_dubbed(false);
                videoController.selectedMovieType(MovieType.Cam);
              }
            },
            hasOnlinePlay: item.playStatus == 'on',
            quality: item.originalQuality ?? '',
            movieType: MovieType.Cam,
            margin: EdgeInsets.symmetric(vertical: 5),
            encoder: item.encoder ?? '',
            movieSize: computeTheCapacity(size: item.size!),
          ),
        );
      });
    }
    //! dubbed
    if (film.moviesDlbox?.dubbed != null && film.moviesDlbox?.dubbed != []) {
      a.add(
        downloadSectionWidget(
          icon: Icons.mic,
          color: cR,
          title: 'نسخه دوبله فارسی',
        ),
      );
      film.moviesDlbox!.dubbed!.forEach((item) {
        // print(item.size);
        a.add(
          MovieItemDialogWidget(
            onDownloadTap: () {
              if (checkIsVip()) {
                showDialog(
                  barrierColor: cBgDialogColor,
                  context: Get.context!,
                  builder: (context) {
                    return DownloadMethodDialog(
                      dlboxItem: item,
                    );
                  },
                );
                // downloadManagerController.download(
                //     goingToDownloadPage: true, dlBox: item);
              }
            },
            onPlayTap: () {
              if (checkIsVip()) {
                Get.toNamed('/player');
                videoController.selectedDlBoxItem(item);
                videoController.is_dubbed(true);
                videoController.selectedMovieType(MovieType.Dubbed);
              }
            },
            hasOnlinePlay: item.playStatus == 'on',
            quality: item.originalQuality ?? '',
            movieType: MovieType.Dubbed,
            margin: EdgeInsets.symmetric(vertical: 5),
            encoder: item.encoder ?? '',
            movieSize: computeTheCapacity(size: item.size!),
          ),
        );
      });
    }
    return a;
  }
}
