import 'package:bamabin/controller/order_list_controller.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:bamabin/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
import '../../models/film_model.dart';
import '../../widgets/MyTextField.dart';
import '../../widgets/movie_item_widget.dart';

class OrderlistAddMovieWithSearchDialog extends StatefulWidget {
  const OrderlistAddMovieWithSearchDialog({super.key});

  @override
  State<OrderlistAddMovieWithSearchDialog> createState() =>
      _OrderlistAddMovieWithSearchDialogState();
}

class _OrderlistAddMovieWithSearchDialogState
    extends State<OrderlistAddMovieWithSearchDialog> {
  TextEditingController? txtSearch;
  final controller = Get.find<OrderListController>();

  @override
  void initState() {
    txtSearch = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    txtSearch?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: cB,
      surfaceTintColor: cB,
      elevation: 20,
      backgroundColor: cPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 20),
                    child: SizedBox(
                      height: 40,
                      child: MyTextField(
                        controller: txtSearch!,
                        action: TextInputAction.search,
                        onActionClicked: (text) {
                          if (txtSearch!.text.trim().length > 0) {
                            controller.search(
                                isFirstPage: true, txtSearch: txtSearch!.text);
                          }
                        },
                        height: 45,
                        textDirection: TextDirection.rtl,
                        hint: '...جستجو',
                        maxLines: 1,
                        suffixIcon: Icon(
                          Icons.article_rounded,
                          size: 25,
                          color: cW,
                        ),
                      ),
                    ),
                  ),
                ),
                MyTextButton(
                    onTap: () {
                      if (txtSearch!.text.trim().length > 0) {
                        controller.search(
                            isFirstPage: true, txtSearch: txtSearch!.text);
                      }
                    },
                    bgColor: cSecondaryLight,
                    size: Size(40, 40),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                            top: 0,
                            left: -4,
                            child: Icon(
                              Icons.search,
                              color: cW,
                            )),
                      ],
                    )),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            Expanded(
                child: Obx(() => controller.isShowShimmerSearch.value
                    ? GridView.count(
                        physics: BouncingScrollPhysics(),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        childAspectRatio: .69,
                        crossAxisCount: 2,
                        children: List.generate(
                            20,
                            (index) => LayoutBuilder(
                                  builder: (context, constraints) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomShimmerWidget(
                                        width: constraints.maxWidth,
                                        height: 120),
                                  ),
                                )),
                      )
                    : Directionality(
                        textDirection: TextDirection.rtl,
                        child: AlignedGridView.count(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          physics: BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 5,
                          itemCount: controller.listSearch.length,
                          itemBuilder: (context, index) {
                            // print(index);
                            FilmModel fm = controller.listSearch[index];
                            // print('${fm.release?.first.name}');
                            if (index == controller.listSearch.length - 1) {
                              controller.search(
                                  isFirstPage: false,
                                  txtSearch: controller.searchText);
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
                                  isAddItem: true,
                                  onTap: () {
                                    controller.addItemOrder(
                                        filmModel: fm, index: index);
                                  },
                                );
                              },
                            );
                          },
                        )))),
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
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
