import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieItemDialogWidget extends StatelessWidget {
  const MovieItemDialogWidget(
      {this.quality,
      this.movieType = MovieType.None,
      this.subtitleType,
      this.encoder,
      this.movieSize,
      this.margin,
      this.width,
      this.onDownloadTap,
      this.onPlayTap,
      this.seriesCount = 0,
      this.isSerial = false,
      this.hasOnlinePlay = true,
      super.key});

  final String? quality;
  final int? seriesCount;
  final MovieType? movieType;
  final SubtitleType? subtitleType;
  final String? encoder;
  final String? movieSize;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final Function()? onDownloadTap;
  final Function()? onPlayTap;
  final bool? isSerial;
  final bool? hasOnlinePlay;

  @override
  Widget build(BuildContext context) {
    double borderRadius = 5;
    Color cEntryText = Color.fromARGB(255, 233, 233, 233).withOpacity(.8);
    return Container(
        margin:
            isSerial! ? EdgeInsets.zero : EdgeInsets.symmetric(vertical: 10),
        width: Get.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: cGrey,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          children: [
            //! keifiat
            Row(
              textDirection: TextDirection.rtl,
              children: [
                MyText(
                  text: 'کیفیت :',
                  fontWeight: FontWeight.w500,
                  size: 15,
                  shadows: [bsText],
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: MyText(
                  text: '$quality',
                  textDirection: TextDirection.ltr,
                  color: cEntryText,
                  size: 14,
                ))
              ],
            ),
            //! noskhe hajm
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Container(
                  width: Get.width * .3 - 10,
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      MyText(
                        text: 'نسخه : ',
                        fontWeight: FontWeight.w500,
                        size: 15,
                        shadows: [bsText],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                          width: 50,
                          child: MyText(
                            text: 'اصلی',
                            color: cEntryText,
                            size: 14,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                MyText(
                  text: 'حجم : ',
                  fontWeight: FontWeight.w500,
                  size: 15,
                  shadows: [bsText],
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: MyText(
                  textDirection: TextDirection.ltr,
                  color: cEntryText,
                  text: '$movieSize',
                  size: 14,
                ))
              ],
            ),
            //! encoder - tedad qesmat
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Container(
                  width: isSerial == true ? Get.width * .3 - 10 : null,
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      MyText(
                        text: 'انکدر : ',
                        fontWeight: FontWeight.w500,
                        size: 15,
                        shadows: [bsText],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MyText(
                        text: '$encoder',
                        color: cEntryText,
                        size: 14,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                isSerial == false
                    ? SizedBox()
                    : MyText(
                        text: 'تعداد قسمت ها: ',
                        fontWeight: FontWeight.w500,
                        size: 15,
                        shadows: [bsText],
                      ),
                isSerial == false
                    ? SizedBox()
                    : SizedBox(
                        width: 5,
                      ),
                isSerial == false
                    ? SizedBox()
                    : Expanded(
                        child: MyText(
                        textDirection: TextDirection.rtl,
                        text: '$seriesCount قسمت',
                        color: cEntryText,
                        size: 14,
                      ))
              ],
            ),
            movieType == MovieType.Subtitle
                ? Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      MyText(
                        text: 'نوع زیرنویس : ',
                        fontWeight: FontWeight.w500,
                        size: 15,
                        shadows: [bsText],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: MyText(
                        textDirection: TextDirection.ltr,
                        text: switch (subtitleType) {
                          SubtitleType.HardSub => 'هارد ساب',
                          SubtitleType.SoftSub => 'سافت ساب',
                          null => '',
                        },
                        color: cEntryText,
                        size: 14,
                      ))
                    ],
                  )
                : SizedBox(),
            SizedBox(
              height: movieType == MovieType.Subtitle ? 5 : 0,
            ),
            SizedBox(
              height: 10,
            ),
            //! Button
            isSerial == true
                ?
                //! Serial
                Column(
                    children: [
                      Container(
                        height: 40,
                        width: Get.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: switch (movieType) {
                              MovieType.Subtitle => cSecondaryLight,
                              MovieType.Dubbed => cR,
                              MovieType.None => cY,
                              MovieType.Cam => cGreyLight,
                              null => null,
                            },
                            borderRadius: BorderRadius.circular(5)),
                        child: MyText(
                          text: 'لینک‌ها',
                          color: cW,
                          size: 15,
                          fontWeight: FontWeight.w500,
                          shadows: [bsText],
                        ),
                      ),
                      SizedBox(
                        height: hasOnlinePlay == false ? 0 : 5,
                      ),
                      hasOnlinePlay == false
                          ? SizedBox()
                          : Container(
                              padding: EdgeInsets.symmetric(vertical: 2),
                              width: Get.width,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xff212529),
                                  borderRadius: BorderRadius.circular(5)),
                              child: MyText(
                                text: 'دارای پخش آنلاین',
                                color: cW,
                                size: 13,
                                fontWeight: FontWeight.w500,
                                shadows: [bsTextLowOpacity],
                              ),
                            ),
                    ],
                  )
                :
                //! Movie
                Container(
                    width: width,
                    height: 40,
                    // margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: cPrimary,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        hasOnlinePlay != true
                            ? SizedBox()
                            : Expanded(
                                flex: 3,
                                child: GestureDetector(
                                  onTap: onPlayTap,
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: switch (movieType) {
                                          MovieType.Subtitle => cSecondaryLight,
                                          MovieType.Dubbed => cR,
                                          MovieType.None => cY,
                                          MovieType.Cam => cGreyLight,
                                          null => null,
                                        },
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5),
                                            bottomRight: Radius.circular(5))),
                                    child: Icon(
                                      Icons.play_circle_outline_rounded,
                                      shadows: [bsTextLowOpacity],
                                      color: switch (movieType) {
                                        MovieType.Subtitle => cW,
                                        MovieType.Dubbed => cW,
                                        MovieType.None => cB,
                                        MovieType.Cam => cB,
                                        null => null,
                                      },
                                    ),
                                  ),
                                ),
                              ),
                        Expanded(
                            flex: hasOnlinePlay == true ? 8 : 1,
                            child: GestureDetector(
                              onTap: onDownloadTap,
                              child: Container(
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Icon(
                                      Icons.download_rounded,
                                      color: cW,
                                      shadows: [bsTextLowOpacity],
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    MyText(
                                      text: 'دانلود',
                                      shadows: [bsTextLowOpacity],
                                      size: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
                  )
          ],
        ));
  }
}
