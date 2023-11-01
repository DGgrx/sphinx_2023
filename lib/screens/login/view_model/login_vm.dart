import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sphinx_2023/screens/splash/repo/splash_repo.dart';

import '../../../common/data_store.dart';
import '../../../common/navigator.dart';
import '../../../common/routing.dart';
import '../../../models/event.dart';
import '../../../models/profile.dart';
import '../repo/login_repo.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginVm extends ChangeNotifier {
  final LoginRepo loginRepo;
  final SplashRepo splashRepo;
  final DataStore store;


  late Profile user;

  List<Event> events = [];

  LoginVm({
    required this.store,
    required this.loginRepo,
    required this.splashRepo
  });

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

    try {
      GoogleSignInAccount googleAuthCred = await loginRepo.signInWithGoogle();
      print(googleAuthCred.id);
      print(googleAuthCred.email);
      setLoading(true);
      user = await loginRepo.login(email: googleAuthCred.email, password: googleAuthCred.id);
      print(user.email.toString());
      setLoggedIn(true);
      events = await splashRepo.fetchEvents();
      await Navigator.of(NavigationService.navigatorKey.currentContext!,
          rootNavigator: true)
          .pushAndRemoveUntil(
          Routes.landingScreen(), (Route<dynamic> route) => false);

    } catch (e) {
      setLoggedIn(false);
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.red);

    }
    setLoading(false);
  }

  Future<void> login({required String email, required String password}) async {
    setLoading(true);

    try {
      user = await loginRepo.login(email: email, password: password);
      setLoggedIn(true);
      events = await splashRepo.fetchEvents();

      await store.setString("loggedIn", "true");
      await store.setString("id",user.sId.toString());
      await store.setString("token", user.token.toString());

      print(user.token.toString());

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

  Future<void> getUserDetails(String? id)async{
    setLoading(true);
    try{
      // print("Inside the function");
      user = await splashRepo.getUserDetails(id.toString());
      events = await splashRepo.fetchEvents();
    }catch (e) {
      setLoggedIn(false);
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.red);

    }
    setLoading(false);

  }

  void logout() async {
    setLoading(false);
    store.delete(key: 'id');
    store.delete(key: 'loggedIn');
    store.delete(key: 'token');
    loginRepo.signOutGoogle();
    await Navigator.of(NavigationService.navigatorKey.currentContext!,
            rootNavigator: true)
        .pushAndRemoveUntil(
            Routes.loginScreen(), (Route<dynamic> route) => false);
  }
}
