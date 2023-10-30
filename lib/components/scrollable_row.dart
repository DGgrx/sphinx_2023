import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sphinx_2023/screens/search/event_details/event_detail_screen.dart';

import '../common/sphinx_loader.dart';
import '../models/event.dart';
import '../theme/color_def.dart';

class CustomScrollableRow extends StatelessWidget {
  const CustomScrollableRow(
      {required this.title, required this.events, Key? key})
      : super(key: key);

  final String title;
  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Text(
            title.toUpperCase(),
            // textAlign: TextAlign.left,
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
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: events.length,
              itemBuilder: (context, index) {
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
                            // height: 200,
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
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              events[index].name!,
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "Rog",
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
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
