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
      OrderBy? orderBy}) async {
    Map<String, String> m = {
      'type': switch (type) {
        BottomNavType.animations => 'animations',
        BottomNavType.anime => 'anime',
        BottomNavType.movies => 'movies',
        BottomNavType.series => 'series',
      },
    };
    m.addIf(genreId != null, 'genre_id', '$genreId');
    m.addIf(page != null, 'page', '$page');

    m.addIf(
        orderBy != null,
        'order_by',
        '${switch (orderBy) {
          OrderBy.date => 'date',
          OrderBy.imdb => 'imdb',
          OrderBy.modified => 'modified',
          null => null,
        }}');
    print(m);

    Response res = await get(
      '${base_url}archive/post_type',
      query: m,
    );
    return res;
  }
}
