import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import 'MyText.dart';

class FilterDropDown extends StatelessWidget {
  const FilterDropDown({this.title, this.width, this.height, Key? key})
      : super(key: key);
  final double? width;
  final double? height;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: width ?? Get.width,
      height: height ?? 40,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              // isDense: true,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
              ),
              alignment: Alignment.center,
              borderRadius: BorderRadius.circular(5),
              dropdownColor: cPrimary,
              hint: MyText(
                  text: '$title',
                  color: Colors.black,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold),
              // isExpanded: true,
              items: [
                DropdownMenuItem(
                    value: 1,
                    alignment: Alignment.centerRight,
                    child: SizedBox(width: 40, child: MyText(text: '1'))),
                DropdownMenuItem(
                    value: 2,
                    alignment: Alignment.centerRight,
                    child: SizedBox(width: 40, child: MyText(text: '2'))),
                DropdownMenuItem(
                    value: 3,
                    alignment: Alignment.centerRight,
                    child: SizedBox(width: 40, child: MyText(text: '3'))),
              ],
              onChanged: (value) {},
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
          color: cAccent,
          border: Border.all(color: cStrokeGrey),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
