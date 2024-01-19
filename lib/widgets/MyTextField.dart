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
    this.hasBorder = false,
    this.paddingHorizontal,
    this.paddingVertical,
    this.textStyle,
    this.suffixIcon,
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
  final Widget? suffixIcon;

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
        style: textStyle ??
            TextStyle(
              color: cW,
              fontSize: 13,
            ),
        textDirection: textDirection ?? TextDirection.rtl,
        keyboardType: inputType,
        controller: controller,
        onChanged: onchangedAction,
        textAlign: textAlign ?? TextAlign.right,
        inputFormatters: addlist(length, inputType),
        decoration: InputDecoration(
          fillColor: cSecondary,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(
              horizontal: paddingHorizontal ?? 20,
              vertical: paddingVertical ?? 15),
          hintText: hint,
          hintStyle: TextStyle(
              height: 1, color: hintColor ?? cW, fontSize: hintFontSize ?? 13),
          enabledBorder: hasBorder == false
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    borderRadius ?? 5,
                  ),
                  borderSide: BorderSide(color: Colors.transparent, width: 0))
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    borderRadius ?? 5,
                  ),
                  borderSide: BorderSide(color: cStrokeGrey, width: 1)),
          focusedBorder: hasBorder == false
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    borderRadius ?? 5,
                  ),
                  borderSide: BorderSide(color: Colors.transparent, width: 0))
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 5),
                  borderSide: BorderSide(color: cStrokeGrey, width: 1)),
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
