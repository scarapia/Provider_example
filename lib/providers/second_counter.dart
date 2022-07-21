import 'package:flutter/material.dart';

class SecondCounter with ChangeNotifier {
  int _counterTwo = 0;
  int get count => _counterTwo;

  void addToCounterTwo() {
    _counterTwo++;
    notifyListeners();
  }

  void decrementFromCounterTwo() {
    _counterTwo--;
    notifyListeners();
  }

  void resetCounterTwo() {
    _counterTwo = 0;
    notifyListeners();
  }
}
