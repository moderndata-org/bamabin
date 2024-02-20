import 'package:bamabin/api/api_handler.dart';
import 'package:get/get.dart';

class OrderListController extends GetxController {
  RxBool isLoadingOrderLists = false.obs;

  void getList() {
    isLoadingOrderLists(true);
    ApiProvider().getOrderList().then((res) {
      if (res.body != null) {}
    });
  }

  @override
  void onInit() {
    Get.toNamed('/order');
    getList();
    super.onInit();
  }
}
