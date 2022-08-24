import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/presentation/home_page.dart';
import 'package:portfolio/utils/utils.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case firstScreen:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
