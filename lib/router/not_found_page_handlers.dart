import 'package:admin_dashboard/ui/views/not_found_view.dart';
import 'package:fluro/fluro.dart';

class NotFoundPageHandlers {

  static Handler notFound = Handler(
    handlerFunc: (context, params) {
      return NotFoundView();
    }
  );
}