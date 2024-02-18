// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constant/classes.dart';

class ApiProvider extends GetConnect {
  String base_url = "https://www.aliamaterasu.ir/api/";
  var head;
  var timeout = const Duration(seconds: 15);
  var maxAuthRetries = 5;
  GetStorage box = GetStorage('bamabin');
  ApiProvider() {
    if (box.hasData("api_key")) {
      var api_key = box.read("api_key");
      head = {"BAMABIN_API_KEY": "$api_key"};
    }
  }

  Future<Response> getMovieDetail({required String id}) async {
    String url = '${base_url}post/show/$id';
    Response res = await get(url);
    return res;
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
      String? imdb_min_rate,
      required OrderBy orderBy}) async {
    Map<String, String> m = {
      'type': switch (type) {
        BottomNavType.home => 'movies',
        BottomNavType.animations => 'animations',
        BottomNavType.anime => 'anime',
        BottomNavType.movies => 'movies',
        BottomNavType.series => 'series',
      },
      'imdb_min_rate': '$imdb_min_rate'
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
    print(m);
    return res;
  }

  Future<Response> getSliders() async {
    Response res = await get('${base_url}home/slider');
    return res;
  }

  Future<Response> getTaxonomy(
    String taxonomy,
    String id,
    String? page,
  ) async {
    Map<String, String> m = {};

    m.addIf(page != null, 'page', '$page');
    print('${base_url}archive/taxonomy/${taxonomy}/${id}');
    Response res =
        await get('${base_url}archive/taxonomy/${taxonomy}/${id}', query: m);
    return res;
  }

  Future<Response> search({required String text, required int page}) async {
    Response res =
        await get('${base_url}search', query: {'s': text, 'page': '$page'});
    return res;
  }

  Future<Response> advancedSearch(
      {required int page,
      String? genreId,
      String? countryId,
      String? ageRates,
      String? fromYear,
      String? toYear,
      String? fromImdb,
      String? toImdb,
      String? isDubbed,
      String? isSubtitle,
      required AdvancedSearchType type}) async {
    Map<String, dynamic> m = {
      'type': switch (type) {
        AdvancedSearchType.all => 'all',
        AdvancedSearchType.animations => 'animations',
        AdvancedSearchType.anime => 'anime',
        AdvancedSearchType.movies => 'movies',
        AdvancedSearchType.series => 'series',
        AdvancedSearchType.none => 'all',
      },
      'page': '$page',
      't[genre]': genreId,
      't[country]': countryId,
      'ageRates': ageRates,
      't[year_from]': fromYear,
      't[year_to]': toYear,
      'm[imdb_from]': fromImdb,
      'm[imdb_to]': toImdb,
      'm[dubbed]': isDubbed,
      'm[subtitle]': isSubtitle,
    };
    print(m);
    Response res = await get('${base_url}advanced_search/', query: m);
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

  Future<Response> register({
    required String username,
    required String email,
    String? phone,
    required String password,
    required String re_password,
  }) async {
    FormData data = FormData({
      "username": username,
      "email": email,
      "password": password,
      "phone": '${phone ?? ''}',
      "re_password": re_password,
    });
    Response res = await post('${base_url}register', data);
    return res;
  }

  Future<Response> updateProfile({
    required String nickname,
    String? description,
    String? first_name,
    String? last_name,
    String? phone,
    String? city,
  }) async {
    FormData data = FormData({
      "nickname": nickname,
      "description": description ?? '',
      "first_name": first_name ?? '',
      "last_name": last_name ?? '',
      "phone": phone ?? '',
      "city": city ?? '',
    });
    Response res = await post('${base_url}edit_profile', data, headers: head);
    return res;
  }

  Future<Response> login({
    required String? username,
    required String? password,
  }) async {
    var data = {
      "username": username,
      "password": password,
    };
    Response res = await post('${base_url}login', data);
    return res;
  }

  Future<Response> forget({
    required String? email,
  }) async {
    var data = {"email": email};
    Response res = await post('${base_url}forget', data);
    return res;
  }
}
