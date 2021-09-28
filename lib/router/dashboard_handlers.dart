import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/views/categories_view.dart';
import 'package:admin_dashboard/ui/views/blank_view.dart';
import 'package:admin_dashboard/ui/views/icons_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';

class DashboardHandlers {

  static Handler dashboard = Handler(
    handlerFunc: (context, params) => authenticationValidator(DashboardView(), Flurorouter.dashboardRoute, context)
  );

  static Handler icons = Handler(
    handlerFunc: (context, params) => authenticationValidator(IconsView(), Flurorouter.iconsRoute, context)
  );

  static Handler blank = Handler(
    handlerFunc: (context, params) => authenticationValidator(BlankView(), Flurorouter.blankRoute, context)
  );

  static Handler categories = Handler(
    handlerFunc: (context, params) => authenticationValidator(CategoriesView(), Flurorouter.categoriesRoute, context)
  );


  static Widget authenticationValidator(Widget authenticatedWidget, String routeName, dynamic context) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(routeName);
      if (authProvider.authStatus == AuthStatus.authenticated)
        return authenticatedWidget;
      else 
        return LoginView();
    }
}