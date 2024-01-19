import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../widgets/MyTextButton.dart';
import '../widgets/details_app_bar.dart';
import '../widgets/movie_item_widget.dart';

class RecentViewsScreen extends StatelessWidget {
  const RecentViewsScreen({Key? key}) : super(key: key);

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
                      Icons.watch_later,
                      color: cAccent,
                    )),
                title: "لیست مشاهده های اخیر"),
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
            )),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 13),
                decoration: BoxDecoration(color: Colors.redAccent),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "حذف تاریخچه",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.delete_sweep,
                        color: Colors.black,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
