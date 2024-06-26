import 'dart:async';

import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/notification_controller.dart';
import 'package:bamabin/controller/payment_controller.dart';
import 'package:bamabin/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant/utils.dart';

class AuthController extends GetxController {
  var current_version = "1.0.0";

  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPasswrod = TextEditingController();
  TextEditingController txtPasswrod2 = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController botTokenController = TextEditingController();
  RxBool terms = true.obs;
  RxBool isLoadingUpdateProfile = false.obs;
  RxBool isLoadingRegister = false.obs;
  RxBool isForgotPasswordRegister = false.obs;
  RxBool isLoadingLogin = false.obs;
  RxBool isChangingPassword = false.obs;
  var profile = ProfileModel().obs;

  var migrationLoading = false.obs;

  PaymentController paymentController = Get.find();
  NotificationController notificationController = Get.find();
  var botToken = "".obs;

  GetStorage box = GetStorage('bamabin');
  var isLogin = false.obs;

  void updateDialog(var android_link,var ios_link) {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return Dialog(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15),
              width: Get.width / 1.5,
              height: Get.height / 4,
              decoration: BoxDecoration(color: cPrimary),
              child: Column(
                children: [
                  Text(
                    "نسخه جدید منتشر شد",
                    style: TextStyle(
                        color: cAccent,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  SizedBox(height: 20,),
                  Text("برای استفاده لطفا نسخه جدید اپلیکیشن را دانلود و نصب کنید",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(onPressed: (){
                        launchTheUrl(url: ios_link);
                      }, child: Row(children: [
                        Icon(Icons.apple),
                        Text("IOS")

                      ],)),
                      ElevatedButton(onPressed: (){
                        launchTheUrl(url: android_link);
                      }, child: Row(children: [
                        Icon(Icons.android),
                        Text("اندروید")

                      ],))
                    ],)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void checkVersion() {
    ApiProvider().checkVersion().then((value) {
      if (value.isOk) {
        if (value.body["status"] == true) {
          if (value.body["result"]["latest_version"] == current_version) {
            checkLogin();
          } else {
            updateDialog(value.body["result"]["android_app_download_link"],
                value.body["result"]["ios_app_download_link"]
            );
          }
        }
      }
    });
  }

  void changePassword({
    required String current_password,
    required String password,
    required String re_password,
  }) {
    if (isChangingPassword.isFalse) {
      isChangingPassword(true);
      ApiProvider()
          .changePassword(
              current_password: current_password,
              password: password,
              re_password: re_password)
          .then((res) {
        isChangingPassword(false);
        if (current_password.isNotEmpty &&
            password.isNotEmpty &&
            re_password.isNotEmpty) {
          if (password == re_password) {
            if (res.body != null) {
              if (res.body['status'] == true) {
                Get.back();
                box.write('api_key', res.body['api_key']);
                box.save();
                showMessage(text: 'ثبت شد', isSucces: true);
              } else {
                showMessage(text: res.body['message'], isSucces: false);
              }
            }
          } else {
            showMessage(
                text: 'رمز عبور با تکرار آن یکسان نمیباشد', isSucces: false);
          }
        } else {
          showMessage(text: 'پر کردن فیلد ها اجباری است', isSucces: false);
        }
      });
    }
  }

  void checkLogin() {
    if (box.hasData("api_key")) {
      ApiProvider().checkLogin().then((value) {
        if (value.isOk) {
          isLogin(value.body["status"]);
          if (isLogin.isTrue) {
            getProfile();
            paymentController.checkVip();
            getBotToken();
          }
        }
      });
    } else {
      isLogin(false);
    }
    Timer(Duration(seconds: 4), () {
      Get.offNamed('/main');
    });
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
          paymentController.checkVip();
          notificationController.getNotifications();
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
                  Get.back();
                  isLogin(true);
                  showMessage(text: '${res.body['message']}', isSucces: true);
                  box.write('api_key', res.body['api_key']);
                  box.save();
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

  void forgotPassword({required String email}) {
    isForgotPasswordRegister(true);
    if (email != '') {
      if (GetUtils.isEmail(email)) {
        ApiProvider().forget(email: email).then((res) {
          isForgotPasswordRegister(false);
          if (res.body != null) {
            showMessage(
                text: res.body['message'], isSucces: res.body['status']);
          }
        });
      } else {
        showMessage(text: 'لطفا ایمیل را بررسی نمایید', isSucces: false);
        isForgotPasswordRegister(false);
      }
    } else {
      showMessage(text: 'لطفا اطلاعات را وارد نمایید', isSucces: false);
      isForgotPasswordRegister(false);
    }
  }

  void logOut() {
    box.remove("api_key");
    box.save();
    isLogin(false);
    paymentController.isVip(false);
    paymentController.remainVipDays(0);
    Get.back();
  }

  void signInWithGoogle() {
    const List<String> scopes = <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ];

    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: scopes,
    );
    _googleSignIn.signIn().then((value) {
      print(value);
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  void getBotToken() {
    ApiProvider().getBotToken().then((value) {
      if (value.isOk) {
        if (value.body["status"] == true) {
          botToken(value.body["result"]["telegram_bot_token"]);
        }
      }
    });
  }

  void migrateBotToApp({required String? telegram_bot_site_token}) {
    migrationLoading(true);
    ApiProvider()
        .migrateBotToApp(telegram_bot_site_token: telegram_bot_site_token)
        .then((value) {
      if (value.isOk) {
        if (value.body["status"] == true) {
          botTokenController.clear();
          showMessage(text: "اشتراک ربات با موفقیت منتقل شد", isSucces: true);
        } else {
          showMessage(text: value.body["message"], isSucces: false);
        }
      }

      migrationLoading(false);
    });
  }
}
