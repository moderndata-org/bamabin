import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/promote_custom_paint.dart';
import 'MyText.dart';

class PromoteDetailWidget extends StatelessWidget {
  const PromoteDetailWidget({
    this.icon,
    this.title,
    this.description,
    super.key,
  });

  final Widget? icon;
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          //! Right Box
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: SizedBox(
              width: 170,
              height: 40,
              child: Container(
                decoration: BoxDecoration(
                    color: cPrimary, borderRadius: BorderRadius.circular(5)),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    SizedBox(
                        height: 35,
                        width: 45,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              right: 0,
                              top: -5,
                              bottom: -5,
                              child: SizedBox(
                                width: 70,
                                child: CustomPaint(
                                  painter: PromoteCustomPaint(),
                                ),
                              ),
                            ),
                            Center(
                              child: icon ??
                                  Icon(
                                    Icons.info_outline_rounded,
                                    color: cW,
                                    shadows: [bsTextLowOpacity],
                                  ),
                            )
                          ],
                        )),
                    Expanded(
                        child: Center(
                      child: MyText(
                        text: '$title',
                        fontWeight: FontWeight.w500,
                        shadows: [bsText],
                        size: 16,
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: MyText(
              text: '$description',
              shadows: [bsText],
              size: 14,

            ),
          )
        ],
      ),
    );
  }
}
