
import 'net-utils.dart';

class Global {

  //初始化全局信息，会在APP启动时执行
  static Future init()   {
     return NetUtil.init();
  }
}