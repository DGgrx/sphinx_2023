import "package:flutter/material.dart";

import "../../../common/data_store.dart";
import "../../../common/navigator.dart";
import "../../../common/routing.dart";
import "../../login/view_model/login_vm.dart";
import "../repo/splash_repo.dart";

class SplashVM extends ChangeNotifier {
  final DataStore store;

  // final UserProv userProv;
  // final AuthRepo authRepo;

  final SplashRepo splashRepo;

  SplashVM({required this.store, required this.splashRepo}); // {

  // required this.userProv,
  // required this.authRepo
  // );

  String getData(String param) {
    return "";
    // String? data = store.getString(param);
    // return data.toString();
  }

  Future<void> isLogged(BuildContext context, LoginVm loginVm) async {
    String? logged = store.getString('loggedIn');
    String? id = store.getString('id');

    // print(id);
    // print(logged);

    if (logged != null && logged.toString() == 'true') {
      await loginVm.getUserDetails(id);
      await Navigator.of(NavigationService.navigatorKey.currentContext!,
              rootNavigator: true)
          .pushReplacement(Routes.landingScreen());
    } else {
      await Navigator.of(NavigationService.navigatorKey.currentContext!,
              rootNavigator: true)
          .pushReplacement(Routes.loginScreen());
    }
  }
}
