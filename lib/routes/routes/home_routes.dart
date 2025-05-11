import 'package:flower_shop/routes/main_route.dart';
import 'package:flower_shop/views/screens/home/home_screen.dart';
import 'package:flower_shop/views/screens/login/login_screen.dart';
import 'package:flower_shop/views/screens/tabbar/tabbar_screen.dart';
import 'package:flutter/material.dart';

class HomeRoutes implements MainRoute {
  @override
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (context) {
          return LoginScreen();
        });
      case TabbarScreen.routeName:
        return MaterialPageRoute(builder: (context) {
          return TabbarScreen();
        });
      default:
        return null;
    }
  }
}
