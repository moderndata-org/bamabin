import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/score_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';

class ScoreSection extends StatelessWidget {
  ScoreSection({super.key,this.award_summery,this.rank});
  String? award_summery;
  String? rank;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: cPrimaryDark,
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.stars,
                color: cW,
              ),
              SizedBox(
                width: 10,
              ),
              MyText(
                text: 'امتیازات',
                size: 15,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ScoreItem(
              title: "جوایز",
              descirption:
                  "${award_summery}"),
          ScoreItem(
            title: "رتبه",
            descirption: "${rank}",
          )
        ],
      ),
    );
  }
}
