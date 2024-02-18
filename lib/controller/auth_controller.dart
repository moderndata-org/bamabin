import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/widgets/MySncakBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPasswrod = TextEditingController();
  TextEditingController txtPasswrod2 = TextEditingController();
  RxBool terms = true.obs;
  RxBool isLoadingUpdateProfile = true.obs;
  RxBool isLoadingRegister = false.obs;
  GetStorage box = GetStorage('bamabin');
  var isLogin = false.obs;
  void checkLogin() {
    if (box.hasData("api_key")) {
      ApiProvider().checkLogin().then((value){
        if(value.isOk){
          isLogin(value.body["status"]);
        }
      });
    } else {
      isLogin(false);
    }

    Get.offNamed('/main');
  }

  void updateProfile({
    String? nickname,
    String? description,
    String? first_name,
    String? last_name,
    String? phone,
    String? city,
  }) {
    if (nickname != null || nickname != '') {
      isLoadingUpdateProfile(true);
      ApiProvider()
          .updateProfile(
              nickname: nickname!,
              city: city,
              description: description,
              first_name: first_name,
              last_name: last_name,
              phone: phone)
          .then((res) {
        print(res.body);
      });
    }
  }

  void signUp({
    required String username,
    required String password,
    required String rePassword,
    required String email,
  }) {
    if (terms.isTrue) {
      if (username != '' && password != '' && rePassword != '' && email != '') {
        if (GetUtils.isEmail(email)) {
          if (password == rePassword) {
            isLoadingRegister(true);
            ApiProvider()
                .register(
                    username: username,
                    email: email,
                    password: password,
                    re_password: rePassword)
                .then((res) {
              isLoadingRegister(false);
              if (res.body != null) {
                if (res.body['status'] == true) {
                  MySnackBar(
                      '${res.body['message']}',
                      Colors.green,
                      Icon(
                        Icons.check_circle_rounded,
                        color: Colors.green,
                      ),
                      Duration(milliseconds: 1500));
                  box.write('api_key', res.body['api_key']);
                  box.save();
                  Get.back();
                } else {
                  showErrorMessage(text: res.body['message']);
                }
              }
              print(res.body);
            });
          } else {
            showErrorMessage(text: 'رمز با تکرار رمز یکسان نمیباشد');
          }
        } else {
          showErrorMessage(text: 'لطفا ایمیل را بررسی نمایید');
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
