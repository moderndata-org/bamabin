import 'package:bamabin/controller/order_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../constant/colors.dart';
import '../../controller/detail_controller.dart';
import '../../models/film_model.dart';
import '../../widgets/MyText.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/movie_item_widget.dart';
import 'orderlist_add_movie_with_search_dialog.dart';

class OrderlistEditItemsScreen extends GetView<OrderListController> {
  const OrderlistEditItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              shape: CircleBorder(),
              elevation: 10,
              backgroundColor: cY,
              onPressed: () {
                showDialog(
                  barrierColor: cBgDialogColor,
                  context: context,
                  barrierDismissible: true,
                  builder: (context) => OrderlistAddMovieWithSearchDialog(),
                );
              },
              child: Icon(
                Icons.add_rounded,
                color: cB,
              ),
            ),
            backgroundColor: cPrimary,
            appBar: CustomAppbar(
                title: 'ویرایش آیتم ها',
                icon: Icon(
                  Icons.folder_special_rounded,
                  color: cW,
                  shadows: [bsTextLowOpacity],
                )),
            body: SizedBox(
                width: Get.width,
                height: Get.height,
                child: Obx(() => controller.isLoadingDetails.value
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
                    : controller.selectedOrderList.value.posts!.isEmpty
                        ? Center(
                            child: MyText(text: 'اطلاعاتی یافت نشد'),
                          )
                        : Directionality(
                            textDirection: TextDirection.rtl,
                            child: AlignedGridView.count(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              physics: BouncingScrollPhysics(),
                              crossAxisCount: 3,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 0,
                              itemCount: controller
                                  .selectedOrderList.value.posts!.length,
                              itemBuilder: (context, index) {
                                FilmModel fm = controller
                                    .selectedOrderList.value.posts![index];
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
                                      isDeleteItem: true,
                                      onTap: () {
                                        controller.deleteItemOrder(
                                            film_id: '${fm.id}', index: index);
                                      },
                                    );
                                  },
                                );
                              },
                            ))))));
  }
}
