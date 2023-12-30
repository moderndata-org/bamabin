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
      this.isSerial = false,
      this.encoder,
      this.partsCount,
      this.movieSize,
      this.margin,
      this.width,
      this.actionMethod = ActionMethod.Download,
      super.key});

  final Quality? quality;
  final MovieType? movieType;
  final SubtitleType? subtitleType;
  final bool? isSerial;
  final String? encoder;
  final String? movieSize;
  final String? partsCount;
  final EdgeInsetsGeometry? margin;
  final ActionMethod? actionMethod;
  final double? width;

  @override
  Widget build(BuildContext context) {
    double borderRadius = 10;
    return Container(
      margin: margin,
      // margin: EdgeInsets.only(top: 5),
      width: width ?? Get.width,
      height: isSerial == true ? 150 : 130,
      decoration: BoxDecoration(
        border: Border.all(color: cStrokeGrey),
        color: cB,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Stack(alignment: Alignment.center, children: [
        //! Top right
        Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 50,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                  color: switch (quality!) {
                    Quality.FourK => c4K,
                    Quality.FHD => cFHD,
                    Quality.HD => cHD,
                    Quality.SD => cSD,
                  },
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(borderRadius - 1),
                      bottomLeft: Radius.circular(borderRadius))),
              child: MyText(
                text: switch (quality!) {
                  Quality.FourK => '4K',
                  Quality.FHD => 'FHD',
                  Quality.HD => 'HD',
                  Quality.SD => 'SD',
                },
                color: switch (quality!) {
                  Quality.FourK => cW,
                  Quality.FHD => cB,
                  Quality.HD => cB,
                  Quality.SD => cB,
                },
                padding: EdgeInsets.only(top: 4),
              ),
            )),
        //! Top left
        Positioned(
            top: 0,
            left: 0,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
              constraints: BoxConstraints(minWidth: 90),
              decoration: BoxDecoration(
                  color: switch (movieType!) {
                    MovieType.Dubbed => cDubbed,
                    MovieType.Subtitle => cSubtitle,
                    MovieType.None => cNone,
                  },
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(borderRadius - 1),
                      bottomRight: Radius.circular(borderRadius))),
              child: MyText(
                text: switch (movieType!) {
                  MovieType.Dubbed => 'دوبله دوزبانه',
                  MovieType.Subtitle => 'زیرنویس چسبیده',
                  MovieType.None => 'خام',
                },
                color: cB,
                padding: EdgeInsets.only(top: 3),
              ),
            )),
        //! Center left
        subtitleType == null
            ? SizedBox()
            : Positioned(
                left: 0,
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                    decoration: BoxDecoration(
                        color: cHardSubSoftSub,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(borderRadius - 1),
                            bottomRight: Radius.circular(borderRadius))),
                    child: MyText(
                      text: switch (subtitleType!) {
                        SubtitleType.HardSub => 'HardSub',
                        SubtitleType.SoftSub => 'SoftSub',
                      },
                      color: cW,
                      padding: EdgeInsets.only(top: 6),
                    ),
                  ),
                )),
        //! Bottom left
        Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              constraints: BoxConstraints(minWidth: 90),
              decoration: BoxDecoration(
                  color: switch (movieType!) {
                    MovieType.Dubbed => cDubbed,
                    MovieType.Subtitle => cSubtitle,
                    MovieType.None => cNone,
                  },
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(borderRadius - 1),
                      bottomLeft: Radius.circular(borderRadius))),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  MyText(
                    text: actionMethod == ActionMethod.Play ? 'پخش' : 'دانلود',
                    color: cB,
                    padding: EdgeInsets.only(top: 3),
                  ),
                  isSerial != true
                      ? SizedBox()
                      : Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: cB,
                        )
                ],
              ),
            )),
        //! Text Columns
        Positioned(
            top: 40,
            right: 10,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MyText(
                  text: switch (quality!) {
                    Quality.FourK => '4K',
                    Quality.FHD => 'Bluray 1080P',
                    Quality.HD => 'Bluray 720P',
                    Quality.SD => 'Bluray 480P',
                  },
                  size: 15,
                  color: switch (movieType!) {
                    MovieType.Dubbed => cDubbed,
                    MovieType.Subtitle => cSubtitle,
                    MovieType.None => cW,
                  },
                ),
                Spacer(),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    MyText(
                        text: 'انکدر : ',
                        color: switch (movieType!) {
                          MovieType.Dubbed => cDubbed,
                          MovieType.Subtitle => cSubtitle,
                          MovieType.None => cNone,
                        }),
                    MyText(text: '$encoder'),
                  ],
                ),
                Spacer(),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    MyText(
                        text: isSerial == true ? 'میانگین حجم : ' : 'حجم : ',
                        color: switch (movieType!) {
                          MovieType.Dubbed => cDubbed,
                          MovieType.Subtitle => cSubtitle,
                          MovieType.None => cNone,
                        }),
                    MyText(text: '$movieSize'),
                  ],
                ),
                isSerial != true ? SizedBox() : Spacer(),
                isSerial != true
                    ? SizedBox()
                    : Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          MyText(
                              text: 'تعداد قسمت : ',
                              color: switch (movieType!) {
                                MovieType.Dubbed => cDubbed,
                                MovieType.Subtitle => cSubtitle,
                                MovieType.None => cNone,
                              }),
                          MyText(text: '$partsCount'),
                        ],
                      ),
                SizedBox(
                  height: 10,
                )
              ],
            ))
      ]),
    );
  }
}
