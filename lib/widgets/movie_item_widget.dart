import 'package:bamabin/widgets/MyCircularProgress.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constant/colors.dart';
import 'MyText.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget(
      {this.title,
      this.hasSubtitle = false,
      this.hasDubbed = false,
      this.width = 115,
      this.radius = 5,
      this.year,
      this.imdbRate,
      this.image,
      this.onTap,
      this.isAddItem,
      this.isDeleteItem,
      super.key});
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
        height: 195,
        margin: EdgeInsetsDirectional.symmetric(horizontal: 3),
        child: Stack(
          alignment: Alignment.center,
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
                      padding: EdgeInsets.only(bottom: 1),
                      fontWeight: FontWeight.w500,
                      textOverflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.ltr),
                )),
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
                            child: CachedNetworkImage(
                              imageUrl: '$image',
                              fit: BoxFit.fill,
                              placeholder: (context, url) => Center(
                                  child: MyCircularProgress(
                                color: cPrimary,
                              )),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                          //! IMDB Box
                          imdbRate == null || imdbRate == ''
                              ? SizedBox()
                              : Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 3, top: 4, right: 2),
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
                                    child: Icon(
                                      Icons.add_circle_rounded,
                                      color: cB,
                                    ),
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
                                    child: Icon(
                                      Icons.delete_sweep_rounded,
                                      color: cW,
                                    ),
                                  )),
                          //! Year
                          year == null || year == ''
                              ? SizedBox()
                              : Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 2),
                                    decoration: BoxDecoration(
                                        color: cB.withOpacity(.5),
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(5))),
                                    child: MyText(
                                      text: year!,
                                      size: 10,
                                    ),
                                  )),
                          //! Mic and Subtitle
                          Positioned(
                              top: 0,
                              left: -2,
                              bottom: 0,
                              child: Column(
                                children: [
                                  Spacer(),
                                  hasSubtitle == true
                                      ? Container(
                                          padding: EdgeInsets.only(
                                              right: 1,
                                              top: 2,
                                              bottom: 2,
                                              left: 2),
                                          decoration: BoxDecoration(
                                              color: cB.withOpacity(.7),
                                              borderRadius: BorderRadius.only(
                                                topRight:
                                                    Radius.circular(radius!),
                                                bottomRight:
                                                    Radius.circular(radius!),
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
                                              right: 1,
                                              top: 2,
                                              bottom: 2,
                                              left: 2),
                                          decoration: BoxDecoration(
                                              color: cB.withOpacity(.7),
                                              borderRadius: BorderRadius.only(
                                                topRight:
                                                    Radius.circular(radius!),
                                                bottomRight:
                                                    Radius.circular(radius!),
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
