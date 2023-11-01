import 'package:flutter/material.dart';

import '../../components/profile_card_tile.dart';

class UserDetailsCard extends StatelessWidget {
  const UserDetailsCard(
      {super.key,
      required this.name,
      required this.email,
      required this.phoneno,
      required this.college});

  final String name;
  final String email;
  final int phoneno;
  final String college;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 0),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        color: const Color(0xff171717),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                name.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  fontFamily: "Poppins",
                  shadows: [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 1,
                      blurRadius: 30,
                      offset: Offset(0, 3),
                    ),
                  ],
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              CardTile(title: email, label: "Registered Email"),
              CardTile(
                //Madarchod Priyansh BKL User Persona galat banaya MC
                // title: "+91-977827349732",
                title: "+91-${phoneno.toString()}",
                label: "Registered Phone no.",
              ),
              CardTile(
                title: college,
                label: "College",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
