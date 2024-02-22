import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:url_launcher/url_launcher.dart';

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

Future<void> launchTheUrl({required String url}) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

String getPersianDate({required String dateTime}) {
  String a = '';
  Jalali j = DateTime.parse(dateTime).toJalali();
  a = '${j.year}/${j.month.toString().padLeft(2, '0')}/${j.day.toString().padLeft(2, '0')}';
  return a;
}
