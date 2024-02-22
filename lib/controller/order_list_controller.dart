import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/constant/utils.dart';
import 'package:bamabin/models/film_model.dart';
import 'package:bamabin/models/order_list_model.dart';
import 'package:get/get.dart';

class OrderListController extends GetxController {
  RxBool isLoadingOrderLists = false.obs;
  RxBool isLoadingAddOrder = false.obs;
  RxBool isLoadingEditOrder = false.obs;
  RxBool isLoadingDetails = false.obs;
  RxBool isLoadingSearchResults = false.obs;
  RxBool isShowShimmerSearch = false.obs;
  RxList<OrderListModel> orderList = <OrderListModel>[].obs;
  Rx<OrderListModel> selectedOrderList = OrderListModel().obs;
  RxInt selectedOrderIndex = 0.obs;
  String searchText = '';
  int page = 1;
  RxList<FilmModel> listSearch = <FilmModel>[].obs;

  void search({required bool isFirstPage, required String txtSearch}) {
    if (isLoadingSearchResults.isFalse) {
      isLoadingSearchResults(true);
      if (isFirstPage) {
        searchText = txtSearch;
        page = 1;
        isShowShimmerSearch(true);
        listSearch.clear();
      } else {
        page += 1;
      }
      ApiProvider().search(text: searchText, page: page).then((res) {
        if (res.body != null) {
          isLoadingSearchResults(false);
          isShowShimmerSearch(false);
          if (res.body['status'] == true) {
            List tmp = res.body['result']['movies'];
            tmp.forEach((element) {
              listSearch.add(FilmModel.fromJson(element));
            });
          }
        }
      });
    }
  }

  void deleteItemOrder({
    required String film_id,
    required int index,
  }) {
    isLoadingDetails(true);
    ApiProvider()
        .deleteOrderListItem(
            post_id: film_id, list_id: selectedOrderList.value.id)
        .then((res) {
      isLoadingDetails(false);
      if (res.body != null) {
        if (res.body['status'] == true) {
          selectedOrderList.value.posts!.removeAt(index);
          orderList[selectedOrderIndex.value].posts =
              selectedOrderList.value.posts;
          orderList.refresh();
        }
      }
    });
  }

  void addItemOrder({
    required FilmModel filmModel,
    required int index,
  }) {
    Get.back();
    isLoadingDetails(true);
    ApiProvider()
        .addOrderListItem(
            post_id: filmModel.id.toString(),
            list_id: selectedOrderList.value.id)
        .then((res) {
      print(res.body);
      isLoadingDetails(false);
      if (res.body != null) {
        if (res.body['status'] == true) {
          selectedOrderList.value.posts!.add(filmModel);
          selectedOrderList.refresh();
          orderList[selectedOrderIndex.value].posts =
              selectedOrderList.value.posts;
          orderList.refresh();
        } else {
          showMessage(text: res.body['message'], isSucces: false);
        }
      }
    });
  }

  void getOrdersList() {
    isLoadingOrderLists(true);
    orderList.clear();
    ApiProvider().getOrdersList().then((res) {
      isLoadingOrderLists(false);
      if (res.body != null) {
        if (res.body['status'] == true) {
          List tmp = res.body['result'];
          for (var e in tmp) {
            orderList.add(OrderListModel.fromJson(e));
          }
        }
      }
    });
  }

  void getOrderDetail({required String list_id}) {
    isLoadingDetails(true);
    ApiProvider().getOrderListDetails(list_id: list_id).then((res) {
      isLoadingDetails(false);
      print(res.body);
    });
  }

  void deleteOrderList({required String listId}) {
    isLoadingOrderLists(true);
    ApiProvider().deleteOrderList(listId: listId).then((res) {
      isLoadingOrderLists(false);
      if (res.body != null) {
        if (res.body['status'] == true) {
          // getOrderList();
          orderList.removeWhere((element) => element.id == listId);
        }
      }
    });
  }

  void editOrderList({
    required String? listId,
    required String? title,
    required String? content,
  }) {
    if (title != '' && content != null) {
      isLoadingEditOrder(true);
      ApiProvider()
          .editOrderList(listId: listId, title: title, content: content)
          .then((res) {
        isLoadingEditOrder(false);
        Get.back();
        if (res.body['status'] == true) {
          getOrdersList();
        }
      });
    } else {
      showMessage(text: 'لطفا عنوان و توضیحات را وارد نمایید', isSucces: false);
    }
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
            getOrdersList();
          }
        }
      });
    } else {
      showMessage(text: 'لطفا عنوان و توضیحات را وارد نمایید', isSucces: false);
    }
  }

  @override
  void onInit() {
    Get.toNamed('/order');
    getOrdersList();
    super.onInit();
  }
}
