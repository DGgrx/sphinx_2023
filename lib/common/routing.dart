import 'package:flutter/cupertino.dart';
import 'package:sphinx_2023/screens/home/landing.dart';
import 'package:sphinx_2023/screens/login/login.dart';

import '../screens/admin/qr_user_details.dart';

class RouteName {
  static const landingScreen = "landingScreen";
  static const loginScreen = "loginScreen";
  static const qrScannedUser = "qrScannedUserScreen";

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

  static Route qrScannedUser() =>
      cupertinoRoute(RouteName.qrScannedUser, (ctx) => const QRScannedUserScreen());

}
