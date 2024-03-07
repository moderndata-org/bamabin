import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadManagerController extends GetxController {
  RxList<DownloadTask> listDownloads = <DownloadTask>[].obs;
  ReceivePort _port = ReceivePort();

  @override
  void onInit() {
    // FlutterDownloader.registerCallback((id, status, progress) {
    //   for (var i = 0; i < listDownloads.length; i++) {
    //     DownloadTask realtimeTask = listDownloads[i];
    //     if (id == realtimeTask.taskId) {
    //       // DownloadTask dlNew = DownloadTask(taskId: realtimeTask.taskId, status: DownloadTaskStatus, progress: progress, url: url, filename: filename, savedDir: savedDir, timeCreated: timeCreated, allowCellular: allowCellular)
    //       print(progress);
    //     }
    //   }
    // });
    _bindBackgroundIsolate();
    FlutterDownloader.registerCallback(downloadCallback);

    super.onInit();
  }

  void _bindBackgroundIsolate() {
    print('binded');
    bool isSuccess = IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    } else {
      _port.listen((dynamic data) {
        String id = data[0];
        int status = data[1];
        int progress = data[2];
        DownloadTaskStatus realStatus = switch (status) {
          1 => DownloadTaskStatus.canceled,
          2 => DownloadTaskStatus.complete,
          3 => DownloadTaskStatus.enqueued,
          4 => DownloadTaskStatus.failed,
          5 => DownloadTaskStatus.paused,
          6 => DownloadTaskStatus.running,
          7 => DownloadTaskStatus.undefined,
          int() => DownloadTaskStatus.undefined,
        };
        print('status is $status and real Status is $realStatus');
        print('the progress is $progress');
        print('the taskID is $id');
        if (progress == -1) {
          progress = 0;
        }
        refreshDownloadList();
        // for (var i = 0; i < listDownloads.length; i++) {
        //   DownloadTask realtimeTask = listDownloads[i];
        //   if (id == realtimeTask.taskId) {
        //     DownloadTask dlNew = DownloadTask(
        //         taskId: realtimeTask.taskId,
        //         status: realStatus,
        //         progress: progress,
        //         url: realtimeTask.url,
        //         filename: realtimeTask.filename,
        //         savedDir: realtimeTask.savedDir,
        //         timeCreated: realtimeTask.timeCreated,
        //         allowCellular: realtimeTask.allowCellular);
        //     listDownloads[i] = dlNew;
        //     listDownloads.refresh();
        //     print(progress);
        //   }
        // }
      });
    }
  }

  static void downloadCallback(String id, int status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  void download() async {
    final directory = await getExternalStorageDirectory();
    final savedDir = '${directory?.path}/download/bamabin/';
    final fileName = 'SquidGameTrailesr.mp4';
    final url =
        'https://dl1.irantell.top/Trailers/Series/S/Squid.Game.The.Challenge.tt28104766/Squid.Game.The.Challenge.S01.Teaser.mp4';
    await Permission.notification.request();
    await Permission.manageExternalStorage.request();
    await Permission.storage.request();
    final taskId = await FlutterDownloader.enqueue(
      url: url,
      savedDir: savedDir, // Directory where the file will be saved
      fileName: fileName,
      showNotification: true,
      openFileFromNotification: false, saveInPublicStorage: true,
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
    final tasks = await FlutterDownloader.loadTasks();

    listDownloads.clear();
    tasks?.forEach((element) {
      listDownloads.add(element);
    });
  }
}
