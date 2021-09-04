
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/cupertino.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated
}

class AuthProvider extends ChangeNotifier {

  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    this.isAuthenticated();
  }

  login(String email, String password) {
    // TODO: http request - Mock http token response
    this._token = 'jiasgdyug.aydbajui74wdfjkhaSDB.SUDYUW5ss';
    LocalStorage.prefs.setString('token', _token!);
    isAuthenticated();
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if ( token == null ) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    // TODO: request to the backend to check if token is valid
    Future.delayed(Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}