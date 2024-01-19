import 'package:flutter/material.dart';

import '../constant/colors.dart';
import 'MyText.dart';
import 'MyTextButton.dart';

class MainTitleWidget extends StatelessWidget {
  const MainTitleWidget({
    this.title,
    this.onTapMore,
    super.key,
  });

  final String? title;
  final Function()? onTapMore;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 15,
        ),
        Icon(
          Icons.movie,
          color: cSecondaryLight,
          size: 20,
        ),
        SizedBox(
          width: 5,
        ),
        MyText(
          text: title ?? '',
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: Container(
          height: 1,
          color: cSecondaryLight,
        )),
        MyTextButton(
          size: Size(80, 45),
          onTap: onTapMore ?? () {},
          bgColor: Colors.transparent,
          child: Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              MyText(
                text: 'بیشتر',
                color: cW,
              ),
              SizedBox(
                width: 2,
              ),
              Icon(
                Icons.arrow_back_ios_new_rounded,
                color: cW,
                size: 13,
              )
            ],
          ),
        ),
      ],
    );
  }
}
