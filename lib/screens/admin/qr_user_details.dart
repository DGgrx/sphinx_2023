import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';
import 'package:sphinx_2023/components/custom_button.dart';
import 'package:sphinx_2023/screens/admin/view_model/qr_scan_vm.dart';

import '../../components/tab_button.dart';
import '../../models/event.dart';
import '../../models/pass.dart';
import '../../models/profile.dart';
import '../../theme/color_def.dart';

class QRScannedUserScreen extends StatelessWidget {
  const QRScannedUserScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Consumer<QRScanVM>(builder: (context, qrVm, _) {
      Profile user = qrVm.user;
      List<Event?> events = qrVm.events;
      List<Passes?> passes = qrVm.passes;

      Event selectedEvent = qrVm.searchEvent;

      int found = -1;
      Passes? todayPass;

      if (passes.isNotEmpty) {
        found = qrVm.getTodayPass();
        if (found != -1) todayPass = passes[found];
      }

      List<Widget> myWidgets = [
        found != -1
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  color: Colors.lightGreenAccent,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: CachedNetworkImage(
                          imageUrl: todayPass?.imageUrl.toString() ?? "",
                        ),
                      ),
                      if (todayPass?.name != "Day 1" ||
                          todayPass?.name != "Day 2" ||
                          todayPass?.name != "Day 3")
                        Text(
                          "Give   Band".toUpperCase(),
                          style: TextStyle(
                              fontFamily: "Poppins-Black",
                              color: Color(0xFF5A7900),
                              fontSize: 25),
                        )
                    ],
                  ),
                ),
              )
            : Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  // Spacer(),
                  Image.asset(
                    "assets/sphinx_logo.png",
                    color: Colors.white.withOpacity(0.4),
                    height: 100,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 43),
                    child: Text(
                      "No Passes for Today",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontSize: 15),
                    ),
                  ),
                  SizedBox(height: 150,),
                  // Spacer()
                ],
              ),
        if (passes.isNotEmpty)
          for (var p in passes)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: CachedNetworkImage(imageUrl: p!.imageUrl.toString()),
              ),
            )
        else
          Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              // Spacer(),
              Image.asset(
                "assets/sphinx_logo.png",
                color: Colors.white.withOpacity(0.4),
                height: 100,
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 43),
                child: Text(
                  "No Passes for Today.",
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Poppins", fontSize: 15),
                ),
              ),
              SizedBox(height: 150,),
              // Spacer()
            ],
          ),
      ];

      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 20, 10),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          // leadingWidth: 60,
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.11,
          backgroundColor: Colors.black,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 0),
            child: Image.asset(
              "assets/sphinx_banner.png",
              width: MediaQuery.of(context).size.width * 0.65,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Column(
                  children: [
                    Text(
                      selectedEvent.name.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: buttonYellow,
                        fontFamily: "Rog",
                        shadows: [
                          BoxShadow(
                            color: buttonYellow,
                            spreadRadius: 1,
                            blurRadius: 30,
                            offset: Offset(0, 3),
                          ),
                        ],
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      " ${DateFormat("yMMMEd").format(DateTime.parse(selectedEvent.from.toString()))}"
                          "\n${DateFormat.jmz().format(DateFormat("hh:mm").parse(selectedEvent.time.toString()))}"
                          "\n${selectedEvent.location}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: buttonYellow,
                        fontFamily: "Rog",
                        shadows: [
                          BoxShadow(
                            color: buttonYellow,
                            spreadRadius: 1,
                            blurRadius: 30,
                            offset: Offset(0, 3),
                          ),
                        ],
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                  child: Card(
                    color: Color(0xff171717),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 80, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name: ${user.name!}",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text("College: ${user.collegeName!}",
                              style: TextStyle(color: Colors.white)),
                          Text("UniqueID: ${user.uniqueID!}",
                              style: TextStyle(color: Colors.white)),
                          Text("PhoneNo.: ${user.phoneNumber.toString()}",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),

                qrVm.isUserRegistered?Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.greenAccent,
                    ),
                    child: Center(
                      child: Text(
                        "Allowed for the event",
                        style: TextStyle(
                          color: Color(0xFF5A7900),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ):
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 8),
                  child: CustomButton(callback: (){

                    // print(user.sId);
                    // print(selectedEvent.sId);
                    // print(user.email);
                    // qrVm.setRegisteredStatus(true);

                    qrVm.registerForFreeEvent(user.sId!, selectedEvent.sId!);

                  }, title: "Register for the Event"),
                ),
                SizedBox(height: 20,),

                passes.isNotEmpty || events.isNotEmpty
                    ? Container(
                        // width: 200,
                        child: LiteRollingSwitch(
                          width: 200,
                          //initial value
                          value: qrVm.toggle,
                          textOn: 'Mark Exit'.toUpperCase(),
                          textOff: 'Mark Entry'.toUpperCase(),
                          colorOn: Colors.greenAccent[700]!,
                          colorOff: Colors.redAccent[700]!,
                          iconOn: Icons.chevron_left,
                          iconOff: Icons.chevron_right_rounded,
                          textSize: 18.0,
                          onChanged: (bool state) {
                            //Use it to manage the different states
                            qrVm.toggleAttendance(state);
                            qrVm.toggelEntryInMNIT(user.uniqueID!);
                            // print('Current State of SWITCH IS: $state');
                          },
                          onTap: () {},
                          onDoubleTap: () {},
                          onSwipe: () {},
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "NO ENTRY IN SPHINX",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TabButton(
                      callback: () {
                        qrVm.setIndex(0);
                      },
                      title: "Today".toUpperCase(),
                      inFocus: qrVm.index == 0,
                      textPad: 40,
                    ),
                    TabButton(
                      callback: () {
                        qrVm.setIndex(1);
                      },
                      title: "All Passes".toUpperCase(),
                      inFocus: qrVm.index == 1,
                      textPad: 19,
                    ),
                  ],
                ),
                passes.isNotEmpty || found == -1
                    ? myWidgets[qrVm.index]
                    : Column(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                          ),
                          // Spacer(),
                          Image.asset(
                            "assets/sphinx_logo.png",
                            color: Colors.white.withOpacity(0.4),
                            height: 100,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 43),
                            child: Text(
                              "Not Registered to any event yet.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                  fontSize: 15),
                            ),
                          ),
                          // Spacer()
                        ],
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
