import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/movie_item_widget.dart';
import 'dialogs/orderlist_add_list_dialog.dart';

class OrderlistEditItemsScreen extends StatelessWidget {
  const OrderlistEditItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              elevation: 10,
              backgroundColor: cY,
              onPressed: () {
                showDialog(
                  barrierColor: cBgDialogColor,
                  context: context,
                  barrierDismissible: true,
                  builder: (context) => OrderlistAddListDialog(),
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
                  color: cY,
                )),
            body: SizedBox(
                width: Get.width,
                height: Get.height,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: GridView.count(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    childAspectRatio: .58,
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
