import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                    child: MyTextField(
                      controller: txtSearch!,
                      height: 45,
                      textDirection: TextDirection.rtl,
                      hint: '...جستجو',
                      maxLines: 1,
                      suffixIcon: Icon(
                        Icons.article_rounded,
                        size: 25,
                        color: cGrey,
                      ),
                    ),
                  ),
                ),
                MyTextButton(
                    onTap: () {},
                    bgColor: cY,
                    size: Size(40, 40),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                            top: 0,
                            left: -4,
                            child: Icon(
                              Icons.manage_search,
                              color: cB,
                            )),
                      ],
                    )),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            Expanded(
                child: GridView.count(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              childAspectRatio: .69,
              crossAxisCount: 2,
              children: List.generate(
                  20,
                  (index) => MovieItemWidget(
                        title: 'Monarch',
                        isSerial: index % 2 == 0,
                        isAddItem: true,
                      )),
            )),
            MyTextButton(
                size: Size(Get.width * .7, 35),
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
                ))
          ],
        ),
      ),
    );
  }
}
