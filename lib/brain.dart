import 'dart:math';

class Calculator {
  Calculator(this.height, this.weight);
  int height;
  int weight;
  late double _bmi;

  String calculateBmi() {
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

  String comment() {
    if (_bmi >= 25) {
      return 'You have higher than a normal body weight. Exercise More!';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good Job!';
    } else {
      return 'You Have lower than a normal body weight. Eat More!';
    }
  }
}
