import 'package:bamabin/models/recent_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RecentContoller extends GetxController {
  RxBool isLoadingData = false.obs;
  var recentHive = Hive.box<RecentModel>('recents');
  RxList<RecentModel> listFilm = <RecentModel>[].obs;

  void deleteAllRecents() {
    recentHive.deleteAll(recentHive.keys);
    refreshData();
  }

  void refreshData() {
    isLoadingData(true);
    listFilm.clear();
    var a = recentHive.values;
    for (var element in a) {
      listFilm.add(element);
    }
    isLoadingData(false);
  }

  void addToRecent({required RecentModel recentModel}) {
    bool hasThisData = false;
    print('sht');
    recentHive.values.forEach((element) {
      if (element.id == recentModel.id) {
        hasThisData = true;
        print('yeye');
      }
    });
    if (hasThisData == false) {
      print('yeye2');
      recentHive.add(recentModel);
    }
  }
}
