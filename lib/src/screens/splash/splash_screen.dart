import 'package:flutter/material.dart';
import 'package:places/src/core/bse_widget.dart';
import 'package:places/src/core/locator/service_locator.dart';
import 'package:places/src/viewmodels/splash/splash_view_model.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseWidget<SplashViewModel>(
        model: locator<SplashViewModel>(),
        builder: (BuildContext context, SplashViewModel model, Widget? child) {
          return Container();
        },
      ),
    );
  }
}
