import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/player_controller.dart';
import 'package:bamabin/models/film_model.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/dialog_items/movie_item_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../constant/utils.dart';

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
              SizedBox(
                height: 40,
                width: Get.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                        top: 0,
                        right: 7,
                        child: IconButton(
                            splashRadius: 10,
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.cancel,
                              color: cR,
                            ))),
                    Positioned(
                      top: 0,
                      child: ClipRRect(
                        child: Container(
                          height: 40,
                          width: Get.width * .7,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                              top: 5, right: 10, left: 10, bottom: 5),
                          decoration: BoxDecoration(
                              color: cSecondaryLight,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              )),
                          child:
                              Row(textDirection: TextDirection.rtl, children: [
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
                                  text: 'لینک  ${film.title}',
                                  color: cW,
                                  shadows: [bsText],
                                  size: 15,
                                  textOverflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                children: generateList() +
                    [
                      // MovieItemDialogWidget(
                      //   quality: Quality.HD,
                      //   movieType: MovieType.None,
                      //   margin: EdgeInsets.symmetric(vertical: 5),
                      //   encoder: 'e',
                      //   movieSize: '4 Gb',
                      // ),
                      // Row(
                      //   textDirection: TextDirection.rtl,
                      //   children: [
                      //     Icon(
                      //       Icons.mic,
                      //       color: cR,
                      //     ),
                      //     SizedBox(
                      //       width: 5,
                      //     ),
                      //     MyText(
                      //       text: 'نسخه دوبله فارسی',
                      //       shadows: [bsText],
                      //       fontWeight: FontWeight.w500,
                      //       size: 15,
                      //     ),
                      //     SizedBox(
                      //       width: 5,
                      //     ),
                      //     Expanded(
                      //         child: Container(
                      //       height: 1,
                      //       color: cR,
                      //     ))
                      //   ],
                      // ),
                      // MovieItemDialogWidget(
                      //   onTap: () => Get.toNamed('/player'),
                      //   quality: Quality.FourK,
                      //   movieType: MovieType.Dubbed,
                      //   margin: EdgeInsets.symmetric(vertical: 5),
                      //   encoder: 'e',
                      //   movieSize: '4 Gb',
                      // ),
                      // Row(
                      //   textDirection: TextDirection.rtl,
                      //   children: [
                      //     Icon(
                      //       Icons.movie_creation_rounded,
                      //       color: cGreyLight,
                      //     ),
                      //     SizedBox(
                      //       width: 5,
                      //     ),
                      //     MyText(
                      //       text: 'نسخه روی پرده',
                      //       shadows: [bsText],
                      //       fontWeight: FontWeight.w500,
                      //       size: 15,
                      //     ),
                      //     SizedBox(
                      //       width: 5,
                      //     ),
                      //     Expanded(
                      //         child: Container(
                      //       height: 1,
                      //       color: cGreyLight,
                      //     ))
                      //   ],
                      // ),
                      // MovieItemDialogWidget(
                      //   quality: Quality.Cam,
                      //   movieType: MovieType.Cam,
                      //   margin: EdgeInsets.symmetric(vertical: 5),
                      //   encoder: 'e',
                      //   movieSize: '4 Gb',
                      // ),
                    ],
              ))
            ],
          ),
        ));
  }

  List<Widget> generateList() {
    print('film.moviesDlbox?.dubbed');
    print(film.moviesDlbox?.dubbed);
    print('film.moviesDlbox?.native');
    print(film.moviesDlbox?.native);
    print('film.moviesDlbox?.screen');
    print(film.moviesDlbox?.screen);
    print('film.moviesDlbox?.subtitle');
    print(film.moviesDlbox?.subtitle);
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
              Get.toNamed('/player');
              Get.find<PlayerController>().selectedDlBoxItem(item);
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
            onPlayTap: () {
              Get.toNamed('/player');
              Get.find<PlayerController>().selectedDlBoxItem(item);
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
          icon: Icons.local_movies_rounded,
          color: cGreyLight,
          title: 'نسخه روی پرده',
        ),
      );
      film.moviesDlbox!.screen!.forEach((item) {
        // print(item.size);
        a.add(
          MovieItemDialogWidget(
            onPlayTap: () {
              Get.toNamed('/player');
              Get.find<PlayerController>().selectedDlBoxItem(item);
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
          icon: Icons.local_movies_rounded,
          color: cR,
          title: 'نسخه دوبله فارسی',
        ),
      );
      film.moviesDlbox!.dubbed!.forEach((item) {
        // print(item.size);
        a.add(
          MovieItemDialogWidget(
            onPlayTap: () {
              Get.toNamed('/player');
              Get.find<PlayerController>().selectedDlBoxItem(item);
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

class downloadSectionWidget extends StatelessWidget {
  const downloadSectionWidget({
    required this.icon,
    required this.title,
    required this.color,
    super.key,
  });
  final IconData icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Icon(
          icon,
          color: color,
        ),
        SizedBox(
          width: 5,
        ),
        MyText(
          text: title,
          shadows: [bsText],
          fontWeight: FontWeight.w500,
          size: 15,
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
            child: Container(
          height: 1,
          color: color,
        ))
      ],
    );
  }
}
