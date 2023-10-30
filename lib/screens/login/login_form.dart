import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphinx_2023/common/sphinx_loader.dart';
import 'package:sphinx_2023/screens/login/register.dart';
import 'package:sphinx_2023/screens/login/view_model/login_vm.dart';
import 'package:sphinx_2023/screens/search/event_details/view_model/event_vm.dart';
import 'package:sphinx_2023/theme/color_def.dart';
import '../../components/custom_button.dart';

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
    return Consumer2<LoginVm, EventVm>(builder: (context, loginVm, eventVm, _) {
      return loginVm.isLoading
          ? const LoadingScreen()
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
                    obscureText: loginVm.togglePass,
                    style: const TextStyle(color: Colors.white),
                    controller: passwordCon,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      focusColor: Colors.white,
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      suffixIcon: IconButton(
                        icon: ImageIcon(
                          const AssetImage('assets/icons/eye.png'),
                          color:
                              loginVm.togglePass ? Colors.grey : Colors.white,
                        ),
                        onPressed: loginVm.togglePassW,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        // textStyle: MaterialStateProperty.all(TextStyle(f))
                      ),
                      onPressed: () {
                        eventVm.launchUrl("https://sphinx.org.in/login");
                      },
                      child: Text(
                        "Forgot password ?",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: buttonYellow),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomButton(
                    title: "Login",
                    callback: () {
                      // print(usernameCon.text);
                      // print(passwordCon.text);
                      // homeVm.getEvents();
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
