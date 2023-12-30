import 'package:accordion/accordion.dart';
import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
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
                                  text: 'لینک دانلود سریال $title',
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
              SizedBox(
                height: 20,
              ),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  MyText(text: 'فصل یک'),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 1,
                    color: cStrokeGrey,
                  )),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Accordion(
                    headerBorderColor: cB,
                    headerBorderColorOpened: Colors.transparent,
                    headerBackgroundColorOpened: Colors.transparent,
                    contentBackgroundColor: cPrimary,
                    contentBorderColor: Colors.transparent,
                    contentBorderRadius: 15,
                    headerBorderRadius: 15,
                    headerBackgroundColor: cPrimary,
                    contentHorizontalPadding: 0,
                    contentBorderWidth: 0,
                    contentVerticalPadding: 0,
                    scaleWhenAnimating: true,
                    openAndCloseAnimation: true,
                    headerPadding: EdgeInsets.zero,
                    disableScrolling: true,
                    children: List.generate(
                      2,
                      (index) => AccordionSection(
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
                          partsCount: '8',
                          quality: Quality.FHD,
                          subtitleType: SubtitleType.HardSub,
                        ),
                        content: Container(
                          margin: EdgeInsets.only(top: 5),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          width: Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(color: cStrokeGrey),
                            color: cB,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Wrap(
                              spacing: 10,
                              textDirection: TextDirection.rtl,
                              alignment: WrapAlignment.start,
                              direction: Axis.horizontal,
                              children: List.generate(
                                  13,
                                  (index) => MyTextButton(
                                      size: Size(80, 40),
                                      bgColor: cPrimary,
                                      onTap: () {},
                                      child: MyText(
                                        text: 'قسمت ${index + 1}',
                                        size: 12,
                                      )))),
                        ),
                      ),
                    )),
              ))
            ],
          ),
        ));
  }
}
