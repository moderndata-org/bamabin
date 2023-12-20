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
    super.key,
  });
  final String hint;
  final double? borderRadius;
  final double? hintFontSize;
  final TextEditingController controller;
  final TextInputType? inputType;
  final int? length;
  final TextAlign? textAlign;
  final TextInputAction? action;
  final Function(String text)? onchangedAction;
  final FocusNode? focusNode;
  final int? maxLines;
  final TextDirection? textDirection;
  final bool? isPassword;
  final bool? isEnabled;
  final Color? hintColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: isEnabled,
      obscureText: isPassword == true ? true : false,
      focusNode: focusNode,
      textInputAction: action,
      maxLines: maxLines ?? 1,
      textDirection: textDirection ?? TextDirection.rtl,
      keyboardType: inputType,
      controller: controller,
      onChanged: onchangedAction,
      textAlign: textAlign ?? TextAlign.right,
      inputFormatters: addlist(length, inputType),
      decoration: InputDecoration(
        isCollapsed: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        hintText: hint,
        hintStyle: TextStyle(
            color: hintColor ?? Color.fromARGB(255, 185, 185, 185),
            fontSize: hintFontSize ?? 13),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
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
