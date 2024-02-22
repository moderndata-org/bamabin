import 'package:bamabin/constant/utils.dart';
import 'package:bamabin/controller/order_list_controller.dart';
import 'package:bamabin/models/order_list_model.dart';
import 'package:bamabin/screens/orders/order_list_show_items_dialog.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:bamabin/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
import '../../widgets/custom_appbar.dart';
import 'orderlist_add_dialog.dart';
import 'orderlist_edit_dialog.dart';

class OrderlistScreen extends StatefulWidget {
  const OrderlistScreen({super.key});

  @override
  State<OrderlistScreen> createState() => _OrderlistScreenState();
}

class _OrderlistScreenState extends State<OrderlistScreen> {
  final controller = Get.find<OrderListController>();
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
            builder: (context) => OrderlistAddDialog(),
          );
        },
        child: Icon(
          Icons.add_rounded,
          color: cB,
        ),
      ),
      backgroundColor: cPrimary,
      appBar: CustomAppbar(
          title: 'لیست سفارشی',
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
            child: Obx(() => controller.isLoadingOrderLists.isTrue
                ? ListView.builder(
                    padding: EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 60),
                    itemCount: 10,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                      width: Get.width,
                      child: CustomShimmerWidget(width: Get.width, height: 200),
                      padding: EdgeInsets.symmetric(vertical: 5),
                    ),
                  )
                : controller.orderList.isEmpty
                    ? Center(
                        child: MyText(text: 'اطلاعاتی یافت نشد'),
                      )
                    : ListView.builder(
                        itemCount: controller.orderList.length,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(
                            top: 10, left: 10, right: 10, bottom: 60),
                        itemBuilder: (context, index) {
                          OrderListModel ol = controller.orderList[index];
                          return OrderItemWidget(
                            title: '${ol.title}',
                            itemCount: '${ol.posts?.length}',
                            // type: 'فیلم',
                            date: '${ol.persianDate}',
                            delete: () =>
                                controller.deleteOrderList(listId: '${ol.id}'),
                            show: () {
                              if (ol.posts!.isNotEmpty) {
                                showDialog(
                                  barrierColor: cBgDialogColor,
                                  context: context,
                                  builder: (context) =>
                                      OrderListShowItemsDialog(
                                          listFilms: ol.posts!),
                                );
                              } else {
                                showMessage(
                                    text: 'لیست شما خالی میباشد',
                                    isSucces: false);
                              }
                            },
                            edit: () => showDialog(
                              barrierColor: cBgDialogColor,
                              context: context,
                              builder: (context) => OrderlistEditDialog(
                                  orderListModel: ol, orderListIndex: index),
                            ),
                          );
                        },
                      )),
          )),
    ));
  }
}

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({
    this.title = '',
    // this.type = '',
    this.itemCount = '',
    this.date = '',
    this.show,
    this.edit,
    this.delete,
    super.key,
  });
  final String? title;
  // final String? type;
  final String? itemCount;
  final String? date;
  final Function()? show;
  final Function()? delete;
  final Function()? edit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: cSecondary),
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(children: [
        OrderlistSmallItemWidget(
          title: 'عنوان',
          subject: title,
        ),
        // OrderlistSmallItemWidget(
        //   title: 'نوع',
        //   subject: '$type',
        // ),
        OrderlistSmallItemWidget(
          title: 'تعداد آیتم',
          subject: '$itemCount',
        ),
        OrderlistSmallItemWidget(
          title: 'تاریخ ایجاد',
          subject: '$date',
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          textDirection: TextDirection.rtl,
          children: [
            Expanded(
                child: MyTextButton(
                    onTap: show,
                    size: Size.fromHeight(35),
                    bgColor: cSecondaryLight,
                    child: MyText(
                      text: 'مشاهده',
                      size: 14,
                      color: cW,
                      shadows: [bsText],
                    ))),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: MyTextButton(
                    onTap: edit,
                    size: Size.fromHeight(35),
                    bgColor: cSecondaryLight,
                    child: MyText(
                      text: 'ویرایش',
                      size: 14,
                      color: cW,
                      shadows: [bsText],
                    ))),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: MyTextButton(
                    onTap: delete,
                    size: Size.fromHeight(35),
                    bgColor: cPink,
                    child: MyText(
                      text: 'حذف',
                      size: 14,
                      color: cW,
                      shadows: [bsText],
                    ))),
          ],
        )
      ]),
    );
  }
}

class OrderlistSmallItemWidget extends StatelessWidget {
  const OrderlistSmallItemWidget({
    super.key,
    this.title,
    this.subject,
  });

  final String? title;
  final String? subject;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          MyText(
            text: '$title :',
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
              child: MyText(
            text: '$subject',
            textAlign: TextAlign.left,
          ))
        ],
      ),
    );
  }
}
