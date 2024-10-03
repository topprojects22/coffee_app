import 'package:boilerplate/presentation/home/home.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String home = '/post';

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    home: (BuildContext context) => const HomeScreen(),
  };
}
