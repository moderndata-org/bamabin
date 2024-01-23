import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/dialog_items/movie_item_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DownloadMovieDialog extends GetView<PublicController> {
  const DownloadMovieDialog(
      {this.title,
      this.isSerial,
      this.actionMethod = ActionMethod.Download,
      super.key});
  final String? title;
  final ActionMethod? actionMethod;
  final bool? isSerial;

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
                          child: Wrap(
                              textDirection: TextDirection.rtl,
                              alignment: WrapAlignment.center,
                              direction: Axis.vertical,
                              children: [
                                Icon(
                                  actionMethod == ActionMethod.Play
                                      ? Icons.play_arrow_rounded
                                      : Icons.download_rounded,
                                  color: cW,
                                  shadows: [bsText],
                                ),
                                MyText(
                                  textDirection: TextDirection.rtl,
                                  text:
                                      //! Download Selected
                                      actionMethod == ActionMethod.Download
                                          ? isSerial == true
                                              ? 'لینک دانلود سریال $title'
                                              : 'لینک دانلود فیلم $title'
                                          :
                                          //! Play Selected
                                          isSerial == true
                                              ? 'پخش سریال $title'
                                              : 'پخش فیلم $title',
                                  color: cW,
                                  shadows: [bsText],
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
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                children: [
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(
                        Icons.closed_caption,
                        color: cSecondaryLight,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MyText(
                        text: 'نسخه زیرنویس چسبیده',
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
                        color: cSecondaryLight,
                      ))
                    ],
                  ),
                  MovieItemDialogWidget(
                    quality: Quality.FHD,
                    movieType: MovieType.Subtitle,
                    subtitleType: SubtitleType.HardSub,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    encoder: 'e',
                    movieSize: '4 Gb',
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(
                        Icons.local_movies_rounded,
                        color: cY,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MyText(
                        text: 'نسخه خام',
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
                        color: cY,
                      ))
                    ],
                  ),
                  MovieItemDialogWidget(
                    quality: Quality.HD,
                    movieType: MovieType.None,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    encoder: 'e',
                    movieSize: '4 Gb',
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(
                        Icons.mic,
                        color: cR,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MyText(
                        text: 'نسخه دوبله فارسی',
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
                        color: cR,
                      ))
                    ],
                  ),
                  MovieItemDialogWidget(
                    onTap: () => Get.toNamed('/player'),
                    quality: Quality.FourK,
                    movieType: MovieType.Dubbed,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    encoder: 'e',
                    movieSize: '4 Gb',
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(
                        Icons.movie_creation_rounded,
                        color: cGreyLight,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MyText(
                        text: 'نسخه روی پرده',
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
                        color: cGreyLight,
                      ))
                    ],
                  ),
                  MovieItemDialogWidget(
                    quality: Quality.Cam,
                    movieType: MovieType.Cam,
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
