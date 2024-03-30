import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  if(url.isURL){
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

}

String getPersianDate({required String dateTime}) {
  Jalali j = DateTime.parse(dateTime).toJalali();
  String a = '${j.year}/${j.formatter.mm}/${j.formatter.dd}';
  return a;
}

String computeTheCapacity({required double size}) {
  String a = '';
  double cap = size / 2048 / 1024;
  // print('size $size');
  // print('cap $cap');
  // print(size / 2048);
  // print(cap >= 1000);
  if (cap >= 1000.0) {
    cap = cap / 1024;
    a = '${cap.toStringAsFixed(2)} GB';
  } else {
    a = '${cap.toStringAsFixed(2)} MB';
  }
  return a;
}

class ErrorInternetFetchingSubtitle implements Exception {
  final int? code;
  final String? message;

  const ErrorInternetFetchingSubtitle(this.code, this.message);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

void openADM({required String url}) async {
  AndroidIntent intent = AndroidIntent(
    action: 'action_main',
    package: 'com.dv.adm',
    componentName: 'com.dv.adm.AEditor',
    arguments: <String, dynamic>{
      'android.intent.extra.TEXT': url,
    },
  );
  await intent.launch();
}
