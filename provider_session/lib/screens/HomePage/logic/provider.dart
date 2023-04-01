import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculatorProvider extends ChangeNotifier {
  late double _bmi;
  String selectedGender = "male";
  double height = 180;
  int weight = 60;
  int age = 20;

   void incrementAge() {
    age++;
    notifyListeners();
  }
  void dcrementAge() {
    age--;
    notifyListeners();
  }
  void incrementWeight() {
    weight++;
    notifyListeners();
  }
  void dcrementWeight() {
    weight--;
    notifyListeners();
  }


  void editGender(String gender) {
    selectedGender = gender;
    notifyListeners();
  }

  void editHight(double hight) {
    height = hight;
    notifyListeners();
  }

  String calculateBMI({required int height, required int weight}) {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
