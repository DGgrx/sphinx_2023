import 'package:flutter/material.dart';
import 'package:sphinx_2023/screens/profile/qr_widget.dart';
import 'package:sphinx_2023/screens/profile/user_details.dart';

import '../../components/custom_button.dart';
import '../../models/profile.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({required this.user, required this.callback, super.key, required this.adminCallback});

  final Profile user;
  final VoidCallback callback;
  final VoidCallback adminCallback;

  @override
  Widget build(BuildContext context) {

    List<Widget> myWidgets = [
      QRWidgetCard(
        data: user.uniqueID!,
      ),
      user.type == "eventAdmin" || user.type == "superAdmin"
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12),
              child: GestureDetector(
                onTap: adminCallback,
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.white, width: 2)),
                  child: Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      child: Text(
                        "Scan QR",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Rog",
                          // fontWeight: FontWeight.w600,
                          fontSize: 22,
                          // letterSpacing: 0.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : SizedBox(
              height: 20,
            ),
      UserDetailsCard(
        name: user.name!,
        email: user.email!,
        phoneno: user.phoneNumber!,
        college: user.collegeName!,
      ),
    ];

    return Column(
      children: [
        if (user.type == "eventAdmin" || user.type == "superAdmin") ...myWidgets.reversed else ...myWidgets,
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 0),
          child:
              CustomButton(callback: callback, title: "Logout".toUpperCase()),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
