import 'package:flutter/cupertino.dart';
import 'package:sphinx_2023/screens/home/landing.dart';
import 'package:sphinx_2023/screens/login/login.dart';

class RouteName {
  static const landingScreen = "landingScreen";
  static const loginScreen = "loginScreen";

}

class Routes {
  static cupertinoRoute(
      String name, Widget Function(BuildContext) widgetProvider) =>
      CupertinoPageRoute(
        settings: RouteSettings(name: name),
        builder: (context) => widgetProvider(context),
      );

  static Route landingScreen() =>
      cupertinoRoute(RouteName.landingScreen, (ctx) => const Landing());

  static Route loginScreen() =>
      cupertinoRoute(RouteName.landingScreen, (ctx) => const LoginScreen());

}
