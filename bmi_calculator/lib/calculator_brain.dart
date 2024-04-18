import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int? height;
  final int? weight;

  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight! / pow(height! / 100, 2);
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
      return 'You\'ve a higher weight than normal\n Try exercising!';
    } else if (_bmi > 18.5) {
      return 'You\'ve a normal body weight.\n Good job!';
    } else {
      return 'You\'ve a lower body weight than normal.\n Eat a little bit more!';
    }
  }
}
