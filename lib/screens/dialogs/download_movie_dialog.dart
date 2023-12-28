import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/dialog_items/movie_item_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DownloadMovieDialog extends GetView<PublicController> {
  const DownloadMovieDialog(
      {this.title, this.actionMethod = ActionMethod.Download, super.key});
  final String? title;
  final ActionMethod? actionMethod;

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
                              color: cY,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              )),
                          child: Wrap(
                              textDirection: TextDirection.rtl,
                              alignment: WrapAlignment.center,
                              direction: Axis.vertical,
                              children: [
                                Icon(
                                  actionMethod == ActionMethod.Play
                                      ? Icons.play_arrow_rounded
                                      : Icons.download_rounded,
                                  color: cB,
                                ),
                                MyText(
                                  textDirection: TextDirection.rtl,
                                  text: 'لینک دانلود فیلم $title',
                                  color: cB,
                                  size: 15,
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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                children: [
                  MovieItemDialogWidget(
                    quality: Quality.FourK,
                    movieType: MovieType.Dubbed,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    encoder: 'e',
                    movieSize: '4 Gb',
                  ),
                  MovieItemDialogWidget(
                    quality: Quality.FHD,
                    movieType: MovieType.Subtitle,
                    subtitleType: SubtitleType.HardSub,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    encoder: 'e',
                    movieSize: '4 Gb',
                  ),
                  MovieItemDialogWidget(
                    quality: Quality.HD,
                    movieType: MovieType.None,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    encoder: 'e',
                    movieSize: '4 Gb',
                  ),
                  MovieItemDialogWidget(
                    quality: Quality.SD,
                    movieType: MovieType.None,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    encoder: 'e',
                    movieSize: '4 Gb',
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}
