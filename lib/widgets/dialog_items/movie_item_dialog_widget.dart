import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieItemDialogWidget extends StatelessWidget {
  const MovieItemDialogWidget({this.quality = Quality.FourK, super.key});

  final Quality? quality;

  @override
  Widget build(BuildContext context) {
    double borderRadius = 10;
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: Get.width * .8,
      height: 130,
      decoration: BoxDecoration(
        border: Border.all(color: cStrokeGrey),
        color: cB,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Stack(children: [
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
                padding: EdgeInsets.only(top: 3),
              ),
            )),
        //! Top left
        Positioned(
            top: 0,
            left: 0,
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
                      topLeft: Radius.circular(borderRadius - 1),
                      bottomRight: Radius.circular(borderRadius))),
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
                padding: EdgeInsets.only(top: 3),
              ),
            )),
        Positioned(
            top: 35,
            right: 10,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MyText(
                  text: 'BluRay 1080P',
                  size: 15,
                ),
                Spacer(),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    MyText(text: 'انکدر : ', color: cSD),
                    MyText(text: 'YIFY'),
                  ],
                ),
                Spacer(),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    MyText(text: 'حجم : ', color: cSD),
                    MyText(text: '2.1 GB'),
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
