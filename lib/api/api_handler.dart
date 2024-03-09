// ignore_for_file: avoid_print

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constant/classes.dart';

class ApiProvider extends GetConnect {
  String base_url = "https://bamabin1.top/api/";
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

  Future<Response> getMovieDetail({
    required String id,
    required bool isLogin,
  }) async {
    String url = '${base_url}post/show/$id';
    Response res = isLogin ? await get(url, headers: head) : await get(url);
    return res;
  }

  Future<Response> sendBugReport({
    required String department,
    required String content,
  }) async {
    FormData frm = FormData({
      'department': department,
      'content': content,
    });
    Response res =
        await post('${base_url}panel/report/create', frm, headers: head);
    return res;
  }

  Future<Response> changePassword({
    required String current_password,
    required String password,
    required String re_password,
  }) async {
    FormData frm = FormData({
      'current_password': current_password,
      'password': password,
      're_password': re_password,
    });
    Response res =
        await post('${base_url}panel/change_password', frm, headers: head);
    return res;
  }

  Future<Response> archive({
    required BottomNavType type,
    String? page,
    String? genreId,
    String? imdb_min_rate,
    required OrderBy orderBy,
    required bool isLogin,
  }) async {
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
          OrderBy.favorite => 'date',
          OrderBy.imdb => 'imdb',
          OrderBy.newest => 'modified',
          OrderBy.releaseDate => 'modified',
          OrderBy.update => 'modified',
        }}');
    Response res = isLogin
        ? await get('${base_url}archive/post_type', query: m, headers: head)
        : await get(
            '${base_url}archive/post_type',
            query: m,
          );
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
    Response res =
        await post('${base_url}panel/edit_profile', data, headers: head);
    return res;
  }

  Future<Response> login({
    required String? username,
    required String? password,
  }) async {
    var data = FormData({
      "username": username,
      "password": password,
    });
    print('${base_url}login');
    print(data.fields);
    Response res = await post('${base_url}login', data);
    return res;
  }

  Future<Response> forget({
    required String? email,
  }) async {
    var data = FormData({"email": email});
    Response res = await post('${base_url}forget', data);
    return res;
  }

  Future<Response> checkLogin() async {
    print(head);
    Response res = await get('${base_url}is_login', headers: head);
    return res;
  }

  Future<Response> setFavorite({
    required String? action,
    required String? id,
  }) async {
    FormData frm = FormData({
      'post_id': '$id',
      'action': action,
    });
    Response res = await post('${base_url}watchlist/set', frm, headers: head);
    return res;
  }

  Future<Response> setLike({
    required String? id,
    required String? action,
  }) async {
    // FormData frm = FormData({
    //   'post_id': '$id',
    //   'action': action,
    // });
    Response res = await get('${base_url}like/post/$id/$action', headers: head);
    print(res.body);
    return res;
  }

  Future<Response> getFavorites() async {
    Response res = await get('${base_url}watchlist/list', headers: head);
    return res;
  }

  Future<Response> addOrderList({
    required String? title,
    required String? content,
  }) async {
    FormData frm = FormData({
      'title': title,
      'content': content,
    });
    Response res =
        await post('${base_url}panel/lists/create', frm, headers: head);
    return res;
  }

  Future<Response> editOrderList({
    required String? listId,
    required String? title,
    required String? content,
  }) async {
    FormData frm = FormData({
      'title': title,
      'content': content,
    });
    Response res =
        await post('${base_url}panel/lists/$listId/edit', frm, headers: head);
    return res;
  }

  Future<Response> deleteOrderListItem({
    required String? post_id,
    required String? list_id,
  }) async {
    FormData frm = FormData({
      'post_id': post_id,
    });
    Response res = await post(
        '${base_url}panel/lists/${list_id}/remove_item', frm,
        headers: head);
    return res;
  }

  Future<Response> addOrderListItem({
    required String? post_id,
    required String? list_id,
  }) async {
    FormData frm = FormData({
      'post_id': post_id,
    });
    Response res = await post('${base_url}panel/lists/${list_id}/add_item', frm,
        headers: head);
    return res;
  }

  Future<Response> sendMovieRequest({
    required String? title,
    required String? release,
    required String? type,
  }) async {
    FormData frm = FormData({
      'title': title,
      'release': release,
      'type': type,
    });
    Response res =
        await post('${base_url}panel/request/create', frm, headers: head);
    return res;
  }

  Future<Response> getMovieRequests() async {
    Response res = await get('${base_url}panel/request/index', headers: head);
    return res;
  }

  Future<Response> getOrderListDetails({
    required String? list_id,
  }) async {
    Response res = await get('${base_url}panel/lists/$list_id', headers: head);
    return res;
  }

  Future<Response> getOrdersList() async {
    Response res = await get('${base_url}panel/lists', headers: head);
    return res;
  }

  Future<Response> aboutUs() async {
    Response res = await get('${base_url}informations');
    return res;
  }

  Future<Response> deleteOrderList({
    required String? listId,
  }) async {
    Response res =
        await get('${base_url}panel/lists/$listId/delete', headers: head);
    return res;
  }

  Future<Response> getProfile() async {
    Response res = await get('${base_url}panel/profile', headers: head);
    return res;
  }

  Future<Response> notifications({required String? page}) async {
    Response res =
        await get('${base_url}notification?page=${page}', headers: head);
    return res;
  }

  Future<Response> notification({required String? id}) async {
    Response res = await get('${base_url}notification/$id', headers: head);
    return res;
  }

  Future<Response> readNotification({required String? id}) async {
    Response res = await get('${base_url}notification/$id/read', headers: head);
    return res;
  }

  Future<Response> deleteAllNotifications() async {
    Response res =
        await get('${base_url}notification/delete_all', headers: head);
    return res;
  }

  Future<Response> tickets() async {
    Response res = await get('${base_url}panel/ticket/index', headers: head);
    return res;
  }

  Future<Response> singleTicket({required String? id}) async {
    Response res = await get('${base_url}panel/ticket/${id}', headers: head);
    return res;
  }

  Future<Response> departments() async {
    Response res =
        await get('${base_url}panel/ticket/departments', headers: head);
    return res;
  }

  Future<Response> reportDepartments() async {
    Response res =
        await get('${base_url}panel/report/departments', headers: head);
    return res;
  }

  Future<Response> createTicket(
      {required String? title,
      required String? department_id,
      required String? content}) async {
    var data = FormData(
        {"title": title, "department": department_id, "content": content});
    Response res =
        await post('${base_url}panel/ticket/create', data, headers: head);
    return res;
  }

  Future<Response> submitComment({
    required String content_comment,
    required String post_id,
    String? reply_comment_id,
  }) async {
    var data = FormData({
      "content_comment": content_comment,
      "parent_comment_id": reply_comment_id,
    });
    Response res =
        await post('${base_url}comment/add/$post_id', data, headers: head);
    return res;
  }

  Future<Response> replyTicket(
      {required String? id, required String? content}) async {
    var data = FormData({"content": content});
    Response res =
        await post('${base_url}panel/ticket/${id}/reply', data, headers: head);
    return res;
  }

  Future<Response> closeTicket({required String? id}) async {
    Response res =
        await get('${base_url}panel/ticket/${id}/close', headers: head);
    return res;
  }

  Future<Response> checkVip() async {
    Response res = await get('${base_url}have_vip', headers: head);
    return res;
  }

  Future<Response> vipInfo() async {
    Response res = await get('${base_url}vip_info', headers: head);
    return res;
  }

  Future<Response> plans() async {
    Response res = await get('${base_url}vip/plans');
    return res;
  }

  Future<Response> planDetails({required String? id}) async {
    Response res = await get('${base_url}vip/plan/${id}', headers: head);
    return res;
  }

  Future<Response> gateways() async {
    Response res = await get('${base_url}vip/gateways', headers: head);
    return res;
  }

  Future<Response> checkDiscountCode(
      {required String? plan_id, required String? discount_code}) async {
    var data = FormData({"discount_code": discount_code});

    Response res = await post(
        '${base_url}vip/plan/${plan_id}/verify_discount_code', data,
        headers: head);
    return res;
  }

  Future<Response> payment(
      {required String? plan_id,
      required String? gateway,
      String? discount_code}) async {
    var data = FormData({
      "plan_id": plan_id,
      "gateway": gateway,
    });
    if (discount_code != null)
      data.fields.add(MapEntry("discount_doce", discount_code));

    Response res =
        await post('${base_url}vip/select_plan', data, headers: head);
    return res;
  }

  Future<Response> getBotToken() async {
    Response res = await get('${base_url}telegram/get_token', headers: head);
    return res;
  }

  Future<Response> migrateBotToApp(
      {required String? telegram_bot_site_token}) async {
    var data = FormData({
      "telegram_bot_site_token": telegram_bot_site_token,
    });
    Response res = await post('${base_url}telegram/sync', data, headers: head);
    return res;
  }
}
