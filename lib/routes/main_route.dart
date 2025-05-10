import 'package:flutter/material.dart';

abstract class MainRoute {
  Route<dynamic>? generateRoute(RouteSettings settings);
}
