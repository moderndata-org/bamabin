import 'package:bamabin/constant/utils.dart';
import 'package:bamabin/controller/ticket_controller.dart';
import 'package:bamabin/widgets/MyCircularProgress.dart';
import 'package:bamabin/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
import '../../widgets/MyText.dart';
import '../../widgets/MyTextButton.dart';
import '../../widgets/MyTextField.dart';

class TicketsAddDialog extends GetView<TicketController> {
  const TicketsAddDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: cB,
      surfaceTintColor: cB,
      elevation: 20,
      backgroundColor: cPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 40,
              width: Get.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                          splashRadius: 1,
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.cancel,
                            color: cR,
                          ))),
                  Positioned(
                    top: 15,
                    child: MyText(
                      text: "افزودن تیکت",
                      color: cW,
                      size: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: MyTextField(
                borderRadius: 5,
                height: 41,
                maxLines: 1,
                hint: "عنوان",
                controller: controller.titleController,
                suffixIcon: Icon(
                  Icons.description,
                  size: 25,
                  color: cW,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Obx(
                  () {
                    return CustomDropDown(
                      alignment: Alignment.centerRight,
                      title: (controller.selectedDepartment.value.id != null)
                          ? '${controller.selectedDepartment.value.name}'
                          : 'دپارتمان',
                      borderRadius: 5,
                      buttonColor: cSecondary,
                      list:
                          List.generate(controller.departments.length, (index) {
                        var department = controller.departments[index];

                        return DropdownMenuItem(
                            value: department,
                            onTap: () {
                              controller.selectedDepartment(department);
                            },
                            child: SizedBox(
                              width: Get.width,
                              child: MyText(
                                text: '${department.name}',
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.right,
                              ),
                            ));
                      }),
                    );
                  },
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: MyTextField(
                borderRadius: 5,
                maxLines: 3,
                height: 90,
                hint: "توضیحات",
                controller: controller.descriptionController,
                suffixIcon: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      Icons.description,
                      size: 25,
                      color: cW,
                    ),
                  ],
                ),
              ),
            ),
            MyTextButton(
                onTap: () {
                  if(controller.titleController.text.trim().isNotEmpty &&
                      controller.descriptionController.text.trim().isNotEmpty &&
                      controller.selectedDepartment.value.id != null
                  ){

                    controller.createTicket(
                        title: controller.titleController.text.trim(),
                        department_id: controller.selectedDepartment.value.id,
                        content: controller.descriptionController.text.trim()
                    );

                  }else{
                    showMessage(text: "پر کردن تمامی فیلدها اجباری است.", isSucces: false);
                  }
                },
                size: Size(Get.width / 1.4, 35),
                bgColor: cY,
                child: Obx(() {
                  if(controller.loadingCreateTicket.isTrue)
                    return Center(child: MyCircularProgress(color: Colors.white,size: 17,),);

                  return MyText(
                    text: "ارسال تیکت",
                    size: 14,
                    color: cB,
                  );
                },)),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
