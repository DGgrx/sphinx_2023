import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          ChangeNotifierProvider(create: (_)=>SplashVM(SplashRepo()))
      ],
      child: child,
    );
  }
}
