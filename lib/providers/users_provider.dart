import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/http/users_response.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/models/usuario.dart';

class UsersProvider extends ChangeNotifier {
  List<Usuario> users = [];
  bool isLoading = true;

  UsersProvider() {
    this.getPaginatedUsers();
  }

  getPaginatedUsers() async {
    final res = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    final usersResp = UsersResponse.fromMap(res);
    this.users = [...usersResp.usuarios];
    isLoading = false;
    notifyListeners();
  }

}