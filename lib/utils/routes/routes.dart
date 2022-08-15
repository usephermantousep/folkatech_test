import 'package:flutter/material.dart';
import 'package:folkatechtest/view/menu_view.dart';
import 'package:folkatechtest/view/menu_view_detail.dart';

class Routes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/menu_page':
        return MaterialPageRoute(builder: (_) => const MenuView());
      case '/detail_menu_page':
        return MaterialPageRoute(
            builder: (_) => const MenuViewDetail(), settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
