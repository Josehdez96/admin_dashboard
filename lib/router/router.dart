import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/router/dashboard_handlers.dart';
import 'package:admin_dashboard/router/not_found_page_handlers.dart';
import 'package:admin_dashboard/router/admin_handlers.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();
  static String rootRoute = '/';
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';
  static String dashboardRoute = '/dashboard';
  static String iconsRoute = '/dashboard/icons';
  static String blankRoute = '/dashboard/blank';



  static void configureRoutes() {
    // Auth Routes
    router.define(rootRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute, handler: AdminHandlers.register, transitionType: TransitionType.none);

    // Dashboard
    router.define(dashboardRoute, handler: DashboardHandlers.dashboard, transitionType: TransitionType.none);
    router.define(iconsRoute, handler: DashboardHandlers.icons, transitionType: TransitionType.none);
    router.define(blankRoute, handler: DashboardHandlers.blank, transitionType: TransitionType.none);


    // 404
    router.notFoundHandler = NotFoundPageHandlers.notFound;
  }
}