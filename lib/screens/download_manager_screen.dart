import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/controller/download_manager_controller.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../widgets/custom_appbar.dart';

class DownloadManagerScreen extends GetView<DownloadManagerController> {
  const DownloadManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.refreshDownloadList();
    return SafeArea(
        child: Scaffold(
      backgroundColor: cPrimary,
      appBar: CustomAppbar(
          title: 'دانلود‌ها',
          icon: GestureDetector(
            onTap: () => controller.download(),
            child: Icon(
              Icons.download_rounded,
              color: cW,
              shadows: [bsTextLowOpacity],
            ),
          )),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Obx(() => ListView.builder(
              itemCount: controller.listDownloads.length,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemBuilder: (context, index) {
                DownloadTask dltask = controller.listDownloads[index];
                print(dltask.status);
                return DownloadManagerItemWidget(
                  title: dltask.filename,
                  buttonText: dltask.status.toString(),
                  status: dltask.status,
                  onTap: () {
                    // controller.refreshDownloadList();
                    controller.retryDownload(taskId: dltask.taskId);
                    // controller.download();
                  },
                );
              },
            )),
      ),
    ));
  }
}

class DownloadManagerItemWidget extends StatelessWidget {
  const DownloadManagerItemWidget({
    this.onTap,
    this.buttonText,
    this.percent,
    this.speed,
    this.title,
    this.status,
    super.key,
  });

  final Function()? onTap;
  final String? title;
  final String? buttonText;
  final String? speed;
  final double? percent;
  final DownloadTaskStatus? status;

  @override
  Widget build(BuildContext context) {
    var state;
    switch (status) {
      case DownloadTaskStatus.canceled:
        state = 'لغو شده';
        break;
      case DownloadTaskStatus.complete:
        state = 'دانلود شده';
        break;
      case DownloadTaskStatus.enqueued:
        state = 'در صف دانلود';
        break;
      case DownloadTaskStatus.failed:
        state = 'مشکل دارد';
        break;
      case DownloadTaskStatus.paused:
        state = 'متوقف شده';
        break;
      case DownloadTaskStatus.running:
        state = 'در حالدانلود';
        break;
      default:
    }
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: Get.width,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: cW.withOpacity(.7), width: 1)),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: MyText(
                  text: title ?? '',
                  fontWeight: FontWeight.w500,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    textDirection: TextDirection.ltr,
                    text: speed ?? '0 mbps',
                    size: 11,
                    color: cY,
                  ),
                  MyText(
                      textDirection: TextDirection.ltr,
                      text: '$percent%',
                      size: 11),
                ],
              ),
              SizedBox(
                width: 5,
              ),
              MyTextButton(
                  onTap: onTap,
                  bgColor: cSecondaryLight,
                  size: Size(70, 35),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: MyText(
                      text: state ?? 'ادامه',
                      shadows: [bsTextLowOpacity],
                    ),
                  )),
              SizedBox(
                width: 15,
              ),
            ],
          )),
          SizedBox(
            height: 20,
            width: Get.width,
            child: SliderTheme(
                data: SliderThemeData(
                    disabledActiveTrackColor: cW,
                    disabledInactiveTrackColor: cW.withOpacity(.4),
                    trackHeight: 2,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0)),
                child: Slider(
                  thumbColor: Colors.transparent,
                  value: percent ?? 0,
                  min: 0,
                  max: 100,
                  onChanged: null,
                )),
          )
        ],
      ),
    );
  }
}
