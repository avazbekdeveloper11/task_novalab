import 'package:flutter/material.dart';
import 'package:task/screens/home_page/home_page.dart';
import 'package:task/screens/singel_page/singel_page.dart';

class RouterGenerator {
  static final RouterGenerator _instance = RouterGenerator._init();
  static RouterGenerator get instance => _instance;
  RouterGenerator._init();

  Route? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/home':
        return _route(const HomePage());
      case '/facts':
        return _route(const FactsPage());
    }
    return null;
  }

  MaterialPageRoute<dynamic> _route(page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}
