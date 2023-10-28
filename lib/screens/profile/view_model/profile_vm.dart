import 'package:flutter/material.dart';

class ProfileVm extends ChangeNotifier{

  int index = 0;

  void setIndex(int val){
    index = val;
    notifyListeners();
  }




}