import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/models/notification_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController{
  var notifications = <NotificationModel>[].obs;
  var loadingNotifications = false.obs;
  var loadingDeleteNotifications = false.obs;
  var selectedNotification = NotificationModel().obs;
  var page = 1.obs;
  var last_page_num = 1.obs;

  void nextPage(){
    if(page != last_page_num){
      page += 1;
      getNotifications();
    }
  }
  void getNotifications(){
    if(page == 1){
      notifications.clear();
      loadingNotifications(true);

    }

    ApiProvider().notifications(page: page.toString()).then((value){
      if(value.isOk){
         if(value.body["status"] == true){
           (value.body["result"] as List).forEach((element) {
             notifications.add(NotificationModel.fromJson(element));
           });

           last_page_num(value.body["info"]["last_page_num"]);
         }
      }
      loadingNotifications(false);
    });
  }

  void deleteAllNotifications(){
    loadingDeleteNotifications(true);
    ApiProvider().deleteAllNotifications().then((value){
      if(value.isOk){
        if(value.body["status"] == true){
          notifications.clear();
        }
        loadingDeleteNotifications(false);
      }
    });
  }

  void readNotification({required int? index}){
    var notification = notifications[index!];
    ApiProvider().readNotification(id: notification.id.toString()).then((value){
      if(value.isOk){
        notifications[index].readStatus = true;
        notifications.refresh();
      }
    });
  }
}