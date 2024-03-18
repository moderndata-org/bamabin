import 'dart:io';

import 'package:bamabin/constant/utils.dart';
import 'package:bamabin/controller/download_manager_controller.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../widgets/custom_appbar.dart';

class DownloadManagerScreen extends StatefulWidget {
  const DownloadManagerScreen({super.key});

  @override
  State<DownloadManagerScreen> createState() => _DownloadManagerScreenState();
}

class _DownloadManagerScreenState extends State<DownloadManagerScreen> {
  final DownloadManagerController controller =
      Get.find<DownloadManagerController>();
  @override
  Widget build(BuildContext context) {
    controller.refreshDownloadList();
    return SafeArea(
        child: Scaffold(
      backgroundColor: cPrimary,
      appBar: CustomAppbar(
          title: 'دانلود‌ها',
          icon: Icon(
            Icons.download_rounded,
            color: cW,
            shadows: [bsTextLowOpacity],
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
                return DownloadManagerItemWidget(
                  title: dltask.filename ?? '${dltask.url}',
                  status: dltask.status,
                  percent: dltask.progress,
                  onTap: () async {
                    File f = File('${dltask.savedDir}/${dltask.filename}');
                    bool isExist = await f.exists();
                    if (isExist) {
                      switch (dltask.status) {
                        case DownloadTaskStatus.complete:
                          await FlutterDownloader.open(taskId: dltask.taskId);
                          break;
                        case DownloadTaskStatus.failed:
                          FlutterDownloader.remove(taskId: dltask.taskId);
                          FlutterDownloader.enqueue(
                              url: dltask.url,
                              savedDir: dltask.savedDir,
                              fileName: dltask.filename,
                              openFileFromNotification: false,
                              showNotification: true);
                          break;
                        case DownloadTaskStatus.paused:
                          {
                            await FlutterDownloader.resume(
                                taskId: dltask.taskId);
                            break;
                          }
                        case DownloadTaskStatus.enqueued ||
                              DownloadTaskStatus.running:
                          FlutterDownloader.pause(taskId: dltask.taskId);
                          break;
                        default:
                      }
                    } else {
                      if (DateTime.now()
                              .difference(controller.lastTimeShowMessage) >
                          Duration(seconds: 3)) {
                        controller.lastTimeShowMessage = DateTime.now();
                        showMessage(
                            text: 'فایل بر روی دستگاه وجود ندارد',
                            isSucces: false);
                        FlutterDownloader.remove(taskId: dltask.taskId);
                      }
                    }
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
    this.percent = 0,
    this.title,
    this.status,
    super.key,
  });

  final Function()? onTap;
  final String? title;
  final int? percent;
  final DownloadTaskStatus? status;

  @override
  Widget build(BuildContext context) {
    var state;
    switch (status) {
      case DownloadTaskStatus.canceled:
        state = 'تلاش مجدد';
        break;
      case DownloadTaskStatus.complete:
        state = 'نمایش';
        break;
      case DownloadTaskStatus.enqueued:
        state = 'در حال دانلود';
        break;
      case DownloadTaskStatus.failed:
        state = 'تلاش مجدد';
        break;
      case DownloadTaskStatus.paused:
        state = 'ادامه';
        break;
      case DownloadTaskStatus.running:
        state = 'درحال دانلود';
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
                child: Tooltip(
                  showDuration: Duration(seconds: 5),
                  preferBelow: false,
                  message: title ?? '',
                  child: MyText(
                    text: title ?? '',
                    fontWeight: FontWeight.w500,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              MyText(
                textDirection: TextDirection.ltr,
                text: '$percent%',
                size: 13,
                color: cY,
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    right: -5,
                    top: 0,
                    bottom: 0,
                    left: -5,
                    child: SliderTheme(
                        data: SliderThemeData(
                          thumbColor: Colors.white,
                          disabledThumbColor: Colors.white,
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 2.5,
                          ),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 20.0),
                          trackShape: RoundedRectSliderTrackShape(),
                          trackHeight: 2,
                          disabledActiveTrackColor: cW,
                          disabledInactiveTrackColor: cW.withOpacity(.4),
                        ),
                        child: Slider(
                          thumbColor: Colors.transparent,
                          value: percent!.toDouble(),
                          min: 0,
                          max: 100,
                          onChanged: null,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String> getTheSpeed() async {
    String a = '';

    return a;
  }
}
