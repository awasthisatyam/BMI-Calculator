import 'dart:math';
import 'package:flutter/cupertino.dart';

class CalculatorBrain {
  CalculatorBrain({@required this.height, @required this.weight});
  final int height, weight;
  double _bmi;

  double getBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi;
  }

  String getStatus() {
    if (_bmi <= 18.4) return 'You should eat more and do some exercise';
    if (_bmi >= 18.5 && _bmi <= 24.9) return 'Your BMI is in normal range!';
    if (_bmi > 25) return 'You should do some exercise';
  }
}
