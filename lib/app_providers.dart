import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphinx_2023/providers/calendar_data.dart';
import 'package:sphinx_2023/screens/calender/view_model/calender_vm.dart';
import 'package:sphinx_2023/screens/home/view_models/home_vm.dart';
import 'package:sphinx_2023/screens/login/repo/login_repo.dart';
import 'package:sphinx_2023/screens/login/view_model/login_vm.dart';
import 'package:sphinx_2023/screens/profile/view_model/profile_vm.dart';
import 'package:sphinx_2023/screens/search/event_details/view_model/event_vm.dart';
import 'package:sphinx_2023/screens/splash/repo/splash_repo.dart';
import 'package:sphinx_2023/screens/splash/view_model/splash_vm.dart';

import 'common/data_store.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  // final Language language;
  final DataStore store;
  // final UserProv userProv;
  final CalendarDataProv calendarData;

  const AppProviders({
    // required this.language,
    required this.store,
    Key? key,
    required this.child,
    required this.calendarData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashVM>(create: (_) => SplashVM(store:store,splashRepo:SplashRepo())),
        ChangeNotifierProvider<CalenderVm>(create: (_) => CalenderVm()),
        ChangeNotifierProvider<LoginVm>(create: (_)=> LoginVm(store:store,loginRepo: LoginRepo(),splashRepo: SplashRepo())),
        ChangeNotifierProvider<ProfileVm>(create: (_)=> ProfileVm()),
        ChangeNotifierProvider<CalendarDataProv>(create: (_)=>calendarData),
        ChangeNotifierProvider<HomeVm>(create: (_)=> HomeVm()),
        ChangeNotifierProvider<EventVm>(create: (_)=> EventVm()),
      ],
      child: child,
    );
  }
}
