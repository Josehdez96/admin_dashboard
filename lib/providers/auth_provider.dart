
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {

  String? _token;

  login(String email, String password) {
    //TODO: http request - Mock http token response
    _token = 'jiasgdyugaydbajui74wdfjkhaSDB.SUDYUW5ss';
    LocalStorage.prefs.setString('token', _token!);

    // TODO: navigate to dashboard
    notifyListeners();
  }
}