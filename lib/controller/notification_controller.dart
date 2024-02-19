import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/models/notification_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController{
  var notifications = <NotificationModel>[].obs;
  var loadingNotifications = false.obs;
  var loadingDeleteNotifications = false.obs;
  var selectedNotification = NotificationModel().obs;

  void getNotifications(){
    loadingNotifications(true);
    ApiProvider().notifications().then((value){
      if(value.isOk){
        print(value.body);
         if(value.body["status"] == true){
           (value.body["result"] as List).forEach((element) {
             notifications.add(NotificationModel.fromJson(element));
           });
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