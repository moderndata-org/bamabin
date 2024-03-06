import 'dart:io';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadManagerController extends GetxController {
  RxList<DownloadTask> listDownloads = <DownloadTask>[].obs;

  @override
  void onInit() {
    FlutterDownloader.registerCallback((id, status, progress) {
      for (var i = 0; i < listDownloads.length; i++) {
        DownloadTask realtimeTask = listDownloads[i];
        if (id == realtimeTask.taskId) {
          // DownloadTask dlNew = DownloadTask(taskId: realtimeTask.taskId, status: DownloadTaskStatus, progress: progress, url: url, filename: filename, savedDir: savedDir, timeCreated: timeCreated, allowCellular: allowCellular)
          print(progress);
        }
      }
    });
    super.onInit();
  }

  void download() async {
    final directory = await getApplicationDocumentsDirectory();
    final savedDir = '${directory.path}/download/bamabin/';
    final fileName = 'SquidGameTrailesr.mp4';
    final url =
        'https://dl1.irantell.top/Trailers/Series/S/Squid.Game.The.Challenge.tt28104766/Squid.Game.The.Challenge.S01.Teaser.mp4';
    await Permission.notification.request();
    Directory dd = Directory(savedDir);
    if (!await dd.exists()) {
      await dd.create(recursive: true);
    }
    final taskId = await FlutterDownloader.enqueue(
      url: url,
      savedDir: savedDir, // Directory where the file will be saved
      fileName: fileName,
      showNotification: true,
      openFileFromNotification: true,
    );
    refreshDownloadList();
  }

  void resumeDownload({required String taskId}) {
    FlutterDownloader.resume(taskId: taskId);
  }

  void retryDownload({required String taskId}) {
    FlutterDownloader.retry(taskId: taskId);
  }

  void refreshDownloadList() async {
    listDownloads.clear();
    final tasks = await FlutterDownloader.loadTasks();
    tasks?.forEach((element) {
      listDownloads.add(element);
    });
  }
}
