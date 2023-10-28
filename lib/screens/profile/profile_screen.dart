
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sphinx_2023/components/custom_button.dart';
import 'package:sphinx_2023/components/profile_card_tile.dart';
import 'package:sphinx_2023/components/tab_button.dart';
import 'package:sphinx_2023/screens/login/view_model/login_vm.dart';
import 'package:sphinx_2023/screens/profile/view_model/profile_vm.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<LoginVm, ProfileVm>(
        builder: (context, loginVm, profileVm, _) {
      var user = loginVm.user;
      return SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TabButton(
                    callback: () {
                      profileVm.setIndex(0);
                    },
                    title: "Profile".toUpperCase(),
                    inFocus: profileVm.index == 0,
                  ),
                  TabButton(
                    callback: () {
                      profileVm.setIndex(1);
                    },
                    title: "Events".toUpperCase(),
                    inFocus: profileVm.index == 1,
                  ),
                  TabButton(
                    callback: () {
                      profileVm.setIndex(2);
                    },
                    title: "Passes".toUpperCase(),
                    inFocus: profileVm.index == 2,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/qr_back.png",
                  height: MediaQuery.of(context).size.height * 0.42,
                ),
                Positioned(
                  top: 20,
                  child: QrImageView(
                    // backgroundColor: ,
                    size: MediaQuery.of(context).size.height * 0.28,
                    data: user.uniqueID!,
                  ),
                ),
                Positioned(
                  bottom: 55,
                  child: Text(
                    "#${user.uniqueID!}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins-Black",
                        fontSize: 30),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                color: const Color(0xff171717),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        user.name!.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          fontFamily: "Poppins",
                          shadows: [
                            BoxShadow(
                              color: Colors.white,
                              spreadRadius: 1,
                              blurRadius: 30,
                              offset: Offset(0, 3),
                            ),
                          ],
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      CardTile(title: user.email!, label: "Registered Email"),
                      CardTile(
                        title: "+91-${user.phoneNumber!.toString()}",
                        label: "Registered Phone no.",
                      ),
                      CardTile(
                        title: user.collegeName!,
                        label: "College",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // SizedBox(height: 20,),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 0),
              child:
                  CustomButton(callback: () {loginVm.logout();}, title: "Logout".toUpperCase()),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      );
    });
  }
}
