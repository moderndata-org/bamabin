import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/constant/utils.dart';
import 'package:bamabin/controller/movie_request_controller.dart';
import 'package:bamabin/models/movie_request_movie.dart';
import 'package:bamabin/screens/dialogs/film_request_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/MyTextButton.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_shimmer.dart';
import '../../widgets/request_list_item.dart.dart';

class MovieRequestListScreen extends GetView<MovieRequestController> {
  const MovieRequestListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppbar(
          title: "درخواست فیلم و سریال",
          icon: Icon(
            Icons.video_call_rounded,
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
              child: Obx(() => controller.isLoadingData.isTrue
                  ? ListView.builder(
                      padding: EdgeInsets.only(
                          top: 10, left: 10, right: 10, bottom: 60),
                      itemCount: 10,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                        width: Get.width,
                        child:
                            CustomShimmerWidget(width: Get.width, height: 200),
                        padding: EdgeInsets.symmetric(vertical: 5),
                      ),
                    )
                  : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.listMovieRequest.length,
                      padding: EdgeInsets.only(right: 10, left: 10),
                      itemBuilder: (context, index) {
                        MovieRequestModel mr =
                            controller.listMovieRequest[index];
                        return RequestItem(
                          id: mr.id,
                          condition: switch (mr.status) {
                            'confirmed' => 'تایید شد',
                            'declined' => 'رد شد',
                            'progress' => 'در حال بررسی',
                            String() => '',
                            null => null,
                          },
                          request: mr.title,
                          message: mr.message,
                          date: getPersianDate(dateTime: '${mr.createdAt}'),
                          referral_link:
                              mr.referralLink == '' ? null : mr.referralLink,
                        );
                      },
                    )),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: MyTextButton(
                size: Size(Get.width, 45),
                bgColor: cSecondaryLight,
                child: Text(
                  "درخواست جدید",
                  style: TextStyle(
                      color: cW, fontWeight: FontWeight.bold, fontSize: 15),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    barrierColor: cBgDialogColor,
                    builder: (context) {
                      return FilmRequestDialog();
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
