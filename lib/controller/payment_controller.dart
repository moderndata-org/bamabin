import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/models/plan_model.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController{
  var isVip = false.obs;
  var loadingPlans = false.obs;
  var plans = <PlanModel>[].obs;
  var selectedPlan = PlanModel().obs;
  var discountLoading = false.obs;


  void checkVip(){
    ApiProvider().checkVip().then((value){
      if(value.isOk){
        isVip(value.body["status"]);
      }
    });
  }

  void getPlans(){
    selectedPlan(PlanModel());
    plans.refresh();
    loadingPlans(true);
    plans.clear();
    ApiProvider().plans().then((value){
      plans.clear();
      if(value.isOk){
        if(value.body["status"] == true){
          (value.body["result"] as List).forEach((element) {
            plans.add(PlanModel.fromJson(element));
          });
        }
      }
      loadingPlans(false);
    });
  }

  void checkDiscountCode(){}

}