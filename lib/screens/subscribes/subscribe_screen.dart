import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/widgets/MyTextField.dart';
import 'package:bamabin/widgets/custom_appbar.dart';
import 'package:bamabin/widgets/details_app_bar.dart';
import 'package:bamabin/widgets/subscribe_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/MyTextButton.dart';

class SubscribeScreen extends StatelessWidget {
  const SubscribeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: cPrimary,
      appBar: CustomAppbar(
          title: 'خرید اشتراک',
          icon: Icon(
            Icons.subscriptions,
            color: cW,
            size: 25,
            shadows: [bsText],
          )),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              padding: EdgeInsets.only(right: 10, left: 10),
              itemBuilder: (context, index) => SubscribeItem(
                price: "35,000",
                price_of: "30,000",
              ),
            )),
            Container(
              padding: EdgeInsets.all(10),
              width: Get.width,
              decoration: BoxDecoration(color: cPrimary, boxShadow: [
                BoxShadow(
                    offset: Offset(0, -5),
                    blurRadius: 5,
                    color: cB.withOpacity(.2))
              ]),
              child: Column(
                children: [
                  Row(textDirection: TextDirection.ltr, children: [
                    Expanded(
                      child: MyTextButton(
                        size: Size.fromHeight(35),
                        onTap: () {},
                        child: Text(
                          "اعمال کد تخفیف",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        bgColor: cAccent,
                      ),
                      flex: 3,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: MyTextField(
                          hint: "کد تخفیف",
                          controller: TextEditingController(),
                        ),
                      ),
                      flex: 5,
                    ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 1,
                    width: Get.width,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Text(
                              "مبلغ کل",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  "45,000 تومان",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: cPink,
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: cPink),
                                ),
                                Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Text(
                                      "35,000",
                                      style: TextStyle(
                                          color: cAccent, fontSize: 17),
                                      textDirection: TextDirection.rtl,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "تومان",
                                      style: TextStyle(color: cW, fontSize: 11),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        MyTextButton(
                          size: Size.fromHeight(35),
                          onTap: () {},
                          child: Text(
                            "پرداخت",
                            style: TextStyle(fontSize: 13, color: Colors.black),
                          ),
                          bgColor: cAccent,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
