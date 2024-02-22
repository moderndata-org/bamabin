import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/detail_controller.dart';
import 'package:bamabin/controller/main_controller.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/models/genre_model.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../models/film_model.dart';
import '../widgets/movie_item_widget.dart';

class PartScreen extends GetView<MainController> {
  PartScreen({Key? key}) : super(key: key);
  final publicController = Get.find<PublicController>();

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
                      child: Obx(() => CustomDropDown(
                            alignment: Alignment.center,
                            title:
                                '${controller.selectedGenre.value.name ?? 'ژانر'}',
                            list: List.generate(
                                publicController.listGenre.length, (index) {
                              Genre gen = publicController.listGenre[index];
                              return DropdownMenuItem(
                                  value: index,
                                  onTap: () {
                                    controller.changeGenre(gener: gen);
                                  },
                                  child: Center(
                                    child: MyText(
                                      text: '${gen.name}',
                                      textAlign: TextAlign.center,
                                    ),
                                  ));
                            }),
                          ))),
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
                      child: Obx(() => CustomDropDown(
                            alignment: Alignment.center,
                            title:
                                '${controller.selectedImdbRate.value == 0 ? "امتیاز IMDB" : controller.selectedImdbRate.value}',
                            list: List.generate(
                                10,
                                (index) => DropdownMenuItem(
                                    value: index,
                                    onTap: () => controller.changeImdbRate(
                                        imdbRate: index + 1),
                                    child: Center(
                                      child: MyText(
                                          text: '${index + 1}',
                                          textAlign: TextAlign.center),
                                    ))),
                          ))),
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
                                      (index) =>
                                          Expanded(child: MovieItemShimmer())),
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
                                    var detail = Get.find<DetailController>();
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

class MovieItemShimmer extends StatelessWidget {
  const MovieItemShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      direction: ShimmerDirection.ltr,
      period: Duration(seconds: 3),
      enabled: true,
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 52, 52, 52),
            Color.fromARGB(255, 93, 93, 93),
            Color.fromARGB(255, 52, 52, 52),
          ]),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(left: 5),
              width: 70,
              height: 10,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
            ),
          )
        ],
      ),
    );
  }
}
