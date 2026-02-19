import 'package:chat_now/config/route_manager/routes.dart';
import 'package:chat_now/features/register/presentation/pages/register_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../features/home/presentation/pages/home_view.dart';
import '../../features/login/presentation/pages/login_view.dart';
import '../../features/splash/splash_view.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      /// Splash Screen
      case Routes.splashRoute:
        return CupertinoPageRoute(builder: (_) => SplashView());

      /// Login Screen
      case Routes.loginRoute:
        return CupertinoPageRoute(builder: (_) => LoginView());

      /// Register Screen
      case Routes.registerRoute:
        return CupertinoPageRoute(builder: (_) => RegisterView());

      /// Home Screen
      case Routes.homeRoute:
        return CupertinoPageRoute(builder: (_) => HomeView());

      /// Default (Unknown Route)
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Page Not Found', style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
