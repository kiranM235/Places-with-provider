import 'package:flutter/material.dart';
import 'package:places/src/core/navigation/route_paths.dart';
import 'package:places/src/screens/auth/login_screen.dart';
import 'package:places/src/screens/auth/signup_screen.dart';
import 'package:places/src/screens/dashboard/dashboard_screen.dart';

class Router {
  static Route onGenerateRoute(RouteSettings settings) {
    switch(settings.name) {
      case RoutePaths.LOGIN:
        return MaterialPageRoute(builder: (_) {
          return LoginScreen();
        });
        break;
      case RoutePaths.REGISTER:
        return MaterialPageRoute(builder: (_) {
          return SignUpScreen();
        });
        break;
      case RoutePaths.DASHBOARD:
        return MaterialPageRoute(builder: (_) {
          return DashboardScreen();
        });
        break;
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