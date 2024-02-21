import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../controller/detail_controller.dart';
import '../../models/film_model.dart';
import '../../widgets/MyTextButton.dart';
import '../../widgets/movie_item_widget.dart';

class OrderListShowItemsDialog extends StatelessWidget {
  const OrderListShowItemsDialog({required this.listFilms, super.key});
  final List<FilmModel> listFilms;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: cB,
      surfaceTintColor: cB,
      elevation: 20,
      backgroundColor: cPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: Get.width,
              child: listFilms.isEmpty
                  ? Center(
                      child: MyText(text: 'اطلاعاتی یافت نشد'),
                    )
                  : Directionality(
                      textDirection: TextDirection.rtl,
                      child: AlignedGridView.count(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        physics: BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 0,
                        itemCount: listFilms.length,
                        itemBuilder: (context, index) {
                          FilmModel fm = listFilms[index];
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
                      )),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: Get.width,
              child: MyTextButton(
                  onTap: () => Navigator.pop(context),
                  bgColor: cY,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.rtl,
                    children: [
                      MyText(
                        text: 'برگشت',
                        padding: EdgeInsets.only(top: 3),
                        color: cB,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: cB,
                          size: 20,
                        ),
                      )
                    ],
                  )),
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
