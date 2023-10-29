import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphinx_2023/providers/calendar_data.dart';
import 'package:sphinx_2023/screens/calender/view_model/calender_vm.dart';
import 'package:sphinx_2023/screens/login/view_model/login_vm.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';

import '../../components/tab_button.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  CalenderScreenState createState() => CalenderScreenState();
}

class CalenderScreenState extends State<CalenderScreen> {
  _DataSource? _events;

  final CalendarController _calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    // CalenderVm calenderVm = Provider.of<CalenderVm>(context, listen: false);
    // calenderVm.addResources();
    // LoginVm loginVM = Provider.of<LoginVm>(context, listen: false);
    // calenderVm.addResourceDetails(loginVM.events);
    // calenderVm.addResources();
    // calenderVm.addAppointmentDetails();
    // calenderVm.addAppointments(loginVM.events);

    return Consumer2<CalendarDataProv, CalenderVm>(
        builder: (context, dataProv, calendarVm, _) {
      calendarVm.setData(dataProv.calendarData);

      _events = _DataSource(
          calendarVm.shiftCollection, calendarVm.categoryCollection);

      print(calendarVm.categoryCollection.length);
      print(calendarVm.shiftCollection.length);

      return SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TabButton(
                    callback: () {
                      calendarVm.setIndex(0);
                      _calendarController.displayDate = DateTime(2023, 11, 3);
                    },
                    title: "3 NOV",
                    inFocus: calendarVm.index == 0,
                    textPad: 25,
                  ),
                  TabButton(
                    callback: () {
                      calendarVm.setIndex(1);
                      _calendarController.displayDate = DateTime(2023, 11, 4);
                    },
                    title: "4 NOV",
                    inFocus: calendarVm.index == 1,
                    textPad: 25,
                  ),
                  TabButton(
                    callback: () {
                      calendarVm.setIndex(2);
                      _calendarController.displayDate = DateTime(2023, 11, 5);
                    },
                    title: "5 NOV",
                    inFocus: calendarVm.index == 2,
                    textPad: 25,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SfCalendar(
                // onViewChanged: ,
                // viewHeaderHeight: 0,
                // initialDisplayDate: DateTime(2023,11,3),
                // onViewChanged: (ViewChangedDetails viewChangedDetails){
                //   calendarVm.setViewDate(_calendarController.displayDate);
                // },
                // headerDateFormat: "MEd",
                viewHeaderStyle: const ViewHeaderStyle(
                    dateTextStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins-Black",
                        fontSize: 0),
                    dayTextStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins-Black",
                        fontSize: 15)),
                minDate: DateTime(2023, 11, 3),
                maxDate: DateTime(2023, 11, 5),
                headerHeight: 0,
                headerStyle: const CalendarHeaderStyle(backgroundColor: Colors.white),
                todayTextStyle: const TextStyle(fontFamily: "Poppins-Black"),
                todayHighlightColor: Colors.white,
                // backgroundColor: Colors.white,
                selectionDecoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                cellBorderColor: Colors.white.withOpacity(0.7),
                view: CalendarView.timelineDay,
                controller: _calendarController,
                showDatePickerButton: true,
                dataSource: _events,
                appointmentBuilder: appointmentBuilder,
                resourceViewHeaderBuilder: resourceBuilder,
                timeSlotViewSettings: const TimeSlotViewSettings(
                  startHour: 8,
                  endHour: 23,
                  // timeIntervalHeight: -1,
                  timeTextStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: "Rog",
                    fontSize: 13,
                  ),
                  timeIntervalWidth: 80,
                  // timeIntervalHeight: 250
                ),
                resourceViewSettings: const ResourceViewSettings(
                    size: 65, visibleResourceCount: 2),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget appointmentBuilder(BuildContext context,
      CalendarAppointmentDetails calendarAppointmentDetails) {
    final Appointment appointment =
        calendarAppointmentDetails.appointments.first;
    return Container(
      decoration: BoxDecoration(
        color: appointment.color,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                appointment.subject.toUpperCase(),
                style: const TextStyle(
                  fontSize: 10,
                    color: Colors.black,
                    fontFamily: "Rog",
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Flexible(
              child: Text(
                '${appointment.notes}${DateFormat(' (hh:mm a').format(appointment.startTime)}-${DateFormat('hh:mm a)').format(appointment.endTime)}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 8),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget resourceBuilder(
      BuildContext context, ResourceViewHeaderDetails details) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: details.resource.color,
        ),
        alignment: Alignment.center,
        child: RotatedBox(
            quarterTurns: 1,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                details.resource.displayName,
                style: const TextStyle(
                  fontFamily: "Rog",
                  fontSize: 15,
                ),
              ),
            )),
      ),
    );
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source, List<CalendarResource> resourceColl) {
    appointments = source;
    resources = resourceColl;
  }
}
