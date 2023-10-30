import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphinx_2023/screens/login/view_model/login_vm.dart';
import 'package:sphinx_2023/screens/splash/view_model/splash_vm.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SplashVM splashVm = Provider.of<SplashVM>(context, listen: false);
    LoginVm loginVm = Provider.of<LoginVm>(context, listen: false);
    Timer(
        const Duration(seconds: 3),
        () => splashVm.isLogged(context, loginVm));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.center,
              child: RotatedBox(
                quarterTurns: 1,
                child: Image.asset(
                  "assets/splash.gif",
                  height: 120,
                ),
              ),
            ),
            Positioned(
                top: -100,
                left: -200,
                child: Image.asset(
                  "assets/badge.png",
                  height: 380,
                )),
            Positioned(
                right: -200,
                bottom: -150,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: Image.asset(
                    "assets/badge.png",
                    height: 380,
                  ),
                )),
          ],
        ),
      ),
    );

  }
}
