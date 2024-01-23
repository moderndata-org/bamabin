import 'package:flutter/material.dart';

Color cB = Colors.black;
Color cW = Colors.white;
Color cR = const Color(0xffF45050);
Color cY = cAccent;
Color cG = Color(0xff188754);
Color cGreyLight = Color(0xffC5D0D5);

//!-- main colors
Color cPrimary = const Color(0xff1f3440);
Color cPrimaryDark = const Color(0xff1A2B35);
Color cSecondary = const Color(0xff2C6566);
Color cSecondaryLight = const Color(0xff149d86);
Color cAccent = const Color(0xffedc043);
Color cBgDrawer = const Color(0xff2B6263);
Color cBgDrawerItem = const Color(0xff3C797A);
Color cGrey = const Color(0xff4C5D66);
Color cbgGenerMovieDetail = const Color(0xff6C757D);
Color cDisklike = cR;
Color cLike = cSecondary;

//!-- main colors

Color cBgDialogColor = Colors.black.withOpacity(.8);
Color c4K = const Color.fromARGB(255, 10, 61, 98);
Color cFHD = const Color.fromARGB(255, 229, 80, 57);
Color cHD = const Color.fromARGB(255, 56, 173, 169);
Color cSD = const Color.fromARGB(255, 229, 142, 38);
Color cDubbed = const Color.fromARGB(255, 39, 155, 44);
Color cSubtitle = cAccent;
Color cNone = const Color.fromARGB(255, 161, 161, 161);
Color cBgBtnMovieDetail = const Color.fromARGB(255, 49, 49, 49);
Color cHardSubSoftSub = const Color.fromARGB(255, 255, 43, 43);
Color cAppBar = cSecondaryLight;
Color cPink = const Color.fromARGB(255, 244, 80, 80);
Color cBgTextfield = Color.fromARGB(255, 52, 52, 52);
Color cBgOrderItem = Color.fromARGB(255, 52, 52, 52);
Color cBgGener = Color.fromARGB(255, 66, 66, 66);
Color cBgCustomAppbar = Color.fromARGB(255, 31, 31, 31);
Color cStrokeGrey = Color.fromARGB(255, 78, 78, 78);
Color cIconGrey = Color.fromARGB(255, 173, 173, 173);
Color cHint = const Color.fromARGB(255, 124, 124, 124);
Color cDrawerGrey = const Color.fromARGB(255, 217, 217, 217);
Color cSuccessColor = const Color.fromARGB(255, 29, 248, 13);
Color cWarningColor = Colors.amber;
Color cCommentColor = const Color.fromARGB(255, 148, 148, 148);
//--------------------Shadows-------------------------------
BoxShadow bs010 = BoxShadow(
    blurRadius: 35,
    offset: const Offset(0, 2),
    color: Colors.black.withOpacity(.2));
BoxShadow bs010o5 = BoxShadow(
    blurRadius: 35,
    offset: const Offset(0, 2),
    color: Colors.black.withOpacity(.5));
BoxShadow bs010o7 = BoxShadow(
    blurRadius: 35,
    offset: const Offset(0, 2),
    color: Colors.black.withOpacity(.7));
BoxShadow bs010of = BoxShadow(
    blurRadius: 35,
    offset: const Offset(0, 10),
    color: Colors.black.withOpacity(.8));
BoxShadow bsText = BoxShadow(
    blurRadius: 10,
    offset: const Offset(0, 3),
    color: Colors.black.withOpacity(.4));
BoxShadow bsTextLowOpacity = BoxShadow(
    blurRadius: 10,
    offset: const Offset(0, 3),
    color: Colors.black.withOpacity(.2));
BoxShadow bsBtnMovieDetail =
    BoxShadow(blurRadius: 5, color: cB.withOpacity(.5), offset: Offset(0, 2));

//----------------LinearGradiends-----------------------

LinearGradient fadeGradient({Color? fromColor, Color? toColor}) {
  return LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [fromColor ?? cB.withOpacity(.7), toColor ?? Colors.transparent]);
}

// LinearGradient fadeGradiendt = LinearGradient(
//     begin: Alignment.bottomCenter,
//     end: Alignment.topCenter,
//     colors: [cB.withOpacity(.7), Colors.transparent]);
