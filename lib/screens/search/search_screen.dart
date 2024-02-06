import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../controller/detail_controller.dart';
import '../../models/film_model.dart';
import '../../widgets/MyTextButton.dart';
import '../../widgets/custom_appbar.dart';
import '../dialogs/search_advanced_dialog.dart';
import '../../widgets/movie_item_widget.dart';

class SearchScreen extends GetView<PublicController> {
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
                            controller: controller.txtSearch,
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
                      onTap: () {
                        if (controller.txtSearch.text.trim().length > 0) {
                          controller.search(isFirstPage: true);
                          print('hoy');
                        }
                      },
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
                child: Obx(() => controller.isShowShimmerSearch.value
                    ? ListView(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        physics: BouncingScrollPhysics(),
                        children: List.generate(
                            5,
                            (index) => Row(
                                  children: List.generate(
                                      3,
                                      (index) => Expanded(
                                              child: Shimmer(
                                            direction: ShimmerDirection.ltr,
                                            period: Duration(seconds: 3),
                                            enabled: true,
                                            gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 52, 52, 52),
                                                  Color.fromARGB(
                                                      255, 93, 93, 93),
                                                  Color.fromARGB(
                                                      255, 52, 52, 52),
                                                ]),
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 5),
                                                  height: 200,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    width: 70,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ))),
                                )),
                      )
                    : Directionality(
                        textDirection: TextDirection.rtl,
                        child: AlignedGridView.count(
                          physics: BouncingScrollPhysics(),
                          crossAxisCount: 3,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 0,
                          itemCount: controller.listSearch.length,
                          itemBuilder: (context, index) {
                            // print(index);
                            FilmModel fm = controller.listSearch[index];
                            // print('${fm.release?.first.name}');
                            if (index == controller.listSearch.length - 1) {
                              controller.search(isFirstPage: false);
                            }
                            return LayoutBuilder(
                              builder: (context, constraints) {
                                var width = constraints.maxWidth - 5;
                                var height = constraints.maxWidth + 100;
                                return MovieItemWidget(
                                  width: width,
                                  height: height,
                                  title: '${fm.titleMovie}',
                                  hasDubbed: fm.hasDubbed != '',
                                  hasSubtitle: fm.hasSubtitle == 'on',
                                  imdbRate: '${fm.imdbRate}',
                                  year: '${fm.releaseMovie}',
                                  image: fm.thumbnail,
                                  onTap: () {
                                    var detail = Get.put(DetailController());
                                    detail.selectedFilm(fm);
                                    Get.toNamed('/movie-detail');
                                  },
                                );
                              },
                            );
                          },
                        ))))
          ],
        ),
      ),
    ));
  }
}
