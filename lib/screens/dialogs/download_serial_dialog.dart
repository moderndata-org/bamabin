import 'package:accordion/accordion.dart';
import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/dialog_items/movie_item_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DownloadSerialDialog extends GetView<PublicController> {
  const DownloadSerialDialog(
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
                                  shadows: [bsText],
                                  textDirection: TextDirection.rtl,
                                  text: actionMethod == ActionMethod.Download
                                      ? 'لینک دانلود سریال $title'
                                      : 'پخش سریال $title',
                                  color: cW,
                                  fontWeight: FontWeight.w500,
                                  size: 15,
                                ),
                              ]),
                        ),
                      ),
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
                          headerPadding: EdgeInsets.zero,
                          disableScrolling: true,
                          children: List.generate(
                            5,
                            (index) => AccordionSection(
                              isOpen: false,
                              rightIcon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: cW,
                                shadows: [bsText],
                              ),
                              header: Container(
                                  padding: EdgeInsets.only(right: 10),
                                  alignment: Alignment.centerRight,
                                  height: 45,
                                  child: MyText(
                                    text: 'فصل ${index + 1}',
                                    size: 15,
                                    shadows: [bsText],
                                  )),
                              headerBackgroundColorOpened: cSecondary,
                              content: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                width: Get.width,
                                decoration: BoxDecoration(
                                  border: Border.all(color: cGrey, width: 2),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5)),
                                ),
                                child: Column(
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
                                    Accordion(
                                        headerBorderColor: cB,
                                        headerBorderColorOpened:
                                            Colors.transparent,
                                        headerBackgroundColorOpened:
                                            Colors.transparent,
                                        contentBackgroundColor: cPrimary,
                                        contentBorderColor: Colors.transparent,
                                        contentBorderRadius: 5,
                                        headerBorderRadius: 5,
                                        headerBackgroundColor: cPrimary,
                                        contentHorizontalPadding: 0,
                                        contentBorderWidth: 0,
                                        contentVerticalPadding: 0,
                                        scaleWhenAnimating: true,
                                        openAndCloseAnimation: true,
                                        headerPadding: EdgeInsets.zero,
                                        disableScrolling: true,
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
                                              encoder: 'YIFY',
                                              movieSize: '5GB',
                                              movieType: MovieType.Subtitle,
                                              quality: Quality.FHD,
                                              subtitleType:
                                                  SubtitleType.HardSub,
                                            ),
                                            content: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 10),
                                              width: Get.width,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: cGrey, width: 2),
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5)),
                                              ),
                                              child: Column(
                                                  children: List.generate(
                                                      13,
                                                      (index) => index % 2 != 0
                                                          ? SizedBox()
                                                          : Row(
                                                              textDirection:
                                                                  TextDirection
                                                                      .rtl,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      DownloadButtonDialog(
                                                                    title:
                                                                        'قسمت ${index + 1}',
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                index > 13 - 2
                                                                    ? Spacer()
                                                                    : Expanded(
                                                                        child:
                                                                            DownloadButtonDialog(
                                                                          title:
                                                                              'قسمت ${index + 2}',
                                                                        ),
                                                                      ),
                                                              ],
                                                            ))),
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class DownloadButtonDialog extends StatelessWidget {
  const DownloadButtonDialog({
    this.title,
    super.key,
  });
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      decoration:
          BoxDecoration(color: cGrey, borderRadius: BorderRadius.circular(5)),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: cSecondaryLight,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child: Icon(
                Icons.play_circle_outline_rounded,
                shadows: [bsTextLowOpacity],
                color: cW,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
              flex: 8,
              child: Center(
                child: MyText(
                  text: '$title',
                  shadows: [bsTextLowOpacity],
                  size: 14,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      ),
    );
  }
}
