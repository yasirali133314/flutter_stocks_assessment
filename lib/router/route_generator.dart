import 'package:flutter/material.dart';
import 'package:flutter_stocks_assessment/router/routes.dart';
import 'package:flutter_stocks_assessment/views/home_screen.dart';
import 'package:flutter_stocks_assessment/views/splash_screen.dart';
import 'package:flutter_stocks_assessment/views/stock_detail_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.stockDetailRoute:
        return MaterialPageRoute(
            builder: (_) => StockDetailScreen(
                  symbol: settings.arguments as String,
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
