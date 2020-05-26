import 'package:shared_preferences/shared_preferences.dart';

class SPs {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static get prefs => _prefs;

//保存数据
  static void saveStringCache(String name, String value) async {
    SharedPreferences prefs = await _prefs   ;
    prefs.setString(name, value);
    prefs.commit();
  }

//获取数据
  static Future<String> fromCache(String name) async {
    SharedPreferences prefs = await _prefs ;
    String strValue = prefs.getString(name);
    return strValue;
  }

  static const _token = "token";
   static String TOKEN;

  static void saveToken(String token) {
    TOKEN = token;
    SPs.saveStringCache(SPs._token, token);
  }

  static Future<String> getToken() async {
    if (TOKEN == null) {
      TOKEN = await fromCache(_token);
    }
    return TOKEN;
  }
}
