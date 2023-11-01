import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../common/data_store.dart';
import '../../../common/navigator.dart';
import '../../../common/routing.dart';
import '../../../models/event.dart';
import '../../../models/pass.dart';
import '../../../models/profile.dart';
import '../repo/qr_scan_repo.dart';

class QRScanVM extends ChangeNotifier {
  QRRepo qrRepo;
  final DataStore store;

  QRScanVM({required this.qrRepo, required this.store});

  String scannedQr = "";

  Profile user = Profile();
  List<Passes?> passes = [];
  List<Event?> events = [];

  List<String> menuItems = [];

  void setMenuItems() {
    menuItems = [];
    for (var event in events) {
      menuItems.add(event!.name.toString());
    }
    for(var menu in menuItems) print(menu);
    // notifyListeners();
  }

  void getUniqID(String val) {
    scannedQr = val;
    notifyListeners();
  }

  bool torch = false;

  void toggleTorch() {
    torch = !torch;
    notifyListeners();
  }

  bool isLoading = false;

  void setLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  late bool isUserRegistered;

  void setRegisteredStatus(bool val){
    isUserRegistered = val;
    notifyListeners();
  }

  Future<void> scanQr() async {
    setLoading(true);

    try {
      user = await qrRepo.getUserByQR(qr: scannedQr);
      passes = user.passes!;

      print(user.events);

      print(searchEvent.sId);
      int idx = user.events!.indexWhere((element) {
        print(element);

        return element.event == searchEvent.sId;});

      if(idx ==-1)isUserRegistered = false;
      else isUserRegistered = true;
      //
      print(dropDownval);

      // setRegisteredStatus(user.enteredMNIT!);
      toggleAttendance(user.enteredMNIT!);
      if(searchEvent.name == null) throw Exception("Please Select a Valid Event from the dropdown");

      await Navigator.of(NavigationService.navigatorKey.currentContext!,
              rootNavigator: true)
          .push(Routes.qrScannedUser());
    } catch (e) {
      String errorText = e.toString();
      Fluttertoast.showToast(
          msg: errorText,
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.red);
    }
    setLoading(false);
  }

  Map<String, DateTime> passesMap = {
    "First Day": DateTime(2023, 11, 3),
    "Second Day": DateTime(2023, 11, 4),
    "Third Day": DateTime(2023, 11, 5),
    "Golden Pass": DateTime.now(),
    "Platinum Pass": DateTime.now(),
    "School Pass": DateTime.now(),
    "Day 1": DateTime(2023, 11, 3),
    "Day 2": DateTime(2023, 11, 4),
    "Day 3": DateTime(2023, 11, 5),
  };

  int getTodayPass() {
    return passes.indexWhere((element) {
      var passDate = passesMap[element!.name];
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      // final yesterday = DateTime(now.year, now.month, now.day - 1);
      // final tomorrow = DateTime(now.year, now.month, now.day + 1);
      return passDate == today;
    });
  }

  int getGoldenPass() {
    return passes.indexWhere((element) =>
        element!.name == "Golden Pass" || element.name == "Platinum Pass");
  }

  bool isAllowedtoEnter() {
    return passes.isNotEmpty ||
        getGoldenPass() != -1 ||
        getTodayPass() != -1 ||
        events.isNotEmpty;
  }

  int index = 0;

  void setIndex(int val) {
    index = val;
    notifyListeners();
  }

  bool toggle = false;

  void toggleAttendance(bool val) {
    toggle = val;
    notifyListeners();
  }

  Future<void> getAdminEvents() async {
    setLoading(true);
    try{
      var _token = store.getString('token');
      events = await qrRepo.getAdminEvents(token: _token.toString());
      setMenuItems();
    }catch(e){
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.red);
    }
    setLoading(false);
  }

  String dropDownval = "";

  Event searchEvent = Event();

  void setMenuValue(val){
    dropDownval = val;
    print(dropDownval);
  }

  void getSearchEvent(List<Event> allEvents){
     int index = allEvents.indexWhere((element) => element.name == dropDownval);
    searchEvent = allEvents[index];
    print(searchEvent);

  }

  Future<void> registerForFreeEvent(String uid, String eventID) async{
    setLoading(true);
    try{
      await qrRepo.freeEventRegistration(uid: uid,eventID: eventID);
      // var _token = store.getString('token');
      Fluttertoast.showToast(
          msg: "Participant Attendance recorded",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.green);
      setMenuItems();
    }catch(e){
      print(e);
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.red);
    }
    setLoading(false);
  }

  Future<void> toggelEntryInMNIT(String uniqueID) async{
    setLoading(true);
    try{
      await qrRepo.toggleEntry(uid: uniqueID.toString());
      // var _token = store.getString('token');
      Fluttertoast.showToast(
          msg: "Participant Attendance recorded",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.green);
      setMenuItems();
    }catch(e){
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.red);
    }
    setLoading(false);
  }



}
