import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/constant/utils.dart';
import 'package:bamabin/models/plan_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PaymentController extends GetxController {
  var isVip = false.obs;
  var loadingPlans = false.obs;
  var loadingDiscountCode = false.obs;
  var plans = <PlanModel>[].obs;
  var selectedPlan = PlanModel().obs;
  var discountLoading = false.obs;
  var discountTextController = TextEditingController();
  var discountCode = "".obs;

  void checkVip() {
    ApiProvider().checkVip().then((value) {
      if (value.isOk) {
        isVip(value.body["status"]);
      }
    });
  }

  void getPlans() {
    selectedPlan(PlanModel());
    discountCode();
    plans.refresh();
    loadingPlans(true);
    plans.clear();
    ApiProvider().plans().then((value) {
      plans.clear();
      if (value.isOk) {
        if (value.body["status"] == true) {
          (value.body["result"] as List).forEach((element) {
            plans.add(PlanModel.fromJson(element));
          });
        }
      }
      loadingPlans(false);
    });
  }

  void checkDiscountCode() {
    loadingDiscountCode(true);
    ApiProvider()
        .checkDiscountCode(
            plan_id: selectedPlan.value.id,
            discount_code: discountTextController.text.trim())
        .then((value) {
          print(value.body);
        if(value.isOk){
          if(value.body["status"] == true){
            selectedPlan.update((val) {
              val?.price = val.discountPrice;
              val?.discountPrice = (value.body["result"]["discount_price"]).toString();
            });
            discountCode(discountTextController.text.trim());
            discountTextController.clear();
            showMessage(text: "کد تخفیف روی مبلغ کل اعمال شد", isSucces: true);
          }else{
            showMessage(text: value.body["message"], isSucces: false);
            discountTextController.clear();
          }
          
        }
      loadingDiscountCode(false);
    });
  }
}
