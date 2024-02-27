import 'package:bamabin/controller/recent_controller.dart';
import 'package:bamabin/models/recent_model.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../controller/detail_controller.dart';
import '../models/film_model.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/movie_item_widget.dart';

class RecentViewsScreen extends GetView<RecentContoller> {
  const RecentViewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppbar(
          title: "لیست مشاهده های اخیر",
          icon: Icon(
            Icons.watch_later_rounded,
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
            Expanded(
                child: Obx(() => controller.listFilm.isEmpty
                    ? Center(
                        child: MyText(text: 'اطلاعاتی یافت نشد'),
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
                          itemCount: controller.listFilm.length,
                          itemBuilder: (context, index) {
                            RecentModel rm = controller.listFilm[index];
                            return LayoutBuilder(
                              builder: (context, constraints) {
                                var width = constraints.maxWidth - 5;
                                var height = constraints.maxWidth + 100;
                                return MovieItemWidget(
                                  width: width,
                                  height: height,
                                  title: '${rm.title}',
                                  hasDubbed: rm.hasDubbed != '',
                                  hasSubtitle: rm.hasSubtitle == 'on',
                                  imdbRate: '${rm.imdb}',
                                  year: '${rm.year}',
                                  image: rm.cover,
                                  onTap: () {
                                    var detail = Get.find<DetailController>();
                                    FilmModel fm = FilmModel(
                                        id: rm.id,
                                        title: rm.title,
                                        imdbRate: rm.imdb,
                                        thumbnail: rm.cover,
                                        bgThumbnail: rm.bg_cover,
                                        faTitle: rm.title,
                                        enTitle: rm.title,
                                        releaseYear: rm.year,
                                        trailer_url: '',
                                        faSummary: '',
                                        collection_posts: [],
                                        actors: [],
                                        related_posts: [],
                                        directors: []);
                                    detail.selectedFilm(fm);
                                    Get.toNamed('/movie-detail');
                                  },
                                );
                              },
                            );
                          },
                        )))),
            SizedBox(
              height: 50,
              width: Get.width,
              child: InkWell(
                onTap: () => controller.deleteAllRecents(),
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 13),
                  decoration: BoxDecoration(color: Colors.redAccent),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "حذف تاریخچه",
                          style: TextStyle(
                              color: cW,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.delete_sweep,
                          color: cW,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
