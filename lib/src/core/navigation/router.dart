import 'package:flutter/material.dart';
import 'package:places/src/core/navigation/route_paths.dart';
import 'package:places/src/model/dashboard/place_model.dart';
import 'package:places/src/screens/auth/login_screen.dart';
import 'package:places/src/screens/auth/signup_screen.dart';
import 'package:places/src/screens/dashboard/dashboard_screen.dart';
import 'package:places/src/screens/dashboard/add_new_place_view.dart';
import 'package:places/src/screens/dashboard/place_detail_view.dart';
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
      case RoutePaths.PLACE_DETAIL:
        final PlaceModel place = settings.arguments as PlaceModel;
        return MaterialPageRoute(builder: (_) {
          return PlaceDetailView(place:place);
        });
      case RoutePaths.ADD_NEW:
        return MaterialPageRoute(builder: (_) {
          return AddNewPlaceView();
        });
      // case RoutePaths.MAP:
      //   bool readOnly = settings.arguments as bool;
      //   return MaterialPageRoute(
      //       builder: (_) {
      //         return MapView(
      //           readOnly:readOnly,
      //         );
      //       },
      //       fullscreenDialog: true
      //   );

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