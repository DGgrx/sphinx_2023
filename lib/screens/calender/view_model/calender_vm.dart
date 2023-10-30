import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../models/calender.dart';

class CalenderVm extends ChangeNotifier {

  List<Appointment> shiftCollection = <Appointment>[];
  List<CalendarResource> categoryCollection = <CalendarResource>[];


  static const Map<String, Color> resourceCollection = {
    'Flagship': Color(0xff5CE1E6),
    'Club': Color(0xff9EDDFF),
    'Workshops': Color(0xffD0EEFF),
    'Conclave': Color(0xff5EFFC0),
    'Department': Color(0xff5EC7FF),
    'Fairs/Exhibitions': Color(0xffAF9FFD),
    'Fun Activities': Color(0xffD5B8FF),
    'Cultural': Color(0xffAF9FFD),
  };

  static const Map<String, String> categories = {
    "flagship": 'Flagship',
    "club": 'Club',
    "workshops": 'Workshops',
    "conclave": 'Conclave',
    "department": 'Department',
    "fairsexhibitions": 'Fairs/Exhibitions',
    "funactivities": 'Fun Activities',
    "cultural": 'Cultural',
  };

  List<EventData> data = [];

  // late EventData day1;
  // late EventData day2;
  // late EventData day3;


  void setData(List<EventData> val) {
    data = val;
    // print(val);
    // day1 = val[0];
    // day2 = val[1];
    // day3 = val[2];
    addResources();
    addAppointments();
  }

  void addResources() {
    int i = 0;
    categoryCollection = [];
    for (var value in categories.values) {
      categoryCollection.add(CalendarResource(
          displayName: value, id: '000$i', color: resourceCollection[value]!));
      i++;
    }
  }

  // DateTime viewDate = DateTime(2023, 11, 3);
  //
  // void setViewDate(var val) {
  //   viewDate = val;
  //   notifyListeners();
  // }

  int index = 0;

  void setIndex(int val) {
    index = val;
    notifyListeners();
  }


