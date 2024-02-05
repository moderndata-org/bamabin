import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/detail_controller.dart';
import 'package:bamabin/controller/main_controller.dart';
import 'package:bamabin/widgets/MyText.dart';
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
                    list: [
                      DropdownMenuItem(
                          value: 0,
                          onTap: () {},
                          child: Center(
                            child: MyText(
                              text: 'ژانر',
                              textAlign: TextAlign.center,
                            ),
                          ))
                    ],
                  )),
                  SizedBox(
                    width: 1,
                  ),
                  Expanded(
                      child: Obx(() => CustomDropDown(
                            onTap: () {},
                            alignment: Alignment.center,
                            title: switch (controller.selectedOrder.value) {
                              OrderBy.none => "مرتب سازی",
                              OrderBy.date => 'زمان انتشار',
                              OrderBy.imdb => 'براساس imdb',
                              OrderBy.modified => 'به‌روزرسانی',
                            },
                            list: [
                              DropdownMenuItem(
                                  value: 0,
                                  onTap: () => controller.changeOrder(
                                      orderBy: OrderBy.date),
                                  child: Center(
                                      child: MyText(text: 'زمان انتشار'))),
                              DropdownMenuItem(
                                  value: 1,
                                  onTap: () => controller.changeOrder(
                                      orderBy: OrderBy.modified),
                                  child: Center(
                                      child: MyText(text: 'به‌روزرسانی'))),
                              DropdownMenuItem(
                                  value: 2,
                                  onTap: () => controller.changeOrder(
                                      orderBy: OrderBy.imdb),
                                  child: Center(
                                      child: MyText(
                                    text: 'براساس امتیاز imdb',
                                    textAlign: TextAlign.center,
                                  ))),
                            ],
                          ))),
                  SizedBox(
                    width: 1,
                  ),
                  Expanded(
                      child: CustomDropDown(
                    alignment: Alignment.center,
                    title: "امتیاز IMDB",
                    list: [
                      DropdownMenuItem(
                          value: 0,
                          onTap: () {},
                          child: Center(
                            child: MyText(
                                text: "امتیاز IMDB",
                                textAlign: TextAlign.center),
                          ))
                    ],
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
                child: Obx(() => controller.isShowShimmer.value
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
                          physics: BouncingScrollPhysics(),
                          crossAxisCount: 3,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 0,
                          itemCount: controller.selectedList.length,
                          itemBuilder: (context, index) {
                            // print(index);
                            FilmModel fm = controller.selectedList[index];
                            // print('${fm.release?.first.name}');
                            if (index == controller.selectedList.length - 1) {
                              controller.getArchive(isFirstPage: false);
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
                        )
                        //!
                        //     ListView(
                        //   children: List.generate(
                        //       controller.selectedList.length % 3 != 0
                        //           ? (controller.selectedList.length ~/ 3) + 1
                        //           : controller.selectedList.length ~/ 3,
                        //       (index) {
                        //     print(controller.selectedList.length % 3 != 0);
                        //     print((controller.selectedList.length ~/ 3) + 1);
                        //     print((controller.selectedList.length ~/ 3));
                        //     List<Widget> listWidgets = [];
                        //     FilmModel fm = controller.selectedList[index];
                        //     listWidgets.add(MovieItemWidget(
                        //       title: '${fm.titleMovie}',
                        //       hasDubbed: fm.hasDubbed != '',
                        //       hasSubtitle: fm.hasSubtitle == 'on',
                        //       imdbRate: '${fm.imdbRate}',
                        //       year: fm.release != null
                        //           ? '${fm.release?[0].name}'
                        //           : '',
                        //       image: fm.thumbnail,
                        //     ));
                        //     if (index + 1 <=
                        //         controller.selectedList.length - 1) {
                        //       fm = controller.selectedList[index + 1];
                        //       index + 1 <= controller.selectedList.length - 1
                        //           ? listWidgets.add(MovieItemWidget(
                        //               title: '${fm.titleMovie}',
                        //               hasDubbed: fm.hasDubbed != '',
                        //               hasSubtitle: fm.hasSubtitle == 'on',
                        //               imdbRate: '${fm.imdbRate}',
                        //               year: fm.release != null
                        //                   ? '${fm.release?[0].name}'
                        //                   : '',
                        //               image: fm.thumbnail,
                        //             ))
                        //           : SizedBox();
                        //     }
                        //     if (index + 2 <=
                        //         controller.selectedList.length - 1) {
                        //       fm = controller.selectedList[index + 2];
                        //       index + 2 <= controller.selectedList.length - 1
                        //           ? listWidgets.add(MovieItemWidget(
                        //               title: '${fm.titleMovie}',
                        //               hasDubbed: fm.hasDubbed != '',
                        //               hasSubtitle: fm.hasSubtitle == 'on',
                        //               imdbRate: '${fm.imdbRate}',
                        //               year: fm.release != null
                        //                   ? '${fm.release?[0].name}'
                        //                   : '',
                        //               image: fm.thumbnail,
                        //             ))
                        //           : SizedBox();
                        //     }

                        //     return Row(
                        //       children: listWidgets,
                        //     );
                        //   }),
                        // )
                        // !
                        //     GridView.count(
                        //   physics: BouncingScrollPhysics(),
                        //   padding: EdgeInsets.symmetric(horizontal: 5),
                        //   childAspectRatio: .63,
                        //   crossAxisCount: 3,
                        //   children: List.generate(
                        //       controller.selectedList.length, (index) {
                        //     FilmModel fm = controller.selectedList[index];
                        //     print(index);
                        //     if (index == controller.selectedList.length - 1) {
                        //       controller.getArchive(isFirstPage: false);
                        //     }
                        //     return MovieItemWidget(
                        //       title: '${fm.titleMovie}',
                        //       hasDubbed: fm.hasDubbed != '',
                        //       hasSubtitle: fm.hasSubtitle == 'on',
                        //       imdbRate: '5.5',
                        //       year: '20${index.toString().padLeft(2, '0')}',
                        //       image: fm.thumbnail,
                        //     );
                        //   }),
                        // ),
                        )))
          ],
        ),
      ),
    ));
  }
}
