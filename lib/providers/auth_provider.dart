import 'package:flutter/material.dart';
import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/models/http/auth_response.dart';
import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/services/services.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated
}

class AuthProvider extends ChangeNotifier {
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    this.isAuthenticated();
  }

  login(String email, String password) async {
    final data = {
      'correo': email,
      'password': password
    };

    CafeApi.httpPost('/auth/login', data)
      .then((json) async {
        final authResponse = AuthResponse.fromMap(json);
        LocalStorage.prefs.setString('token', authResponse.token);
        CafeApi.configureDio();
        await isAuthenticated();
        NavigationService.replaceTo(Flurorouter.dashboardRoute);
      })
      .catchError((err) {
        NotificationsService.showSnackbarError('Usuario/password no valido');
      });
  }

  register(String email, String password, String name) {
    final data = {
      'nombre': name,
      'correo': email,
      'password': password,
    };

    CafeApi.httpPost('/usuarios', data)
      .then((json) async {
        final authResponse = AuthResponse.fromMap(json);
        LocalStorage.prefs.setString('token', authResponse.token);
        CafeApi.configureDio();
        await isAuthenticated();
        NavigationService.replaceTo(Flurorouter.dashboardRoute);
      })
      .catchError((error) {
        NotificationsService.showSnackbarError('Usuario ya existente');
      });
  }

  logout() {
    LocalStorage.prefs.remove('token');
    isAuthenticated();
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if ( token == null ) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    try {
      final response = await CafeApi.httpGet('/auth');
      final authResponse = AuthResponse.fromMap(response);
      LocalStorage.prefs.setString('token', authResponse.token);
      this.user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }
}