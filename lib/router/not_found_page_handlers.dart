import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/ui/views/not_found_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class NotFoundPageHandlers {
  static Handler notFound = Handler(handlerFunc: (context, params) {
    Provider.of<SideMenuProvider>(context!, listen: false).setCurrentPageUrl('404');
    return NotFoundView();
  });
}
