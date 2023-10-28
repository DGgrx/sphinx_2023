import 'package:flutter/cupertino.dart';
import 'package:sphinx_2023/screens/home/landing.dart';

class RouteName {
  static const landingScreen = "landingScreen";

}

class Routes {
  static cupertinoRoute(
      String name, Widget Function(BuildContext) widgetProvider) =>
      CupertinoPageRoute(
        settings: RouteSettings(name: name),
        builder: (context) => widgetProvider(context),
      );

  static Route landingScreen() =>
      cupertinoRoute(RouteName.landingScreen, (ctx) => Landing());

}
