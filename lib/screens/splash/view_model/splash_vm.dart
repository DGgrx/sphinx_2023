import "package:flutter/material.dart";

import "../../../models/event.dart";
import "../repo/splash_repo.dart";

class SplashVM extends ChangeNotifier {
  // final DataStore store;
  // final UserProv userProv;
  // final AuthRepo authRepo;

  final SplashRepo splashRepo;


  SplashVM(this.splashRepo// {
      // required this.store,
      // required this.userProv,
      // required this.authRepo
      // }
      );

  List<Event> events = [];



  String getData(String param) {
    return "";
    // String? data = store.getString(param);
    // return data.toString();
  }
  Future<void> getEvents() async {
    events = await splashRepo.fetchEvents();
    notifyListeners();
  }

  Future<void> isLogged(BuildContext context) async {
    // String? logged = store.getString('loggedIn');
    // String? uid = store.getString('uid');
    //
    // if (logged != null && logged.toString() == 'true') {
    //   UserModel? currUser = await authRepo.getUserbyId(uid.toString());
    //   userProv.updateUserInfo(currUser as UserModel);
    //   await Navigator.of(NavigationService.navigatorKey.currentContext!,
    //       rootNavigator: true)
    //       .pushReplacement(Routes.homeScreen());
    // } else {
    //   await Navigator.of(NavigationService.navigatorKey.currentContext!,
    //       rootNavigator: true)
    //       .pushReplacement(Routes.landingScreen());
  }
}
