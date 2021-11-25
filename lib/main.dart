import 'package:flutter/material.dart';
import 'package:places/src/core/locator/service_locator.dart';
import 'package:places/src/screens/auth/login_screen.dart';

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
        home: LoginScreen(),
    );
  }
}
