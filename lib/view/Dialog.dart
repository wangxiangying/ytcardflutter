import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class  MyToast {
  void show(text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

class MyDialog {
  static dynamic ctx;

  void alert(text, clickOk) {
    // 请求前显示弹窗
    showDialog(
        context: ctx,
        builder: (ctx) {
          {
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
                      Row(children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: RaisedButton(
                              child: Text('确定'),
                              onPressed: () {
                                clickOk();
                                complete();
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
