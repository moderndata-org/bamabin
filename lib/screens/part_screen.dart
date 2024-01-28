import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/widgets/custom_dropdown.dart';
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
            SizedBox(
              width: Get.width - 2,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                  // Expanded(
                  //     child: FilterDropDown(
                  //   title: "نوع",
                  // )),
                  // Expanded(
                  //   child: FilterDropDown(
                  //     title: "مرتب سازی",
                  //   ),
                  // ),
                  // Expanded(
                  //     child: FilterDropDown(
                  //   title: "امتیاز IMDB",
                  // )),
                  SizedBox(
                    width: 2,
                  ),
                  Expanded(
                      child: CustomDropDown(
                    alignment: Alignment.center,
                    title: 'ژانر',
                    list: ['کمدی', 'عاشقانه', 'علمی', 'تخیلی', 'درام', 'اکشن'],
                  )),
                  SizedBox(
                    width: 1,
                  ),
                  Expanded(
                      child: CustomDropDown(
                    alignment: Alignment.center,
                    title: "مرتب سازی",
                    list: ['1', '2', '3'],
                  )),
                  SizedBox(
                    width: 1,
                  ),
                  Expanded(
                      child: CustomDropDown(
                    alignment: Alignment.center,
                    title: "امتیاز IMDB",
                    list: ['1', '2', '3'],
                  )),
                  SizedBox(
                    width: 2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Expanded(
                child: GridView.count(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10),
              childAspectRatio: .62,
              crossAxisCount: 3,
              children: List.generate(
                  4,
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