  void addAppointments() {

    shiftCollection = <Appointment>[];

    for(int i =0;i<3;i++) {
      data[i].flasgship?.forEach((element) {
        shiftCollection.add(Appointment(
            startTime: DateTime(2023, 11, i+3, int.parse(DateFormat("H").format(
                DateFormat("Hm").parse(element.startTime!))),int.parse(DateFormat("m").format(
                DateFormat("Hm").parse(element.startTime!)))),
            endTime: DateTime(2023, 11, i+3, int.parse(DateFormat("H").format(
                DateFormat("Hm").parse(element.endTime!))),int.parse(DateFormat("m").format(
                DateFormat("Hm").parse(element.endTime!)))),
          subject: element.name!,
          notes: element.organiser,
          color: resourceCollection["Flagship"]!,
          id: '0000',
            resourceIds: ['0000']
        ));
      });
      //
      data[i].club?.forEach((element) {
        shiftCollection.add(Appointment(
            startTime: DateTime(2023, 11, i+3, int.parse(DateFormat("H").format(
                DateFormat("Hm").parse(element.startTime!))),int.parse(DateFormat("m").format(
                DateFormat("Hm").parse(element.startTime!)))),
            endTime: DateTime(2023, 11, i+3, int.parse(DateFormat("H").format(
                DateFormat("Hm").parse(element.endTime!))),int.parse(DateFormat("m").format(
                DateFormat("Hm").parse(element.endTime!)))),
          subject: element.name!,
          notes: element.organiser,
          color: resourceCollection["Club"]!,
          id: '0001',
          resourceIds: ['0001']

        ));
      });

      data[i].workshops?.forEach((element) {
        shiftCollection.add(Appointment(
          startTime: DateTime(2023, 11, i+3, int.parse(DateFormat("H").format(
              DateFormat("Hm").parse(element.startTime!))),int.parse(DateFormat("m").format(
              DateFormat("Hm").parse(element.startTime!)))),
          endTime: DateTime(2023, 11, i+3, int.parse(DateFormat("H").format(
              DateFormat("Hm").parse(element.endTime!))),int.parse(DateFormat("m").format(
              DateFormat("Hm").parse(element.endTime!)))),
          subject: element.name!,
          notes: element.organiser,
          color: resourceCollection["Workshops"]!,
          id: '0002',
          resourceIds: ['0002']

        ));
      });
      data[i].concalve?.forEach((element) {
        shiftCollection.add(Appointment(
            startTime: DateTime(2023, 11, i+3, int.parse(DateFormat("H").format(
                DateFormat("Hm").parse(element.startTime!))),int.parse(DateFormat("m").format(
                DateFormat("Hm").parse(element.startTime!)))),
            endTime: DateTime(2023, 11, i+3, int.parse(DateFormat("H").format(
                DateFormat("Hm").parse(element.endTime!))),int.parse(DateFormat("m").format(
                DateFormat("Hm").parse(element.endTime!)))),
          subject: element.name!,
          notes: element.organiser,
          color: resourceCollection["Conclave"]!,
          id: '0003',
          resourceIds: ['0003']

        ));
      });

      data[i].department?.forEach((element) {
        shiftCollection.add(Appointment(
            startTime: DateTime(2023, 11, i+3, int.parse(DateFormat("H").format(
                DateFormat("Hm").parse(element.startTime!))),int.parse(DateFormat("m").format(
                DateFormat("Hm").parse(element.startTime!)))),
            endTime: DateTime(2023, 11, i+3, int.parse(DateFormat("H").format(
                DateFormat("Hm").parse(element.endTime!))),int.parse(DateFormat("m").format(
                DateFormat("Hm").parse(element.endTime!)))),
          subject: element.name!,
          notes: element.organiser,
          color: resourceCollection["Department"]!,
          id: '0004',
          resourceIds: ['0004']

        ));
      });

      data[i].fairsexhibitions?.forEach((element) {
        shiftCollection.add(Appointment(
            startTime: DateTime(2023, 11, i+3, int.parse(DateFormat("H").format(
                DateFormat("Hm").parse(element.startTime!))),int.parse(DateFormat("m").format(
                DateFormat("Hm").parse(element.startTime!)))),
            endTime: DateTime(2023, 11, i+3, int.parse(DateFormat("H").format(
                DateFormat("Hm").parse(element.endTime!))),int.parse(DateFormat("m").format(
                DateFormat("Hm").parse(element.endTime!)))),
          subject: element.name!,
          notes: element.organiser,
          color: resourceCollection["Fairs/Exhibitions"]!,
          id: '0005',
          resourceIds: ['0005']

        ));
      });

      data[i].funactivities?.forEach((element) {
        shiftCollection.add(Appointment(
            startTime: DateTime(2023, 11, i+3, int.parse(DateFormat("H").format(
                DateFormat("Hm").parse(element.startTime!))),int.parse(DateFormat("m").format(
                DateFormat("Hm").parse(element.startTime!)))),
            endTime: DateTime(2023, 11, i+3, int.parse(DateFormat("H").format(
                DateFormat("Hm").parse(element.endTime!))),int.parse(DateFormat("m").format(
                DateFormat("Hm").parse(element.endTime!)))),
          subject: element.name!,
          notes: element.organiser,
          color: resourceCollection["Fun Activities"]!,
          id: '0006',
          resourceIds: ['0006']

        ));
      });

      data[i].cultural?.forEach((element) {

        shiftCollection.add(Appointment(
            startTime: DateTime(2023, 11, i+3, int.parse(DateFormat("H").format(
                DateFormat("Hm").parse(element.startTime!))),int.parse(DateFormat("m").format(
                DateFormat("Hm").parse(element.startTime!)))),
            endTime: DateTime(2023, 11, i+3, int.parse(DateFormat("H").format(
                DateFormat("Hm").parse(element.endTime!))),int.parse(DateFormat("m").format(
                DateFormat("Hm").parse(element.endTime!)))),
          subject: element.name!,
          notes: element.organiser,
          color: resourceCollection["Cultural"]!,
          id: '0007',
          resourceIds: ['0007']
        ));
      });
    }

    // print(shiftCollection);

  }
}
