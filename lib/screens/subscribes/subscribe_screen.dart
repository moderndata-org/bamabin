import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/constant/utils.dart';
import 'package:bamabin/controller/auth_controller.dart';
import 'package:bamabin/controller/payment_controller.dart';
import 'package:bamabin/widgets/MyCircularProgress.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextField.dart';
import 'package:bamabin/widgets/custom_appbar.dart';
import 'package:bamabin/widgets/subscribe_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../widgets/MyTextButton.dart';

class SubscribeScreen extends GetView<AuthController> {
  const SubscribeScreen({super.key});

  void init() {
    controller.paymentController.getPlans();
    controller.paymentController.getGateways();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => init());
    return SafeArea(
        child: Scaffold(
      backgroundColor: cPrimary,
      appBar: CustomAppbar(
        title: 'خرید اشتراک',
        icon: SizedBox(
            width: 50,
            height: 50,
            child: SimpleShadow(
              color: cB,
              opacity: .2,
              offset: Offset(0, 5),
              child: SvgPicture.asset(
                'assets/svg/ic_subscribe.svg',
              ),
            )),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (controller.paymentController.loadingPlans.isTrue)
                  return Center(
                    child: MyCircularProgress(
                      color: cAccent,
                      size: 32,
                    ),
                  );

                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.paymentController.plans.length,
                  padding: EdgeInsets.only(right: 10, left: 10),
                  itemBuilder: (context, index) {
                    var plan = controller.paymentController.plans[index];
                    return SubscribeItem(
                      price: "${plan.price}",
                      is_selected: controller.paymentController.selectedPlan.value.id == plan.id,
                      price_of: "${plan.discountPrice}",
                      title: "اشتراک ${plan.name}",
                      svg_image: plan.iconUrl,
                      onTap: () {
                        controller.paymentController.selectedPlan(plan);
                        controller.paymentController.plans.refresh();
                      },
                    );
                  },
                );
              }),
            ),
            Obx(() => (controller.paymentController.selectedPlan.value.id != null)
                ? Container(
                    padding: EdgeInsets.all(10),
                    width: Get.width,
                    decoration: BoxDecoration(color: cPrimary, boxShadow: [
                      BoxShadow(
                          offset: Offset(0, -5),
                          blurRadius: 5,
                          color: cB.withOpacity(.2))
                    ]),
                    child: Column(
                      children: [
                        Row(textDirection: TextDirection.ltr, children: [
                          MyTextButton(
                            size: Size(120, 35),
                            onTap: () {
                              if (controller.paymentController.discountTextController.text
                                  .trim()
                                  .isNotEmpty) {
                                controller.paymentController.checkDiscountCode();
                              } else {
                                showMessage(
                                    text: "لطفا کد تخفیف را وارد کنید",
                                    isSucces: false);
                              }
                            },
                            child: Center(
                              child: Obx(() {
                                if (controller.paymentController.loadingDiscountCode.isTrue)
                                  return MyCircularProgress(
                                    color: Colors.black,
                                    size: 20,
                                  );

                                return MyText(
                                  text: "اعمال کد تخفیف",
                                  color: cB,
                                );
                              }),
                            ),
                            bgColor: cAccent,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 35,
                              child: MyTextField(
                                hint: "کد تخفیف",
                                maxLines: 1,
                                controller: controller.paymentController.discountTextController,
                              ),
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 1,
                          width: Get.width,
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            textDirection: TextDirection.rtl,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Text(
                                    "مبلغ کل",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "${controller.paymentController.selectedPlan.value.price} تومان",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: cPink,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationColor: cPink),
                                      ),
                                      Row(
                                        textDirection: TextDirection.rtl,
                                        children: [
                                          Text(
                                            "${controller.paymentController.selectedPlan.value.discountPrice}",
                                            style: TextStyle(
                                                color: cAccent, fontSize: 17),
                                            textDirection: TextDirection.rtl,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "تومان",
                                            style: TextStyle(
                                                color: cW, fontSize: 11),
                                            textDirection: TextDirection.rtl,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              MyTextButton(
                                size: Size(120, 35),
                                onTap: () {
                                  if(controller.isLogin.isTrue)
                                  controller.paymentController.showGatewayDialog();
                                  else{
                                    showMessage(text: "برای خرید ابتدا وارد شوید.", isSucces: false);
                                    Get.toNamed("/signin");
                                  }
                                },
                                child: Text(
                                  "پرداخت",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.black),
                                ),
                                bgColor: cAccent,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : Container())
          ],
        ),
      ),
    ));
  }
}
