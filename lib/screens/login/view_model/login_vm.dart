
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../common/navigator.dart';
import '../../../common/routing.dart';
import '../../../models/profile.dart';
import '../repo/login_repo.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginVm extends ChangeNotifier{
  final LoginRepo loginRepo;


  late Profile user;


  LoginVm({required this.loginRepo});

  bool isLoading = false;

  void setLoading(bool val){
    isLoading = val;
    notifyListeners();
  }

  bool isLoggedIn = false;

  void setLoggedIn(bool val){
    isLoggedIn = val;
  }

  void signInGoogle(){
    loginRepo.signInWithGoogle();
    try{
      // loginRepo.login(email: );
    }
    catch(e){
      Fluttertoast.showToast(
        msg:e.toString(),
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.red
      );

    }
  }

  Future<void> login({required String email,required String password})async {
    setLoading(true);

    try{
    user = await loginRepo.login(email: email,password: password);
    print(user.email);
    print(user.name);
    print(user.uniqueID);
    print(user.password);
    setLoggedIn(true);

    await Navigator.of(NavigationService.navigatorKey.currentContext!,
        rootNavigator: true)
        .pushAndRemoveUntil(
        Routes.landingScreen(), (Route<dynamic> route) => false);
    }
    catch(e){
      setLoggedIn(false);
      String errorText = e.toString();
      Fluttertoast.showToast(
          msg:errorText,
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.red
      );
    }
    setLoading(false);
  }


}