import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/colors.dart';
import 'MyText.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    this.borderRadius = 0,
    this.title = '',
    this.list,
    this.buttonColor,
    this.dropdownColor,
    this.alignment = Alignment.center,
    super.key,
  });
  final double? borderRadius;
  final String? title;
  final List<String>? list;
  final Color? buttonColor;
  final Color? dropdownColor;
  final Alignment? alignment;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DropdownButtonHideUnderline(
          child: DropdownButton2(
              buttonStyleData: ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: buttonColor ?? cSecondaryLight,
                      borderRadius: BorderRadius.circular(borderRadius!))),
              dropdownStyleData: DropdownStyleData(
                scrollPadding: EdgeInsets.zero,
                offset: Offset.zero,
                isOverButton: false,
                padding: EdgeInsets.zero,
                scrollbarTheme: ScrollbarThemeData(thumbColor: null),
                decoration: BoxDecoration(
                    color: dropdownColor ?? cSecondary,
                    borderRadius: BorderRadius.circular(borderRadius!)),
                maxHeight: 200,
              ),
              iconStyleData: IconStyleData(
                  openMenuIcon: Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: cW,
                    shadows: [bsTextLowOpacity],
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: cW,
                    shadows: [bsTextLowOpacity],
                  )),
              isExpanded: true,
              hint: Align(
                alignment: alignment!,
                child: MyText(
                  text: title!,
                  size: 12,
                  shadows: [bsText],
                ),
              ),
              onChanged: (value) {},
              items: list == null
                  ? []
                  : List.generate(
                      list!.length,
                      (index) => DropdownMenuItem(
                          value: index,
                          child: Align(
                            alignment: alignment!,
                            child: MyText(
                              text: list![index],
                              size: 13,
                              shadows: [bsText],
                            ),
                          ))))),
    );
  }
}
