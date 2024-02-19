import 'package:bamabin/controller/detail_controller.dart';
import 'package:bamabin/controller/main_controller.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/movie_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';

class CollectionsSection extends StatelessWidget {
  CollectionsSection({super.key});
  var detailController = Get.find<DetailController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: cPrimaryDark,
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.video_library,
                color: cW,
              ),
              SizedBox(
                width: 10,
              ),
              MyText(
                text: 'کالکشن ها',
                size: 15,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: Get.width,
            height: 200,
            child: Obx(() {
              return Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    physics: BouncingScrollPhysics(),
                    itemCount: detailController
                        .selectedFilm.value.collection_posts!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var film = detailController
                          .selectedFilm.value.collection_posts![index];
                      return MovieItemWidget(
                        title: '${film.titleMovie}',
                        hasDubbed: film.hasDubbed != '',
                        hasSubtitle: film.hasSubtitle == 'on',
                        imdbRate: '${film.imdbRate}',
                        year: film.release!.length > 0
                            ? '${film.release?.first.name}'
                            : '',
                        image: film.thumbnail,
                        onTap: () {
                          var detail = Get.find<DetailController>();
                          detail.selectedFilm(film);
                          Get.toNamed('/movie-detail');
                        },
                      );
                    },
                  ));
            }),
          )
        ],
      ),
    );
  }
}
