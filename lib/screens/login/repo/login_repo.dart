import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';

import 'package:http/http.dart' as http;
import 'package:sphinx_2023/models/profile.dart';

import '../../../models/event.dart';
class LoginRepo {

  Future<Profile> login({required String email,required String password})async{
    final response = await http
        .post(
        Uri.parse('https://sphinx-372511.de.r.appspot.com/api/users'),
      body: {"email":email,"password":password}
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map<String, dynamic> jsonDat = jsonDecode(response.body);
      Profile user = Profile.fromJson(jsonDat["profile"]);
      return user;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.body);
    }
  }

  Future<GoogleSignInAccount> signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();

    // googleSignIn.signOut();
    return googleAccount!;
    // await login(email: googleAccount!.email,password: googleAccount!.id);

  }

  void signOutGoogle(){
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    googleSignIn.signOut();
  }

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

}
