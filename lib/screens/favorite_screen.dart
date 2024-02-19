import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/favorite_controller.dart';
import 'package:bamabin/widgets/custom_appbar.dart';
import 'package:bamabin/widgets/movie_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../controller/detail_controller.dart';
import '../models/film_model.dart';

class FavoriteScreen extends GetView<FavoriteController> {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: cPrimary,
            appBar: CustomAppbar(
                title: 'علاقه مندی ها',
                icon: Icon(
                  Icons.favorite,
                  color: cW,
                  shadows: [bsTextLowOpacity],
                )),
            body: SizedBox(
                width: Get.width,
                height: Get.height,
                child: Obx(() => controller.isLoadingFavorites.value
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          physics: BouncingScrollPhysics(),
                          crossAxisCount: 3,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 0,
                          itemCount: controller.listFavorites.length,
                          itemBuilder: (context, index) {
                            FilmModel fm = controller.listFavorites[index];
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
                        ))))));
  }
}
