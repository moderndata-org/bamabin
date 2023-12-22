import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPasswrod = TextEditingController();
  TextEditingController txtPasswrod2 = TextEditingController();
  RxBool terms = true.obs;
}
