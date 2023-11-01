import 'package:flutter/material.dart';

import '../../../models/event.dart';

class ProfileVm extends ChangeNotifier{

  int index = 0;

  void setIndex(int val){
    index = val;
    notifyListeners();
  }

  // Event searchEvent = Event();

  int getSearchEvent(List<Event> allEvents, String eventID){
    int idx = allEvents.indexWhere((element) => element.sId == eventID);
    return idx;
    // searchEvent = allEvents[index];
    // print(searchEvent);
  }

  bool isLoading = false;

  void setLoading(bool val){
    isLoading = val;
    notifyListeners();
  }

  List<Event> userRegisteredEvents = [];

  void getUserEvents(List<Events> events, List<Event> allEvents){
    userRegisteredEvents = [];
    for(var event in events){
      int index = getSearchEvent(allEvents, event.event!);
      userRegisteredEvents.add(allEvents[index]);
    }
  }


}