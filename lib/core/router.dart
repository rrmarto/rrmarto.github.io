import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/presentation/pages/not_found_404.dart';
import 'package:portfolio/presentation/pages/home_page.dart';
import 'package:portfolio/utils/utils.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case firstScreen:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      default:
        return MaterialPageRoute(builder: (_) =>  NotFound404(route: settings.name!,));
    }
  }
}
