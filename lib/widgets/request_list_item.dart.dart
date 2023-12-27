import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';

class RequestItem extends StatelessWidget {
  RequestItem ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),

      width: Get.width-20,
      height: Get.height/3,
      decoration: BoxDecoration(

        color:cBgOrderItem,
        borderRadius: BorderRadius.circular(15)
      ),
      child: 
      Column(
        children: [

          Row(

            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("135",style: TextStyle(color: cW,fontSize:15),),
              SizedBox(width: 10,),

              Text(": شناسه",style: TextStyle(color: cW,fontSize:15),),


            ],
          ),
          Row(

            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("فیلم بمب",style: TextStyle(color: cW,fontSize:15),),
              SizedBox(width: 10,),

              Text(": درخواست",style: TextStyle(color: cW,fontSize:15),),


            ],
          )
        ],),

    );
  }
}
