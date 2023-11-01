import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/pass.dart';

class PassesWidget extends StatelessWidget {
  const PassesWidget({required this.passes, super.key});

  final List<Passes>? passes;

  @override
  Widget build(BuildContext context) {
    return passes!.isNotEmpty
        ? Column(
            children: [
              for (var p in passes!)
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: CachedNetworkImage(imageUrl: p.imageUrl.toString()),
                  ),
                )
            ],
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
