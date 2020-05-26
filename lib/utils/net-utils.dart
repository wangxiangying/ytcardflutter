import 'package:dio/dio.dart';
import 'package:imei_plugin/imei_plugin.dart';

import 'SPs.dart';

//要查网络请求的日志可以使用过滤<net>
class NetUtil {
  static const String GET = "get";
  static const String POST = "post";

  static var imei;
  static var dio = new Dio(
      new BaseOptions(baseUrl: "https://api.ytpay.com.cn/1.0/", headers: {
    "Content-Type": "application/json;charset=utf-8",
    "Accept": "application/json;charset=utf-8"
  }));

  static Future init() async {
    imei = await ImeiPlugin.getImei();
    dio.options.headers["X-DeviceId"] = imei;
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  //get请求
  static Future<Map<String, dynamic>> get(
      String url, Map<String, String> params) async {
    if (params != null && params.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    dio.options.headers["Authorization"] = "Bearer " + await SPs.getToken();
    var response = await dio.get(url);
    return Future.value(response.data);
  }

  //post请求
  static Future<Map<String, dynamic>> post(
      String url, Map<String, String> params) async {
    var response = await dio.post(url, data: params);
    return Future.value(response.data);
  }
}
