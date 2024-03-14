import 'dart:async';

import 'package:bamabin/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../controller/detail_controller.dart';
import '../models/film_model.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/movie_item_widget.dart';
import 'part_screen.dart';

class FilterScreen extends GetView<MainController> {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: cPrimary,
      appBar: CustomAppbar(
          title: '${controller.filterScreenTitle.value}',
          icon: Icon(
            Icons.hotel_class_rounded,
            color: cW,
            shadows: [bsTextLowOpacity],
          )),
      body: Obx(() => controller.isLoadingDataFilterScreen.value
          ? ListView(
              padding: EdgeInsets.symmetric(horizontal: 5),
              physics: BouncingScrollPhysics(),
              children: List.generate(
                  5,
                  (index) => Row(
                        children: List.generate(
                            3, (index) => Expanded(child: MovieItemShimmer())),
                      )),
            )
          : Directionality(
              textDirection: TextDirection.rtl,
              child: AlignedGridView.count(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                physics: BouncingScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 4,
                crossAxisSpacing: 0,
                itemCount: controller.listFilterScreen.length,
                itemBuilder: (context, index) {
                  FilmModel fm = controller.listFilterScreen[index];
                  if (index == controller.listFilterScreen.length - 1) {
                    Timer(Duration.zero, () {
                      controller.GetDetailsForFilterScreen();
                    });
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
                        year: '${fm.releaseYear}',
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
              ))),
    ));
  }
}
