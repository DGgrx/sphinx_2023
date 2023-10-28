import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:http/http.dart' as http;
import 'package:sphinx_2023/models/profile.dart';
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

  Future<void> signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuthentication =
        await googleAccount!.authentication;

  }

  void signOutGoogle(){
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    googleSignIn.signOut();
  }
}
