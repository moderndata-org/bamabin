import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/constant/utils.dart';
import 'package:bamabin/models/gateway_model.dart';
import 'package:bamabin/models/plan_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PaymentController extends GetxController {
  var isVip = false.obs;
  var loadingPlans = false.obs;
  var loadingDiscountCode = false.obs;
  var loadingGateways = false.obs;
  var gateways = <GatewayModel>[].obs;
  var plans = <PlanModel>[].obs;
  var selectedPlan = PlanModel().obs;
  var discountLoading = false.obs;
  var paymentLoading = false.obs;
  var discountTextController = TextEditingController();
  var discountCode = "".obs;

  void checkVip() {
    ApiProvider().checkVip().then((value) {
      if (value.isOk) {
        isVip(value.body["status"]);
      }
    });
  }

  void getGateways() {
    loadingGateways(true);
    gateways.clear();
    ApiProvider().gateways().then((value) {
      gateways.clear();
      if (value.isOk) {
        if (value.body["status"] == true) {
          (value.body["result"] as List).forEach((element) {
            gateways.add(GatewayModel.fromJson(element));
          });
        }
      }
      loadingGateways(false);
    });
  }

  void showGatewayDialog() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return Dialog(
          child: Container(
            height: Get.height / 3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: cPrimary),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "درگاه پرداخت را انتخاب کنید",
                  style: TextStyle(color: cAccent, fontWeight: FontWeight.bold),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: gateways.length,
                  itemBuilder: (context, index) {
                    var gateway = gateways[index];
                    return GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.5))),
                        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child:
                                  CachedNetworkImage(imageUrl: gateway.icon!),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${gateway.name}",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        sendPayment(gateway.id.toString());
                      },
                    );
                  },
                ))
              ],
            ),
          ),
        );
      },
    );
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
      if (value.isOk) {
        if (value.body["status"] == true) {
          selectedPlan.update((val) {
            val?.price = val.discountPrice;
            val?.discountPrice =
                (value.body["result"]["discount_price"]).toString();
          });
          discountCode(discountTextController.text.trim());
          discountTextController.clear();
          showMessage(text: "کد تخفیف روی مبلغ کل اعمال شد", isSucces: true);
        } else {
          showMessage(text: value.body["message"], isSucces: false);
          discountTextController.clear();
        }
      }
      loadingDiscountCode(false);
    });
  }

  void sendPayment(String gateway_id) {
    paymentLoading(true);
    ApiProvider()
        .payment(
            plan_id: selectedPlan.value.id,
            discount_code: (discountTextController.text.trim().length > 0)
                ? discountTextController.text.trim()
                : null,
            gateway: gateway_id)
        .then((value) {
      if (value.isOk) {
        print(value.body);
        if (value.body["status"] == true) {
          showMessage(text: "کد تخفیف روی مبلغ کل اعمال شد", isSucces: true);
        } else {
          showMessage(text: value.body["message"], isSucces: false);
        }
      }
      paymentLoading(false);
    });
  }
}
