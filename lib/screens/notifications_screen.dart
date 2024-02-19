import 'package:bamabin/controller/notification_controller.dart';
import 'package:bamabin/widgets/MyCircularProgress.dart';
import 'package:bamabin/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/colors.dart';
import '../widgets/custom_appbar.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({Key? key}) : super(key: key);
  void init(){
    controller.page(1);
    controller.last_page_num(1);
    controller.getNotifications();
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero,() => init());

    return SafeArea(
        child: Scaffold(
      appBar: CustomAppbar(
          title: 'اعلانات',
          icon: Icon(
            Icons.notifications,
            color: cW,
            shadows: [bsText],
          )),
      backgroundColor: cPrimary,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                if(controller.loadingNotifications.isTrue){
                  return Center(child: MyCircularProgress(color: cAccent,size: 35,),);
                }
                if(controller.notifications.length > 0){
                  return ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    physics: BouncingScrollPhysics(),
                    itemCount: controller.notifications.length,
                    itemBuilder: (context, index) {
                      var notification = controller.notifications[index];

                      if(notification.readStatus == false)
                      controller.readNotification(index: index);
                      if(index == controller.notifications.length - 1){
                        Future.delayed(Duration.zero,() => controller.nextPage());

                      }
                      return NotificationItem(
                        text:notification.content
                      );
                    },
                  );
                }

                return Center(child: Text("موردی برای نمایش وجود ندارد",style: TextStyle(color: Colors.white),),);

              }),
            ),
            SizedBox(
              height: 50,
              width: Get.width,
              child: InkWell(
                onTap: () {
                  if(controller.notifications.length > 0){
                    controller.deleteAllNotifications();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 13),
                  decoration: BoxDecoration(color: Colors.redAccent),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx((){
                          if(controller.loadingDeleteNotifications.isTrue)
                            return MyCircularProgress(color: Colors.white,size: 28,);

                          return Text(
                            "حذف اعلانات",
                            style: TextStyle(
                                color: cW,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          );
                        }),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.delete_sweep,
                          color: cW,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
