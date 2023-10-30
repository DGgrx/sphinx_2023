import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sphinx_2023/screens/login/view_model/login_vm.dart';
import 'package:sphinx_2023/screens/search/event_details/view_model/event_vm.dart';

import '../../../models/event.dart';
import '../../../theme/color_def.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    // String eventUrl = event.imageUrl!;

    return Consumer2<LoginVm,EventVm>(builder: (context, loginVm,eventVm, _) {
      // var event = loginVm.events[0];
      // var eventUrl = loginVm.events[0].imageUrl;

      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 20, 10),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back,
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
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Text(
                  "Workshops".toUpperCase(),
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
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap:(){
                    if(event.redirectUrl != null ) {
                      eventVm.launchUrl(event.redirectUrl);
                    }
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: CachedNetworkImage(
                      imageUrl: event.imageUrl!,
                      height: 300,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  event.name!.toUpperCase(),
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
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  " ${DateFormat("yMMMEd").format(DateTime.parse(event.from.toString()))}"
                      "\n${DateFormat.jmz().format(DateFormat("hh:mm").parse(event.time.toString()))}"
                      "\n${event.location}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
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
                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 30.0),
                  child: Text(
                    event.description!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      shadows: [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 1,
                          blurRadius: 30,
                          offset: Offset(0, 3),
                        ),
                      ],
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text("For more details, read the rulebook,",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontSize: 12
                ),
                ),
                GestureDetector(
                  onTap: (){
                    eventVm.launchUrl(event.rulebook);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: buttonYellow,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: buttonYellow.withOpacity(0.6),
                              spreadRadius: 2,
                              blurRadius: 15,
                              offset: const Offset(0, 3),
                            )
                          ]),
                      child: Center(
                        child: const Text(
                          "View Rulebook",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            letterSpacing: 0.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40,),
              ],
            ),
          ),
        ),
      );
    });
  }
}
