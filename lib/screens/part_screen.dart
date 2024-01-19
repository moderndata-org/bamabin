import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/widgets/filter_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/movie_item_widget.dart';

class PartScreen extends StatelessWidget {
  const PartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: cPrimary,
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            // Filter Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                    child: FilterDropDown(
                  title: "نوع",
                )),
                Expanded(
                  child: FilterDropDown(
                    title: "مرتب سازی",
                  ),
                ),
                Expanded(
                    child: FilterDropDown(
                  title: "امتیاز IMDB",
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            Expanded(
                child: GridView.count(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10),
              childAspectRatio: .58,
              crossAxisCount: 3,
              children: List.generate(
                  20,
                  (index) => MovieItemWidget(
                        title: 'Monarch',
                        hasDubbed: true,
                        hasSubtitle: true,
                        imdbRate: '5.5',
                        year: '20${index.toString().padLeft(2, '0')}',
                      )),
            ))
          ],
        ),
      ),
    ));
  }
}
