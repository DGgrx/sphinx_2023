import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme/color_def.dart';
import '../splash/view_model/splash_vm.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var splashVm = Provider.of<SplashVM>(context, listen: false);
    splashVm.getEvents();
    print(splashVm.events.length);

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "Upcoming   Events".toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
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
          SizedBox(
            height: 30,
          ),
          CarouselSlider(
            options: CarouselOptions(
                height: 265,
                enlargeFactor: 0.25,
                viewportFraction: 0.50,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5)),
            items: splashVm.events
                .map((event) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              // height: 100,
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: CachedNetworkImage(
                  imageUrl: event.imageUrl!,
                  placeholder: (context, url) =>
                      CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error),
                ),
              ),
            ))
                .toList(),
          ),
          SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: buttonYellow),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "Explore All Events",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "Rog"),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Register and win exciting prizes!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: "Poppins"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Check out now!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: "Poppins"),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Image.asset(
                      "assets/icons/trophy.png",
                      height: 55,
                    ),
                  )
                ],
              ),
            ),
          ),
          Spacer(),
          Image.asset(
            "assets/love.png",
            height: 35,
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
