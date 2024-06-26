// import 'dart:async';
// import 'dart:io';
// import 'dart:isolate';
// import 'dart:ui';

// import 'package:bamabin/constant/utils.dart';
// import 'package:bamabin/models/dlbox_item_model.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:get/get.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// class DownloadManagerController extends GetxController {
//   RxList<DownloadTask> listDownloads = <DownloadTask>[].obs;
//   ReceivePort _port = ReceivePort();
//   DateTime lastTimeShowMessage = DateTime.now();

//   @override
//   void onInit() {
//     // FlutterDownloader.registerCallback((id, status, progress) {
//     //   for (var i = 0; i < listDownloads.length; i++) {
//     //     DownloadTask realtimeTask = listDownloads[i];
//     //     if (id == realtimeTask.taskId) {
//     //       // DownloadTask dlNew = DownloadTask(taskId: realtimeTask.taskId, status: DownloadTaskStatus, progress: progress, url: url, filename: filename, savedDir: savedDir, timeCreated: timeCreated, allowCellular: allowCellular)
//     //       print(progress);
//     //     }
//     //   }
//     // });
//     //! Disable for now
//     _bindBackgroundIsolate();
//     //! Enable for now
//     Timer.periodic(Duration(milliseconds: 100), (timer) {
//       refreshDownloadList();
//     });
//     FlutterDownloader.registerCallback(downloadCallback);

//     super.onInit();
//   }

//   void _bindBackgroundIsolate() {
//     print('binded');
//     bool isSuccess = IsolateNameServer.registerPortWithName(
//         _port.sendPort, 'downloader_send_port');
//     if (!isSuccess) {
//       _unbindBackgroundIsolate();
//       _bindBackgroundIsolate();
//       return;
//     } else {
//       _port.listen((dynamic data) {
//         String id = data[0];
//         int status = data[1];
//         int progress = data[2];
//         DownloadTaskStatus realStatus = switch (status) {
//           1 => DownloadTaskStatus.canceled,
//           2 => DownloadTaskStatus.complete,
//           3 => DownloadTaskStatus.enqueued,
//           4 => DownloadTaskStatus.failed,
//           5 => DownloadTaskStatus.paused,
//           6 => DownloadTaskStatus.running,
//           7 => DownloadTaskStatus.undefined,
//           int() => DownloadTaskStatus.undefined,
//         };
//         print('status is $status and real Status is $realStatus');
//         print('the progress is $progress');
//         print('the taskID is $id');
//         if (progress == -1) {
//           progress = 0;
//         }
//         // refreshDownloadList();
//         // for (var i = 0; i < listDownloads.length; i++) {
//         //   DownloadTask realtimeTask = listDownloads[i];
//         //   if (id == realtimeTask.taskId) {
//         //     DownloadTask dlNew = DownloadTask(
//         //         taskId: realtimeTask.taskId,
//         //         status: realStatus,
//         //         progress: progress,
//         //         url: realtimeTask.url,
//         //         filename: realtimeTask.filename,
//         //         savedDir: realtimeTask.savedDir,
//         //         timeCreated: realtimeTask.timeCreated,
//         //         allowCellular: realtimeTask.allowCellular);
//         //     listDownloads[i] = dlNew;
//         //     listDownloads.refresh();
//         //     print(progress);
//         //   }
//         // }
//       });
//     }
//   }

//   static void downloadCallback(String id, int status, int progress) {
//     final SendPort? send =
//         IsolateNameServer.lookupPortByName('downloader_send_port');
//     send?.send([id, status, progress]);
//   }

//   void _unbindBackgroundIsolate() {
//     print('unbinded');
//     IsolateNameServer.removePortNameMapping('downloader_send_port');
//   }

//   void download(
//       {required bool goingToDownloadPage, required DlboxItem dlBox}) async {
//     // final directory = await getExternalStorageDirectory();
//     // final savedDir = '${directory?.path}/download/bamabin/';
//     if (dlBox.link != '#' && dlBox.link != '' && dlBox.link != null) {
//       if (goingToDownloadPage) {
//         Get.toNamed('/download-manager');
//       }
//       String? savedDir = await getDownloadPath();
//       print('savedDir : $savedDir');
//       // final fileName = '${dlBox.}';
//       final url = '${dlBox.link}';
//       await Permission.notification.request();
//       // final taskId =
//       if (savedDir == null) {
//         showMessage(text: 'Download Error', isSucces: false);
//       } else {
//         await FlutterDownloader.enqueue(
//             url: url,
//             savedDir: savedDir,
//             // fileName: fileName,
//             showNotification: true,
//             openFileFromNotification: false,
//             saveInPublicStorage: true,
//             allowCellular: true);
//         // refreshDownloadList();
//       }
//     } else {
//       if (DateTime.now().difference(lastTimeShowMessage) >
//           Duration(seconds: 3)) {
//         lastTimeShowMessage = DateTime.now();
//         showMessage(
//             text: 'لینک دانلود به‌زودی قرار خواهد گرفت', isSucces: false);
//       }
//     }
//   }

//   Future<String?> getDownloadPath() async {
//     //! Attention for IOS
//     //     UISupportsDocumentBrowser
//     // to Info.plist and set true
//     // Then you can see the folder with your app name in file app.
//     // But need to use
//     // await getApplicationDocumentsDirectory();
//     // to save the file to be available in file app in iOs.

//     await Permission.storage.request();
//     Directory? directory;
//     try {
//       if (Platform.isIOS) {
//         directory = await getApplicationDocumentsDirectory();
//       } else {
//         directory = Directory('/storage/emulated/0/Download');
//         if (!await directory.exists())
//           directory = await getExternalStorageDirectory();
//       }
//     } catch (err) {
//       print("Cannot get download folder path");
//     }
//     return directory?.path;
//   }

//   void resumeDownload({required String taskId}) {
//     FlutterDownloader.resume(taskId: taskId);
//   }

//   void retryDownload({required String taskId}) {
//     FlutterDownloader.retry(taskId: taskId);
//   }

//   void refreshDownloadList() async {
//     final tasks = await FlutterDownloader.loadTasks();
//     listDownloads.clear();

//     tasks?.forEach((element) {
//       listDownloads.add(element);
//     });
//     listDownloads(listDownloads.reversed.toList());
//   }
// }
