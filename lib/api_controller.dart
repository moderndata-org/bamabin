import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get_storage/get_storage.dart';

class ApiController extends GetConnect{
  String base_url = "https://www.aliamaterasu.ir/api/";
  String base_url_withoutapi = "https://www.aliamaterasu.ir";
  var head;
  String? token = GetStorage('bamabin').read('token');
  var timeout = const Duration(seconds: 15);
  var maxAuthRetries = 5;
  ApiController() {
  }

  Future<Response> getSliders() async{
    Response res = await get('${base_url}home/slider');
    return res;
  }

  Future<Response> getMainSections() async{
    Response res = await get('${base_url}home/sections');
    return res;
  }
}