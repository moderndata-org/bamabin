import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/collection_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';

class UserListSection extends StatelessWidget {
  const UserListSection({super.key});

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
                Icons.fact_check,
                color: cW,
              ),
              SizedBox(
                width: 10,
              ),
              MyText(
                text: 'لیست مرتبط کاربران',
                size: 15,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: Get.width,
            height: 230,
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CollectionItem(),
                )),
          )
        ],
      ),
    );
  }
}
