import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/order_list_controller.dart';
import 'package:bamabin/models/order_list_model.dart';
import 'package:bamabin/widgets/MyCircularProgress.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/MyTextButton.dart';
import '../../widgets/MyTextField.dart';

class OrderlistEditDialog extends StatefulWidget {
  const OrderlistEditDialog(
      {required this.orderListModel, required this.orderListIndex, super.key});
  final OrderListModel orderListModel;
  final int orderListIndex;

  @override
  State<OrderlistEditDialog> createState() => _OrderlistEditDialogState();
}

class _OrderlistEditDialogState extends State<OrderlistEditDialog> {
  final controller = Get.find<OrderListController>();
  TextEditingController? txtEditlistTitle;
  TextEditingController? txtEditlistDescription;

  @override
  void initState() {
    txtEditlistTitle = TextEditingController()
      ..text = '${widget.orderListModel.title ?? ''}';
    txtEditlistDescription = TextEditingController()
      ..text = '${widget.orderListModel.content ?? ''}';
    super.initState();
  }

  @override
  void dispose() {
    txtEditlistTitle?.dispose();
    txtEditlistDescription?.dispose();
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 40,
              width: Get.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                          splashRadius: 1,
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.cancel,
                            color: cR,
                          ))),
                  Positioned(
                    top: 15,
                    child: MyText(
                      text: 'ویرایش',
                      color: cW,
                      size: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: MyTextField(
                height: 45,
                hint: 'عنوان لیست',
                controller: txtEditlistTitle!,
                maxLines: 1,
                suffixIcon: Icon(
                  Icons.article_rounded,
                  size: 25,
                  color: cW,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: MyTextField(
                height: 70,
                hint: 'توضیحات',
                controller: txtEditlistDescription!,
                maxLines: 3,
                suffixIcon: Icon(
                  Icons.description,
                  size: 25,
                  color: cW,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: MyTextButton(
                      onTap: () => controller.editOrderList(
                          listId: widget.orderListModel.id,
                          title: txtEditlistTitle?.text,
                          content: txtEditlistDescription?.text),
                      size: Size.fromHeight(40),
                      bgColor: cY,
                      child: Obx(() => controller.isLoadingEditOrder.isTrue
                          ? MyCircularProgress(
                              color: cB,
                              size: 25,
                            )
                          : MyText(
                              text: 'ثبت',
                              size: 14,
                              color: cB,
                            ))),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: MyTextButton(
                      onTap: () {
                        Navigator.pop(context);
                        controller.selectedOrderList(widget.orderListModel);
                        controller.selectedOrderIndex(widget.orderListIndex);
                        Get.toNamed('/order-edit-item');
                      },
                      size: Size.fromHeight(40),
                      bgColor: cY,
                      child: MyText(
                        text: 'ویرایش آیتم ها',
                        size: 14,
                        color: cB,
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
