import 'package:bamabin/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/MyTextButton.dart';
import '../../widgets/custom_appbar.dart';
import '../dialogs/search_advanced_dialog.dart';
import '../../widgets/movie_item_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppbar(
          title: 'جستجو',
          icon: Icon(
            Icons.manage_search_rounded,
            color: cW,
            size: 25,
            shadows: [bsText],
          )),
      backgroundColor: cPrimary,
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            // DetailsAppBar(
            //     leftWidget: MyTextButton(
            //         size: const Size(40, 40),
            //         onTap: () {
            //           Get.back();
            //         },
            //         fgColor: cGrey,
            //         bgColor: cPrimaryDark,
            //         child: Icon(
            //           Icons.arrow_back_ios,
            //           color: cGrey,
            //         )),
            //     rightWidget: MyTextButton(
            //         size: const Size(40, 40),
            //         onTap: () {
            //           Get.back();
            //         },
            //         fgColor: cGrey,
            //         bgColor: cPrimaryDark,
            //         child: Icon(
            //           Icons.watch_later,
            //           color: cAccent,
            //         )),
            //     title: "جستجو"),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10, right: 10),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: cSecondary,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: TextField(
                            cursorColor: cW,
                            maxLines: 1,
                            style: TextStyle(color: cW, fontSize: 14),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                                hintText: "اسم فیلم یا ...",
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: cW,
                                    fontWeight: FontWeight.normal),
                                hintTextDirection: TextDirection.rtl,
                                prefixIcon: Container(
                                  margin: EdgeInsets.only(top: 5, bottom: 5),
                                  child: MyTextButton(
                                      padding: EdgeInsets.zero,
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return SearchAdvancedDialog();
                                          },
                                        );
                                      },
                                      size: Size(80, 15),
                                      fgColor: cW,
                                      bgColor: cSecondaryLight,
                                      child: Icon(
                                        Icons.settings_rounded,
                                        color: cW,
                                        shadows: [bsTextLowOpacity],
                                      )),
                                ),
                                border: InputBorder.none),
                          ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  MyTextButton(
                      onTap: () {},
                      size: Size(80, 45),
                      fgColor: cW,
                      bgColor: cSecondaryLight,
                      child: Icon(
                        Icons.search,
                        color: cW,
                        size: 25,
                        shadows: [bsTextLowOpacity],
                      )),
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
              childAspectRatio: .65,
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
          ],
        ),
      ),
    ));
  }
}
