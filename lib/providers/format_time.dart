import 'package:flutter/material.dart';

class TimeFormat with ChangeNotifier {
  bool is24HourFormat = true;

  void toggleTimeFormat() {
    is24HourFormat = !is24HourFormat;
    notifyListeners();
  }
}