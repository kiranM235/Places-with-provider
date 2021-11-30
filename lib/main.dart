import 'package:flutter/material.dart' hide Router;
import 'package:places/src/core/locator/service_locator.dart';
import 'package:places/src/core/navigation/route_paths.dart';
import 'package:places/src/core/navigation/router.dart';

Future<void> main() async {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: "Places",
        theme: ThemeData.light(),
        // home: LoginScreen(),
      // routes: {
      //     "/": (_) => LoginScreen(),
      //   "/register": (_) => SignUpScreen(),
      // },
      onGenerateRoute: Router.onGenerateRoute,
      initialRoute: RoutePaths.SPLASH,
    );
  }
}

/// ----------------------*** Navigation in flutter *** -------------------
/// 4 division(ways) priority wise weight on decreasing order
/// 1. passing *home* in MaterialApp
/// 2. passing *routes--- {}* in MaterialApp
/// 3. passing *onGenerateRoute*--- {Route<dynamic>? Function(RouteSettings)? onGenerationRoute} in MaterialApp
/// 4. passing *onUnknownRoute*--- {Route<dynamic>? Function(RouteSettings)? onUnknownRoute} --> if passed route is not found in MaterialApp