import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:places/src/core/locator/service_locator.dart';
import 'package:places/src/core/navigation/route_paths.dart';
import 'package:places/src/core/navigation/router.dart';

Future<void> main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(App());
}
Future<void> handleBackgroundMessage(RemoteMessage message) async {}

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