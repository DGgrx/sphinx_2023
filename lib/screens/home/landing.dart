import 'package:flutter/material.dart';
import 'package:sphinx_2023/screens/calender/calender_screen.dart';
import 'package:sphinx_2023/screens/home/home.dart';
import 'package:sphinx_2023/screens/profile/profile_screen.dart';
import 'package:sphinx_2023/screens/search/event_details/event_detail_screen.dart';
import 'package:sphinx_2023/theme/color_def.dart';


class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> with TickerProviderStateMixin{
  int currIndex = 0;


  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.11,
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
            padding: const EdgeInsets.fromLTRB(10.0, 35, 15, 15),
            child: Image.asset("assets/icons/bell.png",
            height: 30,),
          ),
          const SizedBox(
            width: 10,
          )
          // ImageIcon(
          //   AssetImage("assets/icons/bell.png"),
          //   // color: ,
          // )
        ],
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [
          HomeScreen(),
          EventDetail(),
          CalenderScreen(),
          ProfileScreen()
        ],

      ),

      bottomNavigationBar: Container(
        decoration:
            const BoxDecoration(border: Border(top: BorderSide(color: Colors.white))),
        child: TabBar(
          controller: _tabController,
          labelColor: selectedYellow,
          unselectedLabelColor: unselectedYellow,
          labelPadding: EdgeInsets.zero,
          padding: const EdgeInsets.all(10),
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(color: selectedYellow, width: 7.0),
            insets: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 55.0),
          ),
          tabs: const [
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

    );
  }
}
