
import 'package:flutter/material.dart';

import '../constant/colors.dart';
import 'MyText.dart';
import 'MyTextButton.dart';

class MainTitleWidget extends StatelessWidget {
  const MainTitleWidget({
    this.title,
    super.key,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 15,
        ),
        MyText(
          text: title ?? '',
          padding: EdgeInsets.only(top: 5),
        ),
        Spacer(),
        SizedBox(
          width: 66,
          child: MyTextButton(
            onTap: () {},
            bgColor: cPrimary,
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                MyText(
                  text: 'بیشتر',
                  color: cAccent,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: cAccent,
                  size: 15,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
