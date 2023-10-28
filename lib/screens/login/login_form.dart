import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphinx_2023/common/sphinx_loader.dart';
import 'package:sphinx_2023/screens/login/register.dart';
import 'package:sphinx_2023/screens/login/view_model/login_vm.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../components/custom_button.dart';
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
    return Consumer<LoginVm>(builder: (context, loginVm, _) {
      return loginVm.isLoading
          ? LoadingScreen()
          : Padding(
              padding: const EdgeInsets.all(42.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "LOGIN   PAGE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Rog",
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Email ID:",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: usernameCon,
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      focusColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Password :",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: passwordCon,
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      focusColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    title: "Login",
                    callback: () {
                      print(usernameCon.text);
                      print(passwordCon.text);
                      loginVm.login(
                          email: usernameCon.text, password: passwordCon.text);
                    },
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const Text(
                    "OR",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Rog", fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      loginVm.signInGoogle();
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(15)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.s,
                      children: [
                        Image.asset(
                          "assets/google.png",
                          height: 25,
                        ),
                        const Spacer(),
                        const Text(
                          "Sign in with Google",
                          // textAlign: ce,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const WebViewApp()));
                    },
                    child: const Text(
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
    });
  }
}
