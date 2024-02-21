import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/ticket_controller.dart';
import 'package:bamabin/screens/dialogs/tickets_add_dialog.dart';
import 'package:bamabin/widgets/MyCircularProgress.dart';
import 'package:bamabin/widgets/tickets_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_appbar.dart';

class TicketsScreen extends GetView<TicketController> {
  const TicketsScreen({super.key});

  void init() {
    controller.getTickets();
    controller.getDepartments();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => init());
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppbar(
          title: 'تیکت',
          icon: Icon(
            Icons.confirmation_num_rounded,
            color: cW,
            size: 25,
            shadows: [bsText],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: cSecondaryLight,
        shape: CircleBorder(),
        onPressed: () {
          showDialog(
            barrierColor: cBgDialogColor,
            context: context,
            builder: (context) {
              return TicketsAddDialog();
            },
          );
        },
        child: Icon(
          Icons.add,
          color: cW,
        ),
      ),
      backgroundColor: cPrimary,
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            Expanded(child: Obx(
              () {
                return (controller.loadingTickets.isTrue)
                    ? Center(
                        child: MyCircularProgress(
                          size: 32,
                          color: cAccent,
                        ),
                      )
                    : (controller.tickets.length > 0) ? ListView.builder(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        itemCount: controller.tickets.length,
                        itemBuilder: (context, index) {
                          var ticket = controller.tickets[index];
                          return TicketsItem(
                            id: ticket.id,
                            title: ticket.title,
                            department: ticket.department_name,
                            updated: ticket.updated_at,
                            date: ticket.created_at,
                            onShow: (){
                              controller.selectedTicket(ticket);
                              Get.toNamed("/ticket-details");
                            },

                          );
                        },
                      ) : Center(child: Text("تیکتی برای نمایش وجود ندارد",style: TextStyle(color: Colors.white),),);
              },
            ))
          ],
        ),
      ),
    ));
  }
}
