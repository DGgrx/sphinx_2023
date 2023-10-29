import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sphinx_2023/models/calender.dart';

class CalendarDataProv extends ChangeNotifier{

  late List<EventData> calendarData = [];

  init() async {
    var json = await loadDataJSON();

    for(var j in json){
      calendarData.add(EventData.fromJson(j));
    }
    print(calendarData);

    notifyListeners();
  }

  Future<List<Map<String,dynamic>>> loadDataJSON() async {
    final String day1 = await rootBundle.loadString("assets/events/day1.json");
    final String day2 = await rootBundle.loadString("assets/events/day2.json");
    final String day3 = await rootBundle.loadString("assets/events/day3.json");
    final json1 = await jsonDecode(day1);
    final json2 = await jsonDecode(day2);
    final json3 = await jsonDecode(day3);
    return [json1,json2,json3];
  }
}