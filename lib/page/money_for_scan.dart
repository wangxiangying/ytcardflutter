import 'dart:ui';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:barcode_scan/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ytcardapp/service/service.dart';
import 'package:ytcardapp/view/Dialog.dart';

class MoneyForScanPage extends StatefulWidget {
  @override
  MoneyForScanPageState createState() => MoneyForScanPageState();
}

class MoneyForScanPageState extends State<MoneyForScanPage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffeeeeee),
        appBar: AppBar(
            automaticallyImplyLeading: true,
            elevation: 0.5,
            brightness: Brightness.light,
            centerTitle: true,
            title: Text(
              '输入金额',
              style: TextStyle(color: Color(0xff000000)),
            ),
            backgroundColor: Color(0xffffffff),
            iconTheme: IconThemeData(color: Color(0xffffffff)),
            leading: IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            )),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        inputFormatters: [PrecisionLimitFormatter(2)],
                        controller: controller,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          border: InputBorder.none, //去掉输入框的下滑线
                          hintText: "输入金额",
                          prefixText: " ￥ ",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(100, 233, 233, 233),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: ConstrainedBox(
                          constraints: BoxConstraints.expand(height: 55.0),
                          child: RaisedButton(
                            color: Theme.of(context).primaryColor,
                            onPressed: () async {
                              if (controller.text.length == 0) {
                                MyToast().show("请输入金额");

                                return;
                              }

                              var result = await BarcodeScanner.scan(
                                  options: ScanOptions(strings: const {
                                "cancel": "关闭",
                                "flash_on": "打开闪光灯",
                                "flash_off": "关闭闪光灯",
                              }));
                              if (result == null) {
                                MyToast().show("扫码失败");

                                return;
                              }

                              if (result.rawContent == null) {
                                MyToast().show("扫码失败");

                                return;
                              }
                              if (result.rawContent.length == 0) {
                                return;
                              }
                              var net = await NetService.pay(
                                  controller.text, result.rawContent);
                              if (net.code != 200) {
                                MyToast().show(net.message);
                              } else {}
                              print(net.toString());
                            },
                            textColor: Colors.white,
                            child: Text("去扫码"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Color(0xffeeeeee),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

///价格输入框和数量输入框的限制
class PrecisionLimitFormatter extends TextInputFormatter {
  int _scale;

  PrecisionLimitFormatter(this._scale);

  RegExp exp = new RegExp("[0-9.]");
  static const String POINTER = ".";
  static const String DOUBLE_ZERO = "00";

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    ///输入完全删除
    if (newValue.text.isEmpty) {
      return TextEditingValue();
    }

    ///只允许输入小数
    if (!exp.hasMatch(newValue.text)) {
      return oldValue;
    }

    ///包含小数点的情况
    if (newValue.text.contains(POINTER)) {
      ///包含多个小数
      if (newValue.text.indexOf(POINTER) !=
          newValue.text.lastIndexOf(POINTER)) {
        return oldValue;
      }
      String input = newValue.text;
      int index = input.indexOf(POINTER);

      ///小数点后位数
      int lengthAfterPointer = input.substring(index, input.length).length - 1;

      ///小数位大于精度
      if (lengthAfterPointer > _scale) {
        return oldValue;
      }
    } else if (newValue.text.startsWith(POINTER) ||
        newValue.text.startsWith(DOUBLE_ZERO)) {
      ///不包含小数点,不能以“00”开头
      return oldValue;
    }
    return newValue;
  }
}
