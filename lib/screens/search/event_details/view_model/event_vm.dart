import 'package:flutter/cupertino.dart';

import '../repo/event_repo.dart';

class EventVm extends ChangeNotifier{
  final eventRepo = EventRepo();

  void launchUrl(url){
    eventRepo.launchUrlStart(url: url);
  }


}