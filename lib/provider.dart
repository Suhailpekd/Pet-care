import 'package:flutter/material.dart';

class Providerclass extends ChangeNotifier {
  int a = 0;
  // int get changcount22 => a;
  void status1() {
    a++;
    notifyListeners();
  }

  void status0() {
    a = a--;
  }
}
