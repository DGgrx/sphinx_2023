import 'dart:convert';

import '../../../models/event.dart';
import '../../../models/profile.dart';
import 'package:http/http.dart' as http;

class QRRepo {
  Future<Profile> getUserByQR({required String qr}) async {
    final response = await http.post(
        Uri.parse('https://sphinx-372511.de.r.appspot.com/api/users/scan'),
        body: {"uid": qr.toString()});

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map<String, dynamic> jsonDat = jsonDecode(response.body);
      Profile user;

      user = Profile.fromJson(jsonDat["users"]);

      return user;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(jsonDecode(response.body)["error"]);
    }
  }

  Future<List<Event>> getAdminEvents({required String token}) async {

    final response = await http.get(
        Uri.parse(
            'https://sphinx-372511.de.r.appspot.com/api/events/eventadmin'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "Bearer $token"
        });

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
      throw Exception(jsonDecode(response.body)["error"]);
    }
  }

  Future<void> freeEventRegistration(
      {required String uid, required String eventID}) async {
    final response = await http.post(
        Uri.parse(
            'https://sphinx-372511.de.r.appspot.com/api/events/freeRegister'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          "userList": [uid],
          "eventID": eventID
        }));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // Map<String, dynamic> jsonDat = jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.body);
      throw Exception(response.body);
    }
  }

  Future<void> toggleEntry({required String uid}) async {
    final response = await http.post(
        Uri.parse(
            'https://sphinx-372511.de.r.appspot.com/api/users/toggleEnter'),
        body: {"uid": uid});

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(jsonDecode(response.body)["error"]);
    }
  }
}
