import 'package:flutter/material.dart';

import '../constant/colors.dart';
import 'MyText.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget(
      {this.title,
      this.isSerial = false,
      this.hasSubtitle = false,
      this.hasDubbed = false,
      this.width = 115,
      this.radius = 10,
      this.year,
      this.imdbRate,
      this.image,
      this.onTap,
      this.isAddItem,
      this.isDeleteItem,
      super.key});
  final bool? isSerial;
  final bool? hasSubtitle;
  final bool? hasDubbed;
  final String? year;
  final String? imdbRate;
  final String? image;
  final String? title;
  final double? width;
  final double? radius;
  final bool? isAddItem;
  final bool? isDeleteItem;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 300,
        margin: EdgeInsetsDirectional.symmetric(horizontal: 3),
        child: Stack(
          children: [
            //! Black Container with Movie Title
            Positioned(
                bottom: 0,
                child: Container(
                  width: width,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.bottomLeft,
                  height: 50,
                  decoration: BoxDecoration(
                      color: cB.withOpacity(.5),
                      borderRadius: BorderRadius.circular(radius!)),
                  child: MyText(
                      text: title ?? 'Monarch',
                      size: 11,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.ltr),
                )),
            //! Top Picture
            isSerial == true
                ? Positioned(
                    bottom: 30,
                    child: Opacity(
                      opacity: .2,
                      child: Container(
                        width: width,
                        height: 175,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(radius!),
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 175,
                                  child: Image.asset(
                                      image ?? 'assets/images/monarch.jpg',
                                      fit: BoxFit.fill),
                                ),
                              ],
                            )),
                      ),
                    ))
                : SizedBox(),

            //! Middle Picture
            isSerial == true
                ? Positioned(
                    bottom: 25,
                    child: Opacity(
                      opacity: .5,
                      child: Container(
                        height: 175,
                        width: width,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(radius!),
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 175,
                                  child: Image.asset(
                                      image ?? 'assets/images/monarch.jpg',
                                      fit: BoxFit.fill),
                                ),
                              ],
                            )),
                      ),
                    ))
                : SizedBox(),
            //! Main Picture
            Positioned(
                bottom: 20,
                child: Container(
                  width: width,
                  height: 175,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(radius!),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 175,
                            child: Image.asset(
                                image ?? 'assets/images/monarch.jpg',
                                fit: BoxFit.fill),
                          ),
                          //! IMDB Box
                          imdbRate == null || imdbRate == ''
                              ? SizedBox()
                              : Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 3, top: 2, right: 2),
                                    decoration: BoxDecoration(
                                        color: cB.withOpacity(.5),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(radius! / 2),
                                          // bottomLeft:
                                          //     Radius.circular(radius! / 2),
                                        )),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                            width: 20,
                                            child: Image.asset(
                                                'assets/images/ic_imdb.png')),
                                        MyText(
                                          text: imdbRate!,
                                          size: 10,
                                        )
                                      ],
                                    ),
                                  )),

                          //! Add Item
                          isAddItem != true
                              ? SizedBox()
                              : Positioned(
                                  bottom: 0,
                                  child: Container(
                                    width: 115,
                                    height: 30,
                                    color: cY,
                                    alignment: Alignment.center,
                                    child: Icon(Icons.add_circle_rounded),
                                  )),
                          //! delete Item
                          isDeleteItem != true
                              ? SizedBox()
                              : Positioned(
                                  bottom: 0,
                                  child: Container(
                                    width: 115,
                                    height: 30,
                                    color: cPink,
                                    alignment: Alignment.center,
                                    child: Icon(Icons.delete_sweep_rounded),
                                  )), //! Year
                          year == null || year == ''
                              ? SizedBox()
                              : Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                        color: cB.withOpacity(.5),
                                        borderRadius: BorderRadius.only(
                                            bottomRight:
                                                Radius.circular(radius! / 2))),
                                    child: MyText(
                                      text: year!,
                                      size: 10,
                                      padding: EdgeInsets.only(top: 3),
                                    ),
                                  )),

                          //! Mic and Subtitle
                          Positioned(
                              top: 0,
                              left: 0,
                              bottom: 0,
                              child: Column(
                                children: [
                                  Spacer(),
                                  hasSubtitle == true
                                      ? Container(
                                          padding: EdgeInsets.only(
                                              right: 3,
                                              top: 2,
                                              bottom: 2,
                                              left: 2),
                                          decoration: BoxDecoration(
                                              color: cB.withOpacity(.5),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    radius! / 2),
                                                bottomRight: Radius.circular(
                                                    radius! / 2),
                                              )),
                                          child: Icon(
                                            Icons.closed_caption_off_rounded,
                                            color: cW,
                                            size: 17,
                                          ),
                                        )
                                      : SizedBox(),
                                  hasDubbed == true && hasSubtitle == true
                                      ? SizedBox(
                                          height: 10,
                                        )
                                      : SizedBox(),
                                  hasDubbed == true
                                      ? Container(
                                          padding: EdgeInsets.only(
                                              right: 3,
                                              top: 2,
                                              bottom: 2,
                                              left: 2),
                                          decoration: BoxDecoration(
                                              color: cB.withOpacity(.5),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    radius! / 2),
                                                bottomRight: Radius.circular(
                                                    radius! / 2),
                                              )),
                                          child: Icon(
                                            Icons.mic,
                                            color: cW,
                                            size: 17,
                                          ),
                                        )
                                      : SizedBox(),
                                  Spacer(),
                                ],
                              )),
                        ],
                      )),
                )),
          ],
        ),
      ),
    );
  }
}
