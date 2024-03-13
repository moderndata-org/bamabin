import 'package:accordion/accordion.dart';
import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/detail_controller.dart';
import 'package:bamabin/controller/download_manager_controller.dart';
import 'package:bamabin/models/dlbox_item_model.dart';
import 'package:bamabin/models/series_dlbox_model.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/dialog_items/movie_item_dialog_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../constant/utils.dart';
import '../../controller/player_controller.dart';
import '../../models/film_model.dart';
import '../../widgets/download_section_widget.dart';

class DownloadSerialDialog extends GetView<DetailController> {
  const DownloadSerialDialog({this.listSeries, super.key});
  final List<SeriesModel>? listSeries;

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
                width: Get.width,
                child: Row(
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
                                shadows: [bsText],
                                textDirection: TextDirection.rtl,
                                text:
                                    'لینک ${controller.selectedFilm.value.title}',
                                color: cW,
                                fontWeight: FontWeight.w900,
                                maxLines: 2,
                                textOverflow: TextOverflow.ellipsis,
                                size: 15,
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
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Directionality(
                        textDirection: TextDirection.rtl,
                        child: Accordion(
                            headerBorderColor: cB,
                            headerBorderColorOpened: Colors.transparent,
                            headerBackgroundColorOpened: Colors.transparent,
                            contentBackgroundColor: cPrimary,
                            contentBorderColor: Colors.transparent,
                            contentBorderRadius: 5,
                            headerBorderRadius: 5,
                            headerBackgroundColor: cSecondary,
                            flipLeftIconIfOpen: true,
                            contentHorizontalPadding: 0,
                            contentBorderWidth: 0,
                            contentVerticalPadding: 0,
                            scaleWhenAnimating: true,
                            openAndCloseAnimation: true,
                            maxOpenSections: 20,
                            headerPadding: EdgeInsets.zero,
                            disableScrolling: true,
                            children: generateList())),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  List<AccordionSection> generateList() {
    List<AccordionSection> a = [];
    bool isOpen = true;
    controller.selectedFilm.value.seriesDlbox?.forEach((series) {
      a.add(AccordionSection(
        isOpen: isOpen,
        rightIcon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: cW,
          shadows: [bsText],
        ),
        header: Container(
            padding: EdgeInsets.only(right: 10),
            alignment: Alignment.centerRight,
            height: 50,
            child: MyText(
              text: '${series.info?.seasonName}',
              size: 15,
              shadows: [bsText],
              fontWeight: FontWeight.w700,
            )),
        headerBackgroundColorOpened: cSecondary,
        content: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          width: Get.width,
          decoration: BoxDecoration(
            border: Border.all(color: cSecondary, width: 2),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5)),
          ),
          child: Column(children: generateSeasonList(series: series)),
        ),
      ));
    });
    return a;
  }

  List<Widget> generateSeasonList({required SeriesModel series}) {
    List<Widget> a = [];
    //!  subtitle
    if (series.types?.subtitle != null && series.types?.subtitle != []) {
      a.add(
        downloadSectionWidget(
          icon: Icons.closed_caption,
          color: cSecondaryLight,
          title: 'نسخه زیرنویس چسبیده',
        ),
      );
      series.types?.subtitle?.forEach((item) {
        a.add(
          SerialAccordion(
            item: item,
            type: MovieType.Subtitle,
            color: cSecondaryLight,
          ),
        );
      });
    }
    //! native
    if (series.types?.native != null && series.types?.native != []) {
      a.add(
        downloadSectionWidget(
          icon: Icons.local_movies_rounded,
          color: cY,
          title: 'نسخه خام',
        ),
      );
      series.types?.native?.forEach((item) {
        a.add(
          SerialAccordion(
            item: item,
            type: MovieType.None,
            color: cY,
          ),
        );
      });
    }
    //! screen
    if (series.types?.screen != null && series.types?.screen != []) {
      a.add(
        downloadSectionWidget(
          icon: Icons.movie_creation_rounded,
          color: cY,
          title: 'نسخه روی پرده',
        ),
      );
      series.types?.screen?.forEach((item) {
        a.add(
          SerialAccordion(
            item: item,
            type: MovieType.Cam,
            color: cY,
          ),
        );
      });
    }
    //! dubbed
    if (series.types?.dubbed != null && series.types?.dubbed != []) {
      a.add(
        downloadSectionWidget(
          icon: Icons.mic,
          color: cR,
          title: 'نسخه دوبله فارسی',
        ),
      );
      series.types?.dubbed?.forEach((item) {
        a.add(
          SerialAccordion(
            item: item,
            type: MovieType.Dubbed,
            isDubbed: true,
            color: cR,
          ),
        );
      });
    }
    return a;
  }
}

