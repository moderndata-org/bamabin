import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/score_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';

class ScoreSection extends StatelessWidget {
  ScoreSection({super.key, this.award_summery, this.rank});
  String? award_summery;
  String? rank;
  @override
  Widget build(BuildContext context) {
    if (award_summery != null) {
      award_summery = award_summery!.replaceAll('win', 'برنده');
    }
    if (rank != null) {
      rank = rank!.replaceAll('win', 'برنده');
    }
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
          award_summery == '' || award_summery == null
              ? SizedBox()
              : ScoreItem(title: "جوایز", descirption: "${award_summery}"),
          rank == '' || rank == null
              ? SizedBox()
              : ScoreItem(
                  title: "رتبه",
                  descirption: "${rank}",
                )
        ],
      ),
    );
  }
}
