import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../common/sphinx_loader.dart';
import '../../models/event.dart';
import '../search/event_details/event_detail_screen.dart';

class EventsWidget extends StatelessWidget {
  const EventsWidget({required this.events, super.key});

  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    return events.isNotEmpty
        ? GridView.count(
            shrinkWrap: true,
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(events.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          EventDetail(event: events[index])));
                },
                child: Container(
                  width: 200,
                  height: 200,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height:170,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CachedNetworkImage(
                              // fit: BoxFit.contain,
                              // width: 200,
                              // height: 200,
                              imageUrl: events[index].imageUrl!,
                              placeholder: (context, url) => Container(
                                height: 200,
                                // constraints: BoxConstraints.loose(Size.fromHeight(200)),
                                decoration:
                                const BoxDecoration(color: Colors.black),
                                child: const LoadingScreen(),
                              ),
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              );
            }),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 43),
                child: Text(
                  "Not Registered to any event yet.",
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Poppins", fontSize: 15),
                ),
              ),
              // Spacer()
            ],
          );
  }
}
