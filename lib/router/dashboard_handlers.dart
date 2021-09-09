import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/views/icons_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';

class DashboardHandlers {

  static Handler dashboard = Handler(
    handlerFunc: (context, params) => authenticationValidator(DashboardView(), context)
  );

  static Handler icons = Handler(
    handlerFunc: (context, params) => authenticationValidator(IconsView(), context)
  );


  static Widget authenticationValidator(Widget authenticatedWidget, dynamic context) {
      final authProvider = Provider.of<AuthProvider>(context!);
      if (authProvider.authStatus == AuthStatus.authenticated)
        return authenticatedWidget;
      else 
        return LoginView();
    }
}