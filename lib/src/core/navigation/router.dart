import 'package:flutter/material.dart';
import 'package:places/src/core/navigation/route_paths.dart';
import 'package:places/src/screens/auth/login_screen.dart';
import 'package:places/src/screens/auth/signup_screen.dart';
import 'package:places/src/screens/dashboard/dashboard_screen.dart';
import 'package:places/src/screens/dashboard/add_new_place_view.dart';
import 'package:places/src/screens/splash/splash_screen.dart';

class Router {
  static Route onGenerateRoute(RouteSettings settings) {
    switch(settings.name) {
      case RoutePaths.SPLASH:
        return MaterialPageRoute(builder: (_) {
          return SplashScreen();
        });
      case RoutePaths.LOGIN:
        return MaterialPageRoute(builder: (_) {
          return LoginScreen();
        });

      case RoutePaths.REGISTER:
        return MaterialPageRoute(builder: (_) {
          return SignUpScreen();
        });

      case RoutePaths.DASHBOARD:
        return MaterialPageRoute(builder: (_) {
          return DashboardScreen();
        });
      case RoutePaths.ADD_NEW:
        return MaterialPageRoute(builder: (_) {
          return AddNewPlaceView();
        });

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
          body: Center(
            child: Text("No matching route found"),
          ),
          );
        });
    }
  }
}