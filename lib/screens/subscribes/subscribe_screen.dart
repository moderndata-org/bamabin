import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/widgets/MyTextField.dart';
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
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            DetailsAppBar(
                leftWidget: MyTextButton(
                    size: const Size(40, 40),
                    onTap: () {
                      Get.back();
                    },
                    fgColor: cGrey,
                    bgColor: cPrimaryDark,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: cGrey,
                    )),
                rightWidget: MyTextButton(
                    size: const Size(40, 40),
                    onTap: () {
                      Get.back();
                    },
                    fgColor: cGrey,
                    bgColor: cPrimaryDark,
                    child: Icon(
                      Icons.subscriptions,
                      color: cAccent,
                    )),
                title: "خرید اشتراک"),
            Expanded(
                child: ListView(
              padding: EdgeInsets.only(right: 10, left: 10),
              children: [
                SubscribeItem(
                  price: "35,000",
                  price_of: "30,000",
                ),
                SubscribeItem(
                  is_selected: true,
                  price: "45,000",
                  price_of: "35,000",
                )
              ],
            )),
            Container(
              padding: EdgeInsets.all(10),
              width: Get.width,

              color: cPrimaryDark,
              child: Column(
                children: [
                  Row(children: [
                    Expanded(
                      child: MyTextButton(
                        size: Size(35,35),
                        onTap: () {},
                        child: Text(
                          "اعمال کد تخفیف",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        bgColor: cAccent,
                      ),
                      flex: 3,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: MyTextField(
                        hint: "کد تخفیف",
                        controller: TextEditingController(),
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
                  Container(child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                      Text("مبلغ کل",style: TextStyle(color: Colors.white),),
                      SizedBox(width: 10,),
                      Column(children: [
                        Text("45,000 تومان",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(fontSize: 13,color: cPink,decoration: TextDecoration.lineThrough,decorationColor: cPink),),
                        Text("35,000 تومان",style: TextStyle(color: cAccent),textDirection: TextDirection.rtl,),
                      ],)
                    ],),
                      MyTextButton(
                        size: Size(Get.width / 3,35),
                        onTap: () {},
                        child: Text(
                          "پرداخت",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        bgColor: cAccent,
                      )
                  ],),)
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
