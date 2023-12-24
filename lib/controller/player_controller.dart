import 'dart:async';

import 'package:get/get.dart';

class PlayerController extends GetxController{
var name = "".obs;
var max_progress = 120.obs;
var current_progress = 5.obs;
var hide_bars = false.obs;
var playing_status = false.obs;
Timer? timer;

PlayerController(){
  timer = Timer(Duration(seconds: 1), () {
    if(current_progress.value == max_progress.value){
      playing_status(false);
      update();
    }else{
      print("Playting");
      playing_status(true);
      update();
    }
  });
  playing_status.listen((p0) {
    print(p0);
    if(p0 == true){
      current_progress++;
    }else{
      timer!.cancel();
    }


  });
}

}