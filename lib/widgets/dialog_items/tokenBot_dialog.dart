import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
import '../MyText.dart';
import '../MyTextButton.dart';
import '../MyTextField.dart';

class TokenBotDialog extends StatelessWidget {
  const TokenBotDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: cB,
      surfaceTintColor: cB,
      elevation: 20,
      backgroundColor: cPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                          ),
                      ),
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 5, right: 10, left: 10, bottom: 5),
                      decoration: BoxDecoration(
                          color: cY,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          )),
                      child: MyText(
                        text:"ربات تلگرام",
                        color: cB,
                        size: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 45,
            ),
Container(
  margin: EdgeInsets.only(right: 20),
  alignment:Alignment.topRight,
  child:             Text(": توکن ربات تلگرام",style: TextStyle(color: cW,fontSize: 12),textAlign: TextAlign.right,),

),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child:Container(

                  padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                  decoration: BoxDecoration(
                      color: cBgTextfield,
                      border: Border.all(color: cStrokeGrey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child:
              Center(child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyTextButton(
                        
                        onTap: () {},
                        size: Size(Get.width / 5.6, 35),
                        bgColor: cY,
                        child: MyText(
                          text:"کپی",
                          size: 14,
                          color: cB,
                        ),
                      ),
                      SizedBox(width: 15,),


                      Text("RTh9876543Ddf%ss",style: TextStyle(color: cW,fontSize: 13),),

SizedBox(width: 10,),
                      Icon(
                        Icons.smart_toy,
                        color: cW,
                      ),




                    ],
                  )




              ),)
            ),
            Container(
              margin: EdgeInsets.only(right: 20,top: 12),
              alignment:Alignment.topRight,
              child:             Text(": انتقال اشتراک ربات به اکانت سایت ",style: TextStyle(color: cW,fontSize: 12),textAlign: TextAlign.right,),

            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: MyTextField(
                borderRadius: 10,
                height: 45,
                hint:"توکن داخل ربات را اینجا ورد کنید",
                controller: new TextEditingController(),
                maxLines: 3,
                suffixIcon: Icon(
                  Icons.description,
                  size: 25,
                  color: cGrey,
                ),
              ),
            ),
            MyTextButton(
                onTap: () {},
                size: Size(Get.width / 1.4, 35),
                bgColor: cY,
                child: MyText(
                  text:"ادغام ربات با سایت",
                  size: 14,
                  color: cB,
                ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
