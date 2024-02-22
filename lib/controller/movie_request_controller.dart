import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/constant/utils.dart';
import 'package:bamabin/models/movie_request_movie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieRequestController extends GetxController {
  TextEditingController txtYear = TextEditingController();
  TextEditingController txtMovieName = TextEditingController();
  Rx<AdvancedSearchType> selectedType = AdvancedSearchType.none.obs;
  RxBool isLoadingData = false.obs;
  RxBool isLoadingSubmitting = false.obs;
  RxList<MovieRequestModel> listMovieRequest = <MovieRequestModel>[].obs;

  void getRequests() {
    isLoadingData(true);
    ApiProvider().getMovieRequests().then((res) {
      listMovieRequest.clear();

      if (res.body != null) {
        if (res.body['status'] == true) {
          List tmp = res.body['result'];
          for (var e in tmp) {
            listMovieRequest.add(MovieRequestModel.fromJson(e));
          }
        }
      }
      print(res.body);
      isLoadingData(false);
    });
  }

  void submitRequest() {
    if (selectedType.value != AdvancedSearchType.none &&
        txtYear.text.length == 4 &&
        int.parse(txtYear.text) > 1900 &&
        txtMovieName.text.length > 3) {
      String type = switch (selectedType.value) {
        AdvancedSearchType.none => 'نوع',
        AdvancedSearchType.animations => 'animations',
        AdvancedSearchType.anime => 'anime',
        AdvancedSearchType.movies => 'movies',
        AdvancedSearchType.series => 'series',
        AdvancedSearchType.all => '',
      };
      isLoadingSubmitting(true);
      ApiProvider()
          .sendMovieRequest(
              title: txtMovieName.text, release: txtYear.text, type: type)
          .then((res) {
        isLoadingSubmitting(false);
        if (res.body != null) {
          if (res.body['status'] == true) {
            Get.back();
            getRequests();
            showMessage(text: 'ثبت شد', isSucces: true);
          }
        }
        print(res.body);
      });
    } else {
      showMessage(text: 'لطفا مقادیر بالا را وادر نمایید', isSucces: false);
    }
  }
}
