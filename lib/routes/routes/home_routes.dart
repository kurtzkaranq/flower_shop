import 'package:flower_shop/routes/main_route.dart';
import 'package:flutter/src/widgets/navigator.dart';

class HomeRoutes implements MainRoute {
  @override
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return null;
    }
  }
}
