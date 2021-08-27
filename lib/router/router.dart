import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();
  static String rootRoute = '/';
  // Auth Routes
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';
  // Dashboard
  static String dashboardRoute = '/dashboard';

  static void configureRoutes() {
    router.define(rootRoute, handler: AdminHandlers.login);

    // Auth Routes
    router.define(loginRoute, handler: AdminHandlers.login);

    // TODO: handler to this route
    // router.define(registerRoute, handler: handler);
  }
}