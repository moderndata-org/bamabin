import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/collection_item.dart';
import 'package:bamabin/widgets/movie_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';

class CollectionsSection extends StatelessWidget {
  const CollectionsSection({super.key});

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
                Icons.video_library,
                color: cW,
              ),
              SizedBox(
                width: 10,
              ),
              MyText(
                text: 'کالکشن ها',
                size: 15,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: Get.width,
            height: 250,
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
