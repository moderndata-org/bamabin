import 'package:bamabin/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscribeItem extends StatelessWidget {
  bool? is_selected = false;
  String? price;
  String? price_of;

  SubscribeItem({this.is_selected,this.price, this.price_of, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 10),
        width: Get.width - 20,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color:(is_selected==true) ?cAccent
              :
              cStrokeGrey,
              width: 1,
            ),
            color: cPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "تومان",
                      style: TextStyle(color: cPink, fontSize: 10),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "$price",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: cPink, // red line
                          color: cPink,
                          fontSize: 13),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "تومان",
                      style: TextStyle(color: cW, fontSize: 10),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "$price_of",
                      style: TextStyle(color: cAccent, fontSize: 16),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "اشتراک 1 ماهه",
                  style: TextStyle(color: cW, fontSize: 14),
                ),
                SizedBox(
                  width: 15,
                ),
                Image.asset(
                  "assets/images/ic_star.png",
                  width: 35,
                  height: 35,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
