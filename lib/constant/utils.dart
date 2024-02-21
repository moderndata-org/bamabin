import 'package:flutter/material.dart';

import '../widgets/MySncakBar.dart';

void showMessage({required String text, required bool isSucces}) {
  MySnackBar(
    message: text,
    color: isSucces ? Colors.green : Colors.amber,
    icon: isSucces
        ? Icon(
      Icons.check_circle_rounded,
      color: Colors.green,
    )
        : Icon(
      Icons.warning_rounded,
      color: Colors.amber,
    ),
  );
}