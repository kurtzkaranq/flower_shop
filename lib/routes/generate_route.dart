import 'package:flower_shop/routes/main_route.dart';
import 'package:flower_shop/routes/routes/home_routes.dart';
import 'package:flutter/material.dart';

class GenerateRoute {
  final List<MainRoute> routers = [
    HomeRoutes(),
  ];

  Route<dynamic>? generateRoute(RouteSettings settings) {
    for (final router in routers) {
      final value = router.generateRoute(settings);
      if (value != null) {
        return value;
      }
    }
    return null;
  }
}
