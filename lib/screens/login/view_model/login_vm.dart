import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sphinx_2023/screens/splash/repo/splash_repo.dart';

import '../../../common/navigator.dart';
import '../../../common/routing.dart';
import '../../../models/event.dart';
import '../../../models/profile.dart';
import '../repo/login_repo.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginVm extends ChangeNotifier {
  final LoginRepo loginRepo;
  final SplashRepo splashRepo;

  late Profile user;

  List<Event> events = [];

  LoginVm({required this.loginRepo, required this.splashRepo});

  bool isLoading = false;

  void setLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  bool isLoggedIn = false;

  void setLoggedIn(bool val) {
    isLoggedIn = val;
  }

  bool togglePass = true;

  void togglePassW() {
    togglePass = !togglePass;
    notifyListeners();
  }

  Future<void> signInGoogle() async{
    GoogleSignInAccount googleAuthCred = await loginRepo.signInWithGoogle();
    login(email: googleAuthCred.email , password: googleAuthCred.id);
    try {
      // loginRepo.login(email: );
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.red);
    }
  }

  Future<void> login({required String email, required String password}) async {
    setLoading(true);

    try {
      user = await loginRepo.login(email: email, password: password);
      setLoggedIn(true);
      events = await splashRepo.fetchEvents();
      await Navigator.of(NavigationService.navigatorKey.currentContext!,
              rootNavigator: true)
          .pushAndRemoveUntil(
              Routes.landingScreen(), (Route<dynamic> route) => false);
    } catch (e) {
      setLoggedIn(false);
      String errorText = e.toString();
      Fluttertoast.showToast(
          msg: errorText,
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.red);
    }
    setLoading(false);
  }

  void logout() async {
    setLoading(false);
    loginRepo.signOutGoogle();
    await Navigator.of(NavigationService.navigatorKey.currentContext!,
            rootNavigator: true)
        .pushAndRemoveUntil(
            Routes.loginScreen(), (Route<dynamic> route) => false);
  }
}
