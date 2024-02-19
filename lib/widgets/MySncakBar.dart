import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController MySnackBar(
    {String? message, Color? color, Icon? icon, Duration? duration}) {
  return Get.snackbar('title', 'message',
      onTap: (snack) => Get.back(),
      messageText: Container(),
      duration: duration ?? Duration(milliseconds: 1700),
      titleText: Container(),
      maxWidth: Get.width,
      snackPosition: SnackPosition.BOTTOM,
      barBlur: 0,
      backgroundColor: Colors.transparent,
      colorText: Colors.white,
      margin: const EdgeInsets.all(0),
      borderRadius: 0,
      padding: const EdgeInsets.all(0),
      userInputForm: Form(
          onWillPop: () => Future(() => false),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black.withOpacity(.8)),
            margin: const EdgeInsets.all(0),
            height: 60,
            width: Get.width,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 5,
                    height: 40,
                    decoration: BoxDecoration(
                        color: color, borderRadius: BorderRadius.circular(10)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  icon ?? SizedBox(),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      textDirection: TextDirection.rtl,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textScaleFactor: 1,
                      '${message}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ]),
          )));
}
