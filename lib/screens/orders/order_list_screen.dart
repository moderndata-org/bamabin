import 'package:bamabin/screens/dialogs/orderlist_add_list_dialog.dart';
import 'package:bamabin/screens/dialogs/orderlist_edit_list_dialog.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
import '../../widgets/custom_appbar.dart';

class OrderlistScreen extends StatefulWidget {
  const OrderlistScreen({super.key});

  @override
  State<OrderlistScreen> createState() => _OrderlistScreenState();
}

class _OrderlistScreenState extends State<OrderlistScreen> {
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
            builder: (context) => OrderlistAddListDialog(),
          );
        },
        child: Icon(
          Icons.add_rounded,
          color: cW,
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
            child: ListView.builder(
              itemCount: 10,
              physics: BouncingScrollPhysics(),
              padding:
                  EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 60),
              itemBuilder: (context, index) => OrderItemWidget(
                title: 'لیست جدید من',
                itemCount: '2',
                type: 'فیلم',
                date: '1402/10/22',
                edit: () => showDialog(
                  barrierColor: cBgDialogColor,
                  context: context,
                  builder: (context) => OrderlistEditListDialog(),
                ),
              ),
            ),
          )),
    ));
  }
}

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({
    this.title = '',
    this.type = '',
    this.itemCount = '',
    this.date = '',
    this.show,
    this.edit,
    this.delete,
    super.key,
  });
  final String? title;
  final String? type;
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
        OrderlistSmallItemWidget(
          title: 'نوع',
          subject: '$type',
        ),
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
