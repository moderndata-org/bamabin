import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/screens/part_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:bamabin/controller/main_controller.dart';
import 'package:shimmer/shimmer.dart';
import '../controller/detail_controller.dart';
import '../models/film_model.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/movie_item_widget.dart';

class MoreScreen extends StatelessWidget {
  MoreScreen({Key? key}) : super(key: key);
  final mainController = Get.find<MainController>();
  final publicController = Get.find<PublicController>();

  var title = Get.arguments["title"];
  var filter_key = Get.arguments["filter_key"];
  var filter_value = Get.arguments["filter_value"];

  void init() {
    if (filter_key != "type") {
      mainController.taxonomypageNumber = 1;
      mainController.getTaxonomy(filter_key, filter_value.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => init());
    return SafeArea(
      child: Scaffold(
        backgroundColor: cPrimary,
        appBar: CustomAppbar(
            title: '${title}',
            icon: Icon(
              Icons.hotel_class_rounded,
              color: cW,
              shadows: [bsTextLowOpacity],
            )),
        body: Container(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Expanded(
                  child: Obx(() => mainController.isShowShimmer.value
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
                            itemCount: mainController.moreFilmList.length,
                            itemBuilder: (context, index) {
                              FilmModel fm = mainController.moreFilmList[index];
                              return LayoutBuilder(
                                builder: (context, constraints) {
                                  var width = constraints.maxWidth - 5;
                                  var height = constraints.maxWidth + 100;
                                  if (index ==
                                      mainController.moreFilmList.length - 1) {
                                    if (filter_key != "type") {
                                      mainController.taxonomypageNumber += 1;
                                      mainController.getTaxonomy(
                                          filter_key, filter_value.toString());
                                    }
                                  }
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
                          ))))
            ],
          ),
        ),
      ),
    );
  }
}
