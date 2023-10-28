import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphinx_2023/theme/color_def.dart';

import '../splash/view_model/splash_vm.dart';

class Landing extends StatelessWidget {
  Landing({super.key});

  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    var splashVm = Provider.of<SplashVM>(context, listen: false);
    splashVm.getEvents();
    print(splashVm.events.length);

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 0),
          child: Image.asset(
            "assets/sphinx_banner.png",
            width: MediaQuery.of(context).size.width * 0.65,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 0),
            child: Image.asset("assets/icons/bell.png"),
          ),
          SizedBox(
            width: 10,
          )
          // ImageIcon(
          //   AssetImage("assets/icons/bell.png"),
          //   // color: ,
          // )
        ],
      ),
      body: SafeArea(
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
      ),
      bottomNavigationBar: Container(
        decoration:
            BoxDecoration(border: Border(top: BorderSide(color: Colors.white))),
        child: DefaultTabController(
          length: 4,
          child: TabBar(
            labelColor: selectedYellow,
            unselectedLabelColor: unselectedYellow,
            labelPadding: EdgeInsets.zero,
            padding: EdgeInsets.all(10),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: selectedYellow, width: 7.0),
              insets: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 55.0),
            ),
            tabs: [
              Tab(
                iconMargin: EdgeInsets.zero,
                icon: ImageIcon(
                  AssetImage(
                    "assets/icons/home.png",
                  ),
                ),
              ),
              Tab(
                iconMargin: EdgeInsets.zero,
                icon: ImageIcon(
                  AssetImage("assets/icons/search.png"),
                ),
              ),
              Tab(
                iconMargin: EdgeInsets.zero,
                icon: ImageIcon(
                  AssetImage("assets/icons/calender.png"),
                ),
              ),
              Tab(
                iconMargin: EdgeInsets.zero,
                icon: ImageIcon(
                  AssetImage("assets/icons/user.png"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
