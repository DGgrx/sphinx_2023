import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:sphinx_2023/screens/home/view_models/home_vm.dart";

import "../../components/scrollable_row.dart";
import "../../models/event.dart";
import "../login/view_model/login_vm.dart";

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<LoginVm,HomeVm>(
      builder: (context,loginVm,homeVm,_) {

        List<Event> events = loginVm.events;
        homeVm.makeCategoryList(events);
        Map<String, List<Event>> categoryList = HomeVm.categoricalList ;

        return SingleChildScrollView(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...categoryList.entries.map((entry) {
                  return CustomScrollableRow(events: entry.value, title: entry.key,);
                }).toList()
                // CustomScrollableRow(events),
              ],
            ));
      }
    );
  }
}
