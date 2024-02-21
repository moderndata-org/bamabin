import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/models/order_list_model.dart';
import 'package:get/get.dart';

class OrderListController extends GetxController {
  RxBool isLoadingOrderLists = false.obs;
  RxBool isLoadingAddOrder = false.obs;
  RxList<OrderListModel> orderList = <OrderListModel>[].obs;

  void getList() {
    isLoadingOrderLists(true);
    ApiProvider().getOrderList().then((res) {
      if (res.body != null) {
        if (res.body['status'] == true) {
          isLoadingOrderLists(false);
          List tmp = res.body['result'];
          for (var e in tmp) {
            orderList.add(OrderListModel.fromJson(e));
          }
        }
      }
    });
  }

  @override
  void onInit() {
    Get.toNamed('/order');
    getList();
    super.onInit();
  }
}
