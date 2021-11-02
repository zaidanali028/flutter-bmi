import 'dart:math';

class BMIlogic {
  final weight;
  final height;
  BMIlogic({this.weight, this.height});

  double _bmi;
  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi >= 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getDetailedResult() {
    if (_bmi >= 25) {
      return 'Please exercise regularly to burn fat,always use the app to keep track of your current  BMI and know your progress';
    } else if (_bmi >= 18.5) {
      return 'Keep on living a healthy life,you are really trying.Excercise more and eat healthy';
    } else {
      return 'Chale you for eat na wei de3!,slooow paa oo masa';
    }
  }
}
