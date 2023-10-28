import 'package:flutter/material.dart';

import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              child: LoginForm(),
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
