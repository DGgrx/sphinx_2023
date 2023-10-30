import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphinx_2023/common/sphinx_loader.dart';
import 'package:sphinx_2023/screens/login/view_model/login_vm.dart';
import 'package:sphinx_2023/screens/search/event_details/view_model/event_vm.dart';

import '../../theme/color_def.dart';
import '../search/event_details/event_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer2<LoginVm,EventVm>(
      builder: (context,loginVm,eventVm,_) {
        return SafeArea(
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                "Upcoming   Events".toUpperCase(),
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
              const SizedBox(
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
                items: loginVm.events
                    .map((event) => GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                EventDetail(event: event)));
                      },
                      child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  // height: 100,
                  child: Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: CachedNetworkImage(
                        imageUrl: event.imageUrl!,
                        placeholder: (context, url) =>
                            Container(
                              decoration: const BoxDecoration(color: Colors.black),
                              child: const LoadingScreen(),
                            ),
                        errorWidget: (context, url, error) =>
                            Container(
                                height: 100,
                                child: const Icon(Icons.error)),
                      ),
                  ),
                ),
                    ))
                    .toList(),
              ),
              const SizedBox(
                height: 28,
              ),
              GestureDetector(
                onTap: (){
                  eventVm.launchUrl("https://unstop.com/college-fests/sphinx-malaviya-national-institute-of-technology-mnit-jaipur-161670");
                },
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: buttonYellow),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Column(
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
              ),
              SizedBox(height: 35,),
              // const Spacer(),
              GestureDetector(
                onTap: (){
                  eventVm.launchUrl("https://zine.co.in/team");
                },
                child: Image.asset(
                  "assets/love.png",
                  height: 35,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        );
      }
    );
  }
}
