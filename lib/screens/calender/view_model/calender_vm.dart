import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../models/event.dart';

class CalenderVm extends ChangeNotifier {
  final List<String> subjectCollection = <String>[];
  final List<Color> colorCollection = <Color>[];
  List<Appointment> shiftCollection = <Appointment>[];
  final List<CalendarResource> categoryCollection = <CalendarResource>[];
  final List<String> nameCollection = <String>[];
  final List<Color> resourceColorCollection = <Color>[];

  Map<String, Color> resourceCollection = {
    'Flasgship': const Color(0xff5CE1E6),
    'Club': const Color(0xff9EDDFF),
    'Workshops': const Color(0xffD0EEFF),
    'Conclave': const Color(0xff5EFFC0),
    'Department': const Color(0xff5EC7FF),
    'Fairs/Exhibitions': const Color(0xffAF9FFD),
    'Fun Activities': const Color(0xffD5B8FF),
    'Cultural': const Color(0xffAF9FFD),
  };

  void addResourceDetails(List<Event> events) {
    nameCollection.add('Flasgship');
    nameCollection.add('Club');
    nameCollection.add('Workshops');
    nameCollection.add('Conclave');
    nameCollection.add('Department');
    nameCollection.add('Fairs/Exhibitions');
    nameCollection.add('Fun Activities');
    nameCollection.add('Cultural');

    resourceColorCollection.add(const Color(0xff5CE1E6));
    resourceColorCollection.add(const Color(0xff9EDDFF));
    resourceColorCollection.add(const Color(0xffD0EEFF));
    resourceColorCollection.add(const Color(0xff5EFFC0));
    resourceColorCollection.add(const Color(0xff5EC7FF));
    resourceColorCollection.add(const Color(0xffAF9FFD));
    resourceColorCollection.add(const Color(0xffD5B8FF));
    resourceColorCollection.add(const Color(0xffAF9FFD));
    resourceColorCollection.add(const Color(0xffF8B6ED));
  }

  void addResources() {
    for (int i = 0; i < nameCollection.length; i++) {
      categoryCollection.add(
        CalendarResource(
          displayName: nameCollection[i],
          id: '000$i',
          color: resourceColorCollection[i],
        ),
      );
    }
  }

  void addAppointmentDetails() {
    subjectCollection.add('General Meeting');
    subjectCollection.add('Plan Execution');
    subjectCollection.add('Project Plan');
    subjectCollection.add('Consulting');
    subjectCollection.add('Support');
    subjectCollection.add('Development Meeting');
    subjectCollection.add('Scrum');
    subjectCollection.add('Project Completion');
    subjectCollection.add('Release updates');

    colorCollection.add(const Color(0xff5CE1E6));
    colorCollection.add(const Color(0xff9EDDFF));
    colorCollection.add(const Color(0xffD0EEFF));
    colorCollection.add(const Color(0xff5EFFC0));
    colorCollection.add(const Color(0xff5EC7FF));
    colorCollection.add(const Color(0xffAF9FFD));
    colorCollection.add(const Color(0xffD5B8FF));
    colorCollection.add(const Color(0xffAF9FFD));
  }
  Map<String, List<Event>> catogoricalList = {};
  void addAppointments(List<Event> events) {

    // print(events);
    shiftCollection = <Appointment>[];

    print(events[0].category);
    events.forEach(
        (e){
          if(catogoricalList[e.category]==null)
            catogoricalList[e.category!] = <Event>[];
          catogoricalList[e.category]?.add(e);
        }
    );
    print(catogoricalList);






    // events.map((e) {
    //   print(e.category!);
    //   if(catogoricalList[e.category!.toString()]?.length == 0)
    //   catogoricalList[e.category!.toString()] = [];
    //   catogoricalList[e.category!.toString()]?.add(e);
    // }
    // );
    // print(catogoricalList);
    //
    //   shiftCollection.add(Appointment(
    //       startTime: shiftStartTime,
    //       endTime: shiftStartTime.add(const Duration(hours: 3)),
    //       subject: subjectCollection[random.nextInt(8)],
    //       color: colorCollection[random.nextInt(8)],
    //       startTimeZone: '',
    //       endTimeZone: '',
    //       resourceIds: _employeeIds));
    // }
  }
}