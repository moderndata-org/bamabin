import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieItemDialogWidget extends StatelessWidget {
  const MovieItemDialogWidget(
      {this.quality = Quality.FourK,
      this.movieType = MovieType.None,
      this.subtitleType,
      this.encoder,
      this.movieSize,
      this.margin,
      this.width,
      this.onTap,
      this.isSerial = false,
      this.hasOnlinePlay = true,
      super.key});

  final Quality? quality;
  final MovieType? movieType;
  final SubtitleType? subtitleType;
  final String? encoder;
  final String? movieSize;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final Function()? onTap;
  final bool? isSerial;
  final bool? hasOnlinePlay;

  @override
  Widget build(BuildContext context) {
    double borderRadius = 5;
    Color cEntryText = Color.fromARGB(255, 233, 233, 233);
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
            Row(
              textDirection: TextDirection.rtl,
              children: [
                //! Right Side Texts
                Expanded(
                  child: Column(
                    children: [
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
                            text: switch (quality) {
                              Quality.FourK => '4K',
                              Quality.FHD => 'FHD',
                              Quality.HD => 'HD',
                              Quality.SD => 'SD',
                              Quality.Cam => 'Cam',
                              null => '',
                            },
                            textDirection: TextDirection.ltr,
                            color: cEntryText,
                            size: 14,
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
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
                          Expanded(
                              child: MyText(
                            text: 'اصلی',
                            color: cEntryText,
                            size: 14,
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
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
                          Expanded(
                              child: MyText(
                            text: '$encoder',
                            color: cEntryText,
                            size: 14,
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
                //! Left Side Texts
                Expanded(
                  child: Column(
                    children: [
                      isSerial == true
                          ? Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                MyText(
                                  text: 'تعداد قسمت ها: ',
                                  fontWeight: FontWeight.w500,
                                  size: 15,
                                  shadows: [bsText],
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: MyText(
                                    textDirection: TextDirection.rtl,
                                    text: '8 قسمت',
                                    color: cEntryText,
                                    size: 14,
                                  ),
                                ))
                              ],
                            )
                          : SizedBox(),
                      SizedBox(
                        height: isSerial == true ? 5 : 20,
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
                                    SubtitleType.HardSub => 'HardSub',
                                    SubtitleType.SoftSub => 'SoftSub',
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
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
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
                    ],
                  ),
                )
              ],
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
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 50,
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
                        Expanded(
                            flex: 8,
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
                            ))
                      ],
                    ),
                  )
          ],
        ));
  }
}
