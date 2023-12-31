import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../models/event.dart';
import '../../../models/profile.dart';

class SplashRepo {
  Future<List<Event>> fetchEvents() async {
    final response = await http
        .get(Uri.parse('https://sphinx-372511.de.r.appspot.com/api/events'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map<String, dynamic> jsonDat = jsonDecode(response.body);
      List<Event> eventList = [];
      jsonDat["events"].forEach((v) => eventList.add(Event.fromJson(v)));
      return eventList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Events');
    }
  }

  Future<Profile> getUserDetails(String id) async {
    final response = await http
        .get(Uri.parse('https://sphinx-372511.de.r.appspot.com/api/users/$id'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map<String, dynamic> jsonDat = jsonDecode(response.body);
      Profile user = Profile.fromJson(jsonDat["user"]);

      return user;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load User');
    }
  }
}
