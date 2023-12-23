import 'package:bamabin/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    required this.hint,
    required this.controller,
    this.borderRadius,
    this.inputType,
    this.length,
    this.textAlign,
    this.action,
    this.onchangedAction,
    this.focusNode,
    this.maxLines,
    this.textDirection,
    this.isPassword,
    this.isEnabled,
    this.hintColor,
    this.hintFontSize,
    this.width,
    this.height,
    this.prefixIcon,
    this.hasBorder,
    this.paddingHorizontal,
    this.paddingVertical,
    this.textStyle,
    super.key,
  });
  final String hint;
  final double? borderRadius;
  final double? hintFontSize;
  final double? width;
  final double? height;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final TextEditingController controller;
  final TextInputType? inputType;
  final int? length;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final TextInputAction? action;
  final Function(String text)? onchangedAction;
  final FocusNode? focusNode;
  final int? maxLines;
  final TextDirection? textDirection;
  final bool? isPassword;
  final bool? isEnabled;
  final bool? hasBorder;
  final Color? hintColor;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        enabled: isEnabled,
        obscureText: isPassword == true ? true : false,
        focusNode: focusNode,
        textInputAction: action,
        maxLines: maxLines ?? 1,
        style: textStyle,
        textDirection: textDirection ?? TextDirection.rtl,
        keyboardType: inputType,
        controller: controller,
        onChanged: onchangedAction,
        textAlign: textAlign ?? TextAlign.right,
        inputFormatters: addlist(length, inputType),
        decoration: InputDecoration(
          fillColor: cBgTextfield,
          prefixIcon: prefixIcon,
          filled: true,
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(
              horizontal: paddingHorizontal ?? 20,
              vertical: paddingVertical ?? 15),
          hintText: hint,
          hintStyle: TextStyle(
              color: hintColor ?? cHint, fontSize: hintFontSize ?? 13),
          enabledBorder: hasBorder == true
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 15),
                  borderSide: BorderSide(color: cStrokeGrey, width: 1)),
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}

List<TextInputFormatter> addlist(int? length, TextInputType? txtinput) {
  List<TextInputFormatter> a = [];
  if (length != null) {
    a.add(LengthLimitingTextInputFormatter(length));
  }
  if (txtinput == TextInputType.number) {
    a.add(FilteringTextInputFormatter.digitsOnly);
  }

  return a;
}
