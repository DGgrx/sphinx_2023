import 'package:flutter/material.dart';
import '../../theme/color_def.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController usernameCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(42.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "LOGIN   PAGE",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontFamily: "Rog",
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Email ID:",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          SizedBox(
            height: 2,
          ),
          TextField(
            style: TextStyle(color: Colors.white),
            controller: usernameCon,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              focusColor: Colors.white,
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Password :",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          SizedBox(
            height: 2,
          ),
          TextField(
            style: TextStyle(color: Colors.white),
            controller: usernameCon,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: buttonYellow,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: buttonYellow.withOpacity(0.6),
                    spreadRadius: 2,
                    blurRadius: 15,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  'Login',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    letterSpacing: 0.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 17,
          ),
          Text(
            "OR",
            textAlign: TextAlign.center,
            style:
                TextStyle(fontFamily: "Rog", fontSize: 18, color: Colors.white),
          ),
          SizedBox(
            height: 17,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.s,
              children: [
                Image.asset(
                  "assets/google.png",
                  height: 25,
                ),
                Spacer(),
                Text(
                  "Sign in with Google",
                  // textAlign: ce,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                Spacer(),
              ],
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ))),
                padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                backgroundColor: MaterialStateProperty.all(Colors.white)),
          ),
          SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Register a new account",
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationThickness: 1.2,
                color: Colors.white,
                fontSize: 18,
                fontFamily: "Poppins",
              ),
            ),
          )
        ],
      ),
    );
  }
}
