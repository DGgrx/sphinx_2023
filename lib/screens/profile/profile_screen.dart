
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphinx_2023/common/sphinx_loader.dart';
import 'package:sphinx_2023/components/tab_button.dart';
import 'package:sphinx_2023/screens/admin/qr_scan_screen.dart';
import 'package:sphinx_2023/screens/admin/view_model/qr_scan_vm.dart';
import 'package:sphinx_2023/screens/login/view_model/login_vm.dart';
import 'package:sphinx_2023/screens/profile/events.dart';
import 'package:sphinx_2023/screens/profile/passes.dart';
import 'package:sphinx_2023/screens/profile/profile.dart';
import 'package:sphinx_2023/screens/profile/view_model/profile_vm.dart';

import '../../models/profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer3<LoginVm, ProfileVm, QRScanVM>(
        builder: (context, loginVm, profileVm, qrVm, _) {
      Profile _user = loginVm.user;
      profileVm.getUserEvents(_user.events!, loginVm.events);

      print(profileVm.userRegisteredEvents);

      List<Widget> widgetToShow = [
        ProfileWidget(
            user: _user,
            callback: () {
              loginVm.logout();
            },
          adminCallback: () async{
            await qrVm.getAdminEvents();
            await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => QRScannerPage()));
          },
        ),
        EventsWidget(events: profileVm.userRegisteredEvents,),
        PassesWidget(passes: _user.passes,),
      ];

      return qrVm.isLoading || profileVm.isLoading
          ? LoadingScreen()
          : SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 0),
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
                  widgetToShow[profileVm.index]
                ],
              ),
            );
    });
  }
}
