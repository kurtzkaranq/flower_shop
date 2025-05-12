import 'package:flower_shop/routes/main_route.dart';
import 'package:flower_shop/views/screens/all_product/all_product_screen.dart';
import 'package:flower_shop/views/screens/cart/cart_screen.dart';
import 'package:flower_shop/views/screens/login/login_screen.dart';
import 'package:flower_shop/views/screens/order/order_confirmation_screen.dart';
import 'package:flower_shop/views/screens/order/order_history_screen.dart';
import 'package:flower_shop/views/screens/order/order_screen.dart';
import 'package:flower_shop/views/screens/order/order_successful_screen.dart';
import 'package:flower_shop/views/screens/product/product_screen.dart';
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
      case AllProductScreen.routeName:
        return MaterialPageRoute(builder: (context) {
          return AllProductScreen();
        });
      case ProductScreen.routeName:
        return MaterialPageRoute(builder: (context) {
          return ProductScreen();
        });
      case CartScreen.routeName:
        return MaterialPageRoute(builder: (context) {
          return CartScreen();
        });
      case OrderScreen.routeName:
        return MaterialPageRoute(builder: (context) {
          return OrderScreen();
        });
      case OrderConfirmationScreen.routeName:
        return MaterialPageRoute(builder: (context) {
          return OrderConfirmationScreen();
        });
      case OrderSuccessfulScreen.routeName:
        return MaterialPageRoute(builder: (context) {
          return OrderSuccessfulScreen();
        });
      case OrderHistoryScreen.routeName:
        return MaterialPageRoute(builder: (context) {
          return OrderHistoryScreen();
        });
      default:
        return null;
    }
  }
}
