import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphinx_2023/screens/calender/view_model/calender_vm.dart';
import 'package:sphinx_2023/screens/login/repo/login_repo.dart';
import 'package:sphinx_2023/screens/login/view_model/login_vm.dart';
import 'package:sphinx_2023/screens/profile/view_model/profile_vm.dart';
import 'package:sphinx_2023/screens/splash/repo/splash_repo.dart';
import 'package:sphinx_2023/screens/splash/view_model/splash_vm.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  // final Language language;
  // final DataStore store;
  // final UserProv userProv;

  const AppProviders({
    // required this.language,
    // required this.store,
    Key? key,
    required this.child,
    // required this.userProv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashVM(SplashRepo())),
        ChangeNotifierProvider(create: (_) => CalenderVm()),
        ChangeNotifierProvider(create: (_)=> LoginVm(loginRepo: LoginRepo())),
        ChangeNotifierProvider(create: (_)=> ProfileVm()),
      ],
      child: child,
    );
  }
}
