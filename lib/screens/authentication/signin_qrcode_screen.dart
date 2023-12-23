import 'dart:io';

import 'package:bamabin/widgets/MyTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../constant/colors.dart';
import '../../widgets/MyTextButton.dart';

class SignInQrCodeScreen extends StatefulWidget {
  const SignInQrCodeScreen({Key? key}) : super(key: key);

  @override
  State<SignInQrCodeScreen> createState() => _SignInQrCodeScreenState();
}

class _SignInQrCodeScreenState extends State<SignInQrCodeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

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
        child: Stack(children: [
          Container(width: Get.width,height: Get.height,child: QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 10),
                    child: MyTextButton(
                        size: const Size(40, 40),
                        onTap: () {},
                        fgColor: cGrey,
                        bgColor: cPrimaryDark,
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: cGrey,
                        )),
                  )
                ],
              ),
              Container(),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 7),
                      decoration: BoxDecoration(
                          color: cPrimaryDark.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(8)),
                      width: Get.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "اسکن کنید یا کد را وارد کنید",
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
                    MyTextField(
                      hint: "QRCode کد ",
                      textStyle: TextStyle(color: Colors.white),
                      controller: new TextEditingController(),
                      width: Get.width * .8,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyTextButton(
                      bgColor: cAccent,
                      child: Text(
                        "ورود",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {},
                    )
                  ],
                ),
              )
            ],
          ),


        ],)


      ),
    ));
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }
}
