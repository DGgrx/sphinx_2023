import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphinx_2023/screens/splash/view_model/splash_vm.dart';

// import '/components/gradient.dart';
// import '/screens/onboarding/splash/viewModel/splashVm.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    var splashVm = Provider.of<SplashVM>(context, listen: false);
    splashVm.getEvents();
    // Timer(Duration(seconds: 4), () => splashVm.isLogged(context));
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
              child: Image.asset("assets/sphinx_logo.png",
              height: 120,),
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
    );;
  }
}
