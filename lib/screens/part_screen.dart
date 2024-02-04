import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/main_controller.dart';
import 'package:bamabin/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../models/film_model.dart';
import '../widgets/movie_item_widget.dart';

class PartScreen extends GetView<MainController> {
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
                child: Obx(() => controller.isLoadingItems.value
                    ? ListView(
                        padding: EdgeInsets.symmetric(horizontal: 5),
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
                          // physics: BouncingScrollPhysics(),
                          crossAxisCount: 3,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          itemCount: controller.selectedList.length,
                          itemBuilder: (context, index) {
                            print(index);
                            FilmModel fm = controller.selectedList[index];
                            return MovieItemWidget(
                              title: '${fm.titleMovie}',
                              hasDubbed: fm.hasDubbed != '',
                              hasSubtitle: fm.hasSubtitle == 'on',
                              imdbRate: '5.5',
                              year: '20${index.toString().padLeft(2, '0')}',
                              image: fm.thumbnail,
                            );
                          },
                        )
                        //!
                        // ListView(
                        //   children: List.generate(
                        //       controller.selectedList.length % 3 != 0
                        //           ? (controller.selectedList.length ~/ 3) + 1
                        //           : controller.selectedList.length ~/ 3,
                        //       (index) {
                        //     FilmModel fm = controller.selectedList[index];
                        //     List<Widget> listWidgets = [];
                        //     if (index)
                        //       return Row(
                        //         children: index % 3 == 0 ? listWidgets : [],
                        //       );
                        //   }),
                        // )
                        //!
                        //     NotificationListener<ScrollNotification>(
                        //   onNotification: (scrollNotification) {
                        //     // print(scrollNotification.metrics.pixels);
                        //     // print(scrollNotification.metrics.maxScrollExtent);
                        //     if (scrollNotification.metrics.pixels ==
                        //         scrollNotification.metrics.maxScrollExtent) {
                        //       print('YES');
                        //       controller.getArchive(isFirstPage: false);
                        //     }
                        //     return true;
                        //   },
                        //   child: GridView.count(
                        //     physics: BouncingScrollPhysics(),
                        //     padding: EdgeInsets.symmetric(horizontal: 5),
                        //     childAspectRatio: .63,
                        //     crossAxisCount: 3,
                        //     children: List.generate(
                        //         controller.selectedList.length, (index) {
                        //       FilmModel fm = controller.selectedList[index];
                        //       return MovieItemWidget(
                        //         title: '${fm.titleMovie}',
                        //         hasDubbed: fm.hasDubbed != '',
                        //         hasSubtitle: fm.hasSubtitle == 'on',
                        //         imdbRate: '5.5',
                        //         year: '20${index.toString().padLeft(2, '0')}',
                        //         image: fm.thumbnail,
                        //       );
                        //     }),
                        //   ),
                        // ),
                        )))
          ],
        ),
      ),
    ));
  }
}
