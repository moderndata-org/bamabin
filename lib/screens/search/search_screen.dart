import 'package:bamabin/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/MyTextButton.dart';
import '../../widgets/details_app_bar.dart';
import '../../widgets/movie_item_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

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
                title: "جستجو"),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10, right: 4),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: cBgGener,
                          border: Border.all(color: cStrokeGrey, width: 3),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextField(
                            style: TextStyle(color: Colors.grey),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.manage_search,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                                hintText: "اسم فیلم یا ...",
                                hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.6)),
                                hintTextDirection: TextDirection.rtl,
                                prefixIcon: Container(
                                  margin: EdgeInsets.only(top: 5, bottom: 5),
                                  child: MyTextButton(
                                      onTap: () {},
                                      size: Size(80, 10),
                                      fgColor: Colors.black,
                                      bgColor: cAccent,
                                      child: Text(
                                        "جستجو",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                                border: InputBorder.none),
                          ))
                        ],
                      ),
                    ),
                    flex: 3,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: MyTextButton(
                        onTap: () {},
                        size: Size(10, 30),
                        fgColor: Colors.black,
                        bgColor: cAccent,
                        child: Text(
                          "پیشرفته",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    flex: 1,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
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
                        isSerial: index % 2 == 0,
                        hasDubbed: true,
                        hasSubtitle: true,
                        imdbRate: '5.5',
                        year: '20${index.toString().padLeft(2, '0')}',
                      )),
            )),
          ],
        ),
      ),
    ));
  }
}
