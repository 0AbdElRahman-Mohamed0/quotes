import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quote_learn/core/utils/app_strings.dart';
import 'package:quote_learn/features/random_quote/presentation/screens/qoute_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String randomQuoteRoute = '/randomQuote';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return CupertinoPageRoute(builder: ((context) {
          return const QuoteScreen();
        }));

      // case Routes.randomQuoteRoute:
      //   return CupertinoPageRoute(builder: ((context) {
      //     return const QuoteScreen();
      //   }));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return CupertinoPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
