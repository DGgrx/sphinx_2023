import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphinx_2023/screens/login/view_model/login_vm.dart';

import '../../../theme/color_def.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginVm>(builder: (context, loginVm, _) {
      var event = loginVm.events[0];
      var eventUrl = loginVm.events[0].imageUrl;

      return SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height:30),
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
            const SizedBox(height: 20,),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: CachedNetworkImage(imageUrl: eventUrl!,
              height: 300,),
            ),
            const SizedBox(height: 25,),

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
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 30.0),
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
            TextButton(onPressed: (){},
                child: const Text(
                  "View Rulebook",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: buttonYellow,
                    fontFamily: "Poppins",
                    shadows: [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1,
                        blurRadius: 30,
                        offset: Offset(0, 3),
                      ),
                    ],
                    fontSize: 22,
                  ),
                ),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 32),
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
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      '\$ 150',
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
          ],
        ),
      );
    });
  }
}
