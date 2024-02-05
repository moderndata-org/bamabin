import 'package:bamabin/models/film_model.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  Rx<FilmModel> selectedFilm = FilmModel().obs;
}
