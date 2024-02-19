import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/models/profile_model.dart';
import 'package:bamabin/widgets/MySncakBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPasswrod = TextEditingController();
  TextEditingController txtPasswrod2 = TextEditingController();
  RxBool terms = true.obs;
  RxBool isLoadingUpdateProfile = false.obs;
  RxBool isLoadingRegister = false.obs;
  RxBool isLoadingLogin = false.obs;
  var profile = ProfileModel().obs;

  GetStorage box = GetStorage('bamabin');
  var isLogin = false.obs;
  void checkLogin() {
    if (box.hasData("api_key")) {
      ApiProvider().checkLogin().then((value) {
        if (value.isOk) {
          isLogin(value.body["status"]);
          if (isLogin.isTrue) {
            getProfile();
          }
        }
      });
    } else {
      isLogin(false);
    }

    Get.offNamed('/main');
  }

  void login({required String? username, required String? password}) {
    isLoadingLogin(true);
    ApiProvider().login(username: username, password: password).then((res) {
      print(res.body);
      if (res.isOk) {
        if (res.body["status"] == true) {
          box.write("api_key", res.body["api_key"]);
          isLogin(true);
          getProfile();
          Get.back();
        } else {
          showMessage(text: res.body["message"], isSucces: false);
        }
      }
      isLoadingLogin(false);
    });
  }

  void getProfile() {
    ApiProvider().getProfile().then((value) {
      if (value.isOk) {
        profile(ProfileModel.fromJson(value.body["result"]));
      }
    });
  }

  void updateProfile({
    String? nickname,
    String? description,
    String? first_name,
    String? last_name,
    String? phone,
    String? city,
  }) {
    if (nickname != null && nickname != '') {
      isLoadingUpdateProfile(true);
      ApiProvider()
          .updateProfile(
              nickname: nickname,
              city: city,
              description: description,
              first_name: first_name,
              last_name: last_name,
              phone: phone)
          .then((res) {
        print(res.body);
        isLoadingUpdateProfile(false);
        if (res.body != null) {
          if (res.body['status'] == true) {
            showMessage(text: 'با موفقیت ویرایش شد', isSucces: true);
            profile.value
              ..description = description ?? ''
              ..nickname = nickname
              ..firstName = first_name ?? ''
              ..lastName = last_name ?? ''
              ..phone = phone ?? ''
              ..city = city ?? '';
            profile.refresh();
            Navigator.pop(Get.context!);
          } else {
            showMessage(text: '${res.body['message']}', isSucces: false);
          }
        }
      });
    } else {
      showMessage(text: 'لطفا نام نمایشی خود را وارد نمایید', isSucces: false);
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
                  showMessage(text: '${res.body['message']}', isSucces: true);
                  box.write('api_key', res.body['api_key']);
                  box.save();
                  Get.back();
                } else {
                  showMessage(text: res.body['message'], isSucces: false);
                }
              }
              print(res.body);
            });
          } else {
            showMessage(
                text: 'رمز با تکرار رمز یکسان نمیباشد', isSucces: false);
          }
        } else {
          showMessage(text: 'لطفا ایمیل را بررسی نمایید', isSucces: false);
        }
      } else {
        showMessage(text: 'لطفا اطلاعات را وارد نمایید', isSucces: false);
      }
    } else {
      showMessage(
          text: 'لطفا گزینه شرایط و قوانین را فعال نمایید', isSucces: false);
    }
  }

  void showMessage({required String text, required bool isSucces}) {
    MySnackBar(
        text,
        isSucces ? Colors.green : Colors.amber,
        isSucces
            ? Icon(
                Icons.check_circle_rounded,
                color: Colors.green,
              )
            : Icon(
                Icons.warning_rounded,
                color: Colors.amber,
              ),
        Duration(milliseconds: 1500));
  }
}
