import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/ui/views/categories_view.dart';
import 'package:admin_dashboard/ui/views/blank_view.dart';
import 'package:admin_dashboard/ui/views/icons_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:admin_dashboard/ui/views/users_view.dart';
import 'package:admin_dashboard/ui/views/user_view/user_view.dart';

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

  static Handler users = Handler(
    handlerFunc: (context, params) => authenticationValidator(UsersView(), Flurorouter.usersRoute, context)
  );

  static Handler user = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.userRoute);
      if (authProvider.authStatus == AuthStatus.authenticated){

        if (params['uid']?.first != null) {
          return UserView(uid: params['uid']!.first);
        } else {
          return UsersView();
        }

      } else {
        return LoginView();
      }
    }
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