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
    var response;
    try {
      response = await dio.get(url);
    } on DioError catch (e) {
      print('get error---------$e');
      formatError(e);
    }

    return Future.value(response.data);
  }

  //post请求
  static Future<Map<String, dynamic>> post(
      String url, Map<String, String> params) async {
    var response;
    try {
      response = await dio.post(url, data: params);
    } on DioError catch (e) {
      print('post error---------$e');
      formatError(e);
    }
    return Future.value(response.data);
  }

  static void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      // It occurs when url is opened timeout.
      print("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      // It occurs when url is sent timeout.
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      //It occurs when receiving timeout
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      // When the server response, but with a incorrect status, such as 404, 503...
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      // When the request is cancelled, dio will throw a error with this type.
      print("请求取消");
    }   else {
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      print("未知错误");
    }
  }
}
