import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/widgets/MySncakBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPasswrod = TextEditingController();
  TextEditingController txtPasswrod2 = TextEditingController();
  RxBool terms = true.obs;
  RxBool isLoadingRegister = false.obs;

  void signUp({
    required String username,
    required String password,
    required String rePassword,
    required String email,
  }) {
    if (terms.isTrue) {
      if (username != '' && password != '' && rePassword != '' && email != '') {
        if (password == rePassword) {
          isLoadingRegister(true);
          print('$username $email $password $rePassword');
          ApiProvider()
              .register(
                  username: username,
                  email: email,
                  password: password,
                  re_password: rePassword)
              .then((res) {
            isLoadingRegister(false);
            print(res.body);
          });
        } else {
          showErrorMessage(text: 'رمز با تکرار رمز یکسان نمیباشد');
        }
      } else {
        showErrorMessage(text: 'لطفا اطلاعات را وارد نمایید');
      }
    } else {
      showErrorMessage(text: 'لطفا گزینه شرایط و قوانین را فعال نمایید');
    }
  }

  void showErrorMessage({required String text}) {
    MySnackBar(
        text,
        Colors.amber,
        Icon(
          Icons.warning_rounded,
          color: Colors.amber,
        ),
        Duration(milliseconds: 1500));
  }
}
