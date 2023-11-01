import "package:flutter/material.dart";

import "../../../models/event.dart";

class HomeVm extends ChangeNotifier {

  List<Event> events = [];
  void printList(List<Event> val){
    // print(val);
  }

  static const Map<String,String> categoryMap = {
    "Club":"Club",
    "Flagship":"Flagship",
    "Esports":"Flagship",
    "SRC":"Conclave",
    "Workshops":"Workshops",
    "Department":"Departments",
  };

  static Map<String,List<Event>> categoricalList = {};

  void makeCategoryList(List<Event> events){

    categoricalList = {};

      for(var e in events){
        if(categoricalList[e.category.toString()] == null) {
          categoricalList[e.category.toString()] = [];
        }
        categoricalList[e.category.toString()]!.add(e);
    }
  }

}
