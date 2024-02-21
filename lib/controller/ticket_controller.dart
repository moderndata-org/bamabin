import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/models/department_model.dart';
import 'package:bamabin/models/ticket_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TicketController extends GetxController{
  var tickets = <TicketModel>[].obs;
  var loadingTickets = false.obs;
  var selectedTicket = TicketModel().obs;

  var departments = <DepartmentModel>[].obs;
  var loadingDepartments = false.obs;
  var selectedDepartment = DepartmentModel().obs;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void getTickets(){
    tickets.clear();
    loadingTickets(true);
    ApiProvider().tickets().then((value){
      if(value.isOk){
        if(value.body["status"] == true){
          (value.body["result"] as List).forEach((element) {
            tickets.add(TicketModel.fromJson(element));
          });
        }
      }
      loadingTickets(false);
    });
  }

  void getDepartments(){
    departments.clear();
    loadingDepartments(true);
    ApiProvider().departments().then((value){
      if(value.isOk){
        if(value.body["status"] == true){
          (value.body["result"] as List).forEach((element) {
            departments.add(DepartmentModel.fromJson(element));
          });
        }
      }
      loadingDepartments(false);
    });
  }
}