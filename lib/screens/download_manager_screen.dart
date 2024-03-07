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
                  status: dltask.status,
                  percent: dltask.progress,
                  onTap: () {
                    // controller.refreshDownloadList();
                    switch (dltask.status) {
                      case DownloadTaskStatus.complete:
                        FlutterDownloader.open(taskId: dltask.taskId);
                        break;
                      case DownloadTaskStatus.failed:
                        FlutterDownloader.retry(taskId: dltask.taskId);
                        break;
                      case DownloadTaskStatus.paused:
                        FlutterDownloader.resume(taskId: dltask.taskId);
                        break;
                      case DownloadTaskStatus.enqueued ||
                            DownloadTaskStatus.running:
                        FlutterDownloader.pause(taskId: dltask.taskId);
                        break;
                      default:
                    }
                    setState(() {});
                    controller.refreshDownloadList();
                    // if (dltask.status == DownloadTaskStatus.complete) {
                    //   FlutterDownloader.open(taskId: dltask.taskId);
                    // }
                    // controller.retryDownload(taskId: dltask.taskId);
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
    this.percent = 0,
    this.speed,
    this.title,
    this.status,
    super.key,
  });

  final Function()? onTap;
  final String? title;
  final String? speed;
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
                  value: percent!.toDouble(),
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
