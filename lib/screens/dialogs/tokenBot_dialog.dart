import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
import '../../widgets/MyText.dart';
import '../../widgets/MyTextButton.dart';
import '../../widgets/MyTextField.dart';

class TokenBotDialog extends StatelessWidget {
  const TokenBotDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: cB,
      surfaceTintColor: cB,
      elevation: 20,
      backgroundColor: cPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 40,
              width: Get.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      splashRadius: 1,
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.cancel,
                        color: cR,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    child: MyText(
                      text: 'ربات تلگرام',
                      color: cW,
                      size: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              alignment: Alignment.topRight,
              child: Text(
                ": توکن ربات تلگرام",
                style: TextStyle(color: cW, fontSize: 12),
                textAlign: TextAlign.right,
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  decoration: BoxDecoration(
                      color: cSecondary,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Row(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyTextButton(
                        onTap: () {},
                        size: Size(Get.width / 5.6, 35),
                        bgColor: cSecondaryLight,
                        child: MyText(
                          text: "کپی",
                          size: 14,
                          color: cW,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: MyText(
                          text: "RTh9876543Ddf%ss",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left,
                          color: cW,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.smart_toy,
                        color: cW,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  )),
                )),
            Container(
              margin: EdgeInsets.only(right: 20, top: 12),
              alignment: Alignment.topRight,
              child: Text(
                ": انتقال اشتراک ربات به اکانت سایت ",
                style: TextStyle(color: cW, fontSize: 12),
                textAlign: TextAlign.right,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: MyTextField(
                borderRadius: 5,
                height: 45,
                hint: "توکن داخل ربات را اینجا ورد کنید",
                controller: new TextEditingController(),
                maxLines: 3,
                suffixIcon: Icon(
                  Icons.description,
                  size: 25,
                  color: cW,
                ),
              ),
            ),
            MyTextButton(
              onTap: () {},
              size: Size(Get.width / 1.4, 35),
              bgColor: cY,
              child: MyText(
                text: "ادغام ربات با سایت",
                size: 14,
                color: cB,
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
