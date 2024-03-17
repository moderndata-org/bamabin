import 'dart:io';
import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/widgets/back_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../constant/colors.dart';

class SignInQrCodeScreen extends StatefulWidget {
  const SignInQrCodeScreen({Key? key}) : super(key: key);

  @override
  State<SignInQrCodeScreen> createState() => _SignInQrCodeScreenState();
}

class _SignInQrCodeScreenState extends State<SignInQrCodeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  bool? can_login;
  QRViewController? controller;
  AuthController authController = Get.find();

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.resumeCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          width: Get.width,
          height: Get.height,
          child: Stack(
            children: [
              Container(
                width: Get.width,
                height: Get.height,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
              SizedBox(
                width: Get.width,
                height: Get.height,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: BackButtonCustom(
                        bgColor: cPrimary,
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 7),
                            decoration: BoxDecoration(
                                color: cPrimaryDark.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(5)),
                            width: Get.width * 0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "لطفا QR را از وبسایت اسکن کنید",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.error,
                                  color: cIconGrey,
                                  size: 30,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    ));
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        print("Code------${scanData}");
        if (result != null) {
          print("Code------${scanData}");
          GetStorage('bamabin')
            ..write("api_key", "${result!.code}")
            ..save();
          authController.checkLogin();
          Get.back();
        }
      });
    });
  }
}
