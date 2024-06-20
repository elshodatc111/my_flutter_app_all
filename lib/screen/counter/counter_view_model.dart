import 'package:flutter/material.dart';

class CounterViewModel extends ChangeNotifier{
  int count = 0;

  incremet(){
    count++;
    Notification;
    notifyListeners();
  }

  decrement(){
    count--;
    notifyListeners();
  }

}