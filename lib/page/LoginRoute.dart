import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ytcardapp/model/LoginModel.dart';
import 'package:ytcardapp/model/notifier/LoginNotifier.dart';
import 'package:ytcardapp/service/service.dart';

import '../index.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  TextEditingController _unameController =
      new TextEditingController(text: "1000001");
  TextEditingController _pwdController =
      new TextEditingController(text: "123456");
  bool pwdShow = false; //密码是否显示明文
  GlobalKey _formKey = new GlobalKey<FormState>();
  bool _nameAutoFocus = true;

  @override
  void initState() {
    if (_unameController.text != null) {
      _nameAutoFocus = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/login_back.png"),
            fit: BoxFit.none,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 60)),
                Row(
                  children: <Widget>[
                    Text(
                      "欢迎您使用商管端",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 30)),
                TextFormField(
                    autofocus: _nameAutoFocus,
                    controller: _unameController,
                    decoration: InputDecoration(
                      labelText: "请输入店铺编号",
                      hintText: "店铺编号",
                      prefixIcon: Icon(Icons.person),
                    ),
                    // 校验用户名（不能为空）
                    validator: (v) {
                      return v.trim().isNotEmpty ? null : "请输入";
                    }),
                TextFormField(
                  controller: _pwdController,
                  autofocus: !_nameAutoFocus,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "请输入密码",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                            pwdShow ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            pwdShow = !pwdShow;
                          });
                        },
                      )),
                  obscureText: !pwdShow,
                  //校验密码（不能为空）
                  validator: (v) {
                    return v.trim().isNotEmpty ? null : "请输入密码";
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 55.0),
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: _onLogin,
                      textColor: Colors.white,
                      child: Text("登录"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onLogin() async {
    // 提交前，先验证各个表单字段是否合法
    if ((_formKey.currentState as FormState).validate()) {
      LoginModel user;
      try {
        user = await IndexService.login(
            _unameController.text, _pwdController.text);
      } catch (e) {
        //登录失败则提示
      } finally {
        // 隐藏loading框
//        Navigator.of(context).pop();
      }

      if (user != null) {

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => new IndexPage()));
      }
    }
  }
}

class GmLocalizations {}
