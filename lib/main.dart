import 'package:flutter/material.dart';
import 'package:sphinx_2023/providers/calendar_data.dart';
import 'package:sphinx_2023/screens/splash/splash_screen.dart';

import 'app_providers.dart';
import 'common/navigator.dart';

final CalendarDataProv _calendarDataProv = CalendarDataProv();


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _calendarDataProv.init();

  // await dotenv.load(fileName: ".env");
  // await Firebase.initializeApp();
  // await FlutterNotificationChannel.registerNotificationChannel(
  //     description: 'For Showing Message Notification',
  //     id: 'chats',
  //     importance: NotificationImportance.IMPORTANCE_HIGH,
  //     name: 'Chats');
  // // log('\nNotification Channel Result: $result');
  // // FirebaseMessaging messaging = FirebaseMessaging.instance;
  // // NotificationSettings settings = await messaging.requestPermission(
  // //   alert: true,
  // //   announcement: false,
  // //   badge: true,
  // //   carPlay: false,
  // //   criticalAlert: false,
  // //   provisional: false,
  // //   sound: true,
  // // );
  // // ignore: unused_local_variable
  // DataStore store = DefaultStore(await SharedPreferences.getInstance());
  // UserProv userProv = UserProv(dataStore: store);

  // print('User granted permission: ${settings.authorizationStatus}');
  runApp(const MyApp(
    // store: store,
    // userProv: userProv,
  ));
}

class MyApp extends StatelessWidget {
  // final SharedPreferences prefs;
  // final DataStore store;
  // final UserProv userProv;
  // final db = Localstore.instance;

  const MyApp({
    super.key,
    // required this.store,
    // required this.userProv,
  });

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      // language: _language,
      // userProv: userProv,
      // store: store,
      calendarData: _calendarDataProv,
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        title: 'Sphinx',
        theme: ThemeData(
          fontFamily: 'Poppins',
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
//
