// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../constant/classes.dart';

class ApiProvider extends GetConnect {
  String base_url = "https://www.aliamaterasu.ir/api/";
  var head;
  var timeout = const Duration(seconds: 15);
  var maxAuthRetries = 5;
  ApiProvider() {
    // head = {"Authorization": "Token $token"};
  }

  Future<Response> sendCode({required String phoneNumber}) async {
    Map map = {'phone_number': phoneNumber};
    Response res = await post('${base_url}send-code', map);
    return res;
  }

  Future<Response> archive(
      {required BottomNavType type,
      String? page,
      String? genreId,
      required OrderBy orderBy}) async {
    Map<String, String> m = {
      'type': switch (type) {
        BottomNavType.home => 'movies',
        BottomNavType.animations => 'animations',
        BottomNavType.anime => 'anime',
        BottomNavType.movies => 'movies',
        BottomNavType.series => 'series',
      },
    };
    m.addIf(genreId != null, 'genre_id', '$genreId');
    m.addIf(page != null, 'page', '$page');

    m.addIf(
        orderBy != OrderBy.none,
        'order_by',
        '${switch (orderBy) {
          OrderBy.none => null,
          OrderBy.date => 'date',
          OrderBy.imdb => 'imdb',
          OrderBy.modified => 'modified',
        }}');
    Response res = await get(
      '${base_url}archive/post_type',
      query: m,
    );
    return res;
  }

  Future<Response> getSliders() async {
    Response res = await get('${base_url}home/slider');
    return res;
  }

  Future<Response> search({required String text, required int page}) async {
    Response res =
        await get('${base_url}search', query: {'s': text, 'page': '$page'});
    return res;
  }

  Future<Response> getMainSections() async {
    Response res = await get('${base_url}home/sections');
    return res;
  }
  Future<Response> getCountries() async {
    Response res = await get('${base_url}filter/countries');
    return res;
  }
  Future<Response> getGenres() async {
    Response res = await get('${base_url}filter/genres');
    return res;
  }
  Future<Response> getAgeRates() async {
    Response res = await get('${base_url}filter/age_rates');
    return res;
  }
}
