import 'package:flutter/cupertino.dart';
import 'package:ytcardapp/utils/SPs.dart';
import 'package:ytcardapp/view/Dialog.dart';

import '../LoginModel.dart';

class LoginNotifier extends ChangeNotifier {
  LoginModel _loginModel;

   get loginModel => _loginModel;

  set loginModel(LoginModel item) {
    SPs.saveToken(item.data.accessToken);
    _loginModel = item;
    notifyListeners();
  }
}
