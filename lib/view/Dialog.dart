import 'package:flutter/material.dart';

class MyDialog {
  static dynamic ctx;

  void alert(text) {
    // 请求前显示弹窗
    showDialog(
        context: ctx,
        builder: (ctx) {
          {
            // 用Scaffold返回显示的内容，能跟随主题
            return Scaffold(
              backgroundColor: Colors.transparent, // 设置透明背影
              body: Center(
                // 居中显示
                child: Container(
                  width: 320,
                  height: 160,
                  decoration: new BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x66888888),
                          offset: Offset(1.0, 1.0),
                          blurRadius: 12.0,
                          spreadRadius: 1.0),
                      BoxShadow(color: Color(0xffffffff))
                    ],
                  ),
                  child: Column(
                    // 定义垂直布局
                    mainAxisAlignment: MainAxisAlignment.center,
                    // 主轴居中布局，相关介绍可以搜下flutter-ui的内容
                    children: <Widget>[
                      // CircularProgressIndicator自带loading效果，需要宽高设置可在外加一层sizedbox，设置宽高即可
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "提示",
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          text,
                          style: TextStyle(color: Color(0xff6666666)),
                        ),
                      ),
                      // 文字
                      // 触发关闭窗口
                      Row(children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: RaisedButton(
                              child: Text('确定'),
                              onPressed: () {
                                complete();
                                  print('close');
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: RaisedButton(
                              child: Text('取消'),
                              onPressed: () {
                                complete();
                                print('close');
                              },
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ), // 自带loading效果，需要宽高设置可在外加一层sizedbox，设置宽高即可
              ),
            );
          }
        });
  }

  void complete() {
    // 完成后关闭loading窗口
    Navigator.of(ctx, rootNavigator: true).pop();
  }
}
