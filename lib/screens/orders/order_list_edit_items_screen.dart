import 'package:bamabin/screens/dialogs/orderlist_add_movie_with_search_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/movie_item_widget.dart';

class OrderlistEditItemsScreen extends StatelessWidget {
  const OrderlistEditItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              shape: CircleBorder(),
              elevation: 10,
              backgroundColor: cSecondaryLight,
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
                color: cW,
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
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: GridView.count(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 50),
                    childAspectRatio: .65,
                    crossAxisCount: 3,
                    children: List.generate(
                        20,
                        (index) => MovieItemWidget(
                              title: 'monarch',
                              isDeleteItem: true,
                            )),
                  ),
                ))));
  }
}