class SerialAccordion extends StatelessWidget {
  const SerialAccordion(
      {required this.item,
      this.isDubbed,
      required this.color,
      required this.type,
      super.key});
  final SeasonBoxModel item;
  final MovieType type;
  final Color color;
  final bool? isDubbed;
  @override
  Widget build(BuildContext context) {
    return Accordion(
        headerBorderColor: cB,
        headerBorderColorOpened: Colors.transparent,
        headerBackgroundColorOpened: Colors.transparent,
        contentBackgroundColor: cPrimary,
        contentBorderColor: Colors.transparent,
        contentBorderRadius: 5,
        headerBorderRadius: 5,
        headerBackgroundColor: cPrimary,
        paddingBetweenClosedSections: 0,
        paddingBetweenOpenSections: 0,
        paddingListHorizontal: 0,
        paddingListBottom: 5,
        paddingListTop: 5,
        contentBorderWidth: 0,
        contentHorizontalPadding: 0,
        contentVerticalPadding: 0,
        scaleWhenAnimating: true,
        openAndCloseAnimation: true,
        headerPadding: EdgeInsets.zero,
        disableScrolling: true,
        //! dont change this
        children: List.generate(
          1,
          (index) => AccordionSection(
            headerBackgroundColor: cGrey,
            isOpen: false,
            leftIcon: null,
            rightIcon: SizedBox(
              width: 0,
            ),
            header: MovieItemDialogWidget(
              isSerial: true,
              hasOnlinePlay: item.items?[0].playStatus == 'on',
              encoder: '${item.info?.encoder}',
              seriesCount: item.items?.length,
              movieSize: computeTheCapacity(
                  size: item.info?.size == null
                      ? 0
                      : double.parse(
                          (item.info!.size! / item.items!.length).toString())),
              movieType: type,
              quality: '${item.info?.quality}',
              subtitleType: item.info?.subtitleType == 'hard'
                  ? SubtitleType.HardSub
                  : SubtitleType.SoftSub,
            ),
            content: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: Get.width,
              decoration: BoxDecoration(
                border: Border.all(color: cGrey, width: 2),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
              ),
              child: Column(
                  children: item.items == null
                      ? []
                      : List.generate(item.items!.length, (index) {
                          var videoPlayerController =
                              Get.find<PlayerController>();
                          var downloadManagerController =
                              Get.find<DownloadManagerController>();
                          videoPlayerController.is_dubbed(isDubbed == true);
                          DlboxItem dl = item.items![index];
                          DlboxItem dl2 = index > item.items!.length - 2
                              ? DlboxItem()
                              : item.items![index + 1];
                          String part = dl.episode!.replaceAll('E', '');
                          String part2 = dl2.episode == null
                              ? ''
                              : dl2.episode!.replaceAll('E', '');
                          return index % 2 != 0
                              ? SizedBox()
                              : Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Expanded(
                                      child: DownloadButtonDialog(
                                        onPlay: () {
                                          videoPlayerController
                                              .selectedDlBoxItem(dl);
                                          Get.toNamed('/player');
                                        },
                                        onDownload: () {
                                          downloadManagerController.download(
                                              goingToDownloadPage: true,
                                              dlBox: dl);
                                        },
                                        color: color,
                                        title: 'قسمت $part',
                                        hasPlay: dl.playStatus == 'on',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    index > item.items!.length - 2
                                        ? Spacer()
                                        : Expanded(
                                            child: DownloadButtonDialog(
                                              onPlay: () {
                                                videoPlayerController
                                                    .selectedDlBoxItem(dl);
                                                Get.toNamed('/player');
                                              },
                                              onDownload: () {
                                                downloadManagerController
                                                    .download(
                                                        goingToDownloadPage:
                                                            true,
                                                        dlBox: dl2);
                                              },
                                              color: color,
                                              title: 'قسمت $part2',
                                              hasPlay: dl2.playStatus == 'on',
                                            ),
                                          ),
                                  ],
                                );
                        })),
            ),
          ),
        ));
  }
}

class DownloadButtonDialog extends StatelessWidget {
  const DownloadButtonDialog({
    this.title,
    this.onPlay,
    this.onDownload,
    this.hasPlay,
    required this.color,
    super.key,
  });
  final String? title;
  final Color color;
  final Function()? onPlay;
  final Function()? onDownload;
  final bool? hasPlay;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      decoration:
          BoxDecoration(color: cGrey, borderRadius: BorderRadius.circular(5)),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          hasPlay != true
              ? SizedBox()
              : Expanded(
                  flex: 3,
                  child: GestureDetector(
                    onTap: onPlay,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5))),
                      child: Icon(
                        Icons.play_circle_outline_rounded,
                        shadows: [bsTextLowOpacity],
                        color: color == cY || color == cGreyLight ? cB : cW,
                      ),
                    ),
                  ),
                ),
          SizedBox(
            width: hasPlay == true ? 5 : 0,
          ),
          Expanded(
              flex: hasPlay == true ? 8 : 1,
              child: GestureDetector(
                onTap: onDownload,
                child: Container(
                  height: 50,
                  color: Colors.transparent,
                  child: Center(
                    child: MyText(
                      text: '$title',
                      shadows: [bsTextLowOpacity],
                      size: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
