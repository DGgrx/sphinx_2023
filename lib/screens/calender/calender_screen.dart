import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphinx_2023/screens/calender/view_model/calender_vm.dart';
import 'package:sphinx_2023/screens/login/view_model/login_vm.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';

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
    CalenderVm calenderVm = Provider.of<CalenderVm>(context, listen: false);
    LoginVm loginVM = Provider.of<LoginVm>(context, listen: false);
    calenderVm.addResourceDetails(loginVM.events);
    calenderVm.addResources();
    calenderVm.addAppointmentDetails();
    calenderVm.addAppointments(loginVM.events);
    // _events =
    //     _DataSource(calenderVm.shiftCollection, calenderVm.employeeCollection);
    return SafeArea(
      child: SfCalendar(
        cellBorderColor: Colors.white,
        view: CalendarView.timelineDay,
        controller: _calendarController,
        showDatePickerButton: true,
        dataSource: _events,
        appointmentBuilder: appointmentBuilder,
        resourceViewHeaderBuilder: resourceBuilder,
        timeSlotViewSettings: const TimeSlotViewSettings(
          // startHour: 9,
          // endHour: 22,
          // timeIntervalHeight: -1,
          timeTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: "Rog",
            fontSize: 15,
          ),
          timeIntervalWidth: 80,
        ),
        resourceViewSettings:
            const ResourceViewSettings(size: 60, visibleResourceCount: 3),
      ),
    );
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
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(height: 3,),
            Flexible(
              child: Text(
                '${appointment.subject}${DateFormat(' (hh:mm a').format(appointment.startTime)}-${DateFormat('hh:mm a)').format(appointment.endTime)}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10),
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
              padding: const EdgeInsets.all(15.0),
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
