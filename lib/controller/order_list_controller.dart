import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/constant/utils.dart';
import 'package:bamabin/models/order_list_model.dart';
import 'package:get/get.dart';

class OrderListController extends GetxController {
  RxBool isLoadingOrderLists = false.obs;
  RxBool isLoadingAddOrder = false.obs;
  RxList<OrderListModel> orderList = <OrderListModel>[].obs;
  Rx<OrderListModel> selectedOrderList = OrderListModel().obs;

  void getOrderList() {
    isLoadingOrderLists(true);
    orderList.clear();
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

  void addOrderList({
    required String? title,
    required String? content,
  }) {
    if (title != '' && content != null) {
      isLoadingAddOrder(true);
      ApiProvider().addOrderList(content: content, title: title).then((res) {
        isLoadingAddOrder(false);
        Get.back();
        print(res.body);
        if (res.body != null) {
          if (res.body['status'] == true) {
            getOrderList();
            List tmp = res.body['result'];
            for (var e in tmp) {
              orderList.add(OrderListModel.fromJson(e));
            }
          }
        }
      });
    } else {
      showMessage(text: 'لطفا موارد را وارد نمایید', isSucces: false);
    }
  }

  @override
  void onInit() {
    Get.toNamed('/order');
    getOrderList();
    super.onInit();
  }
}
