import 'dart:math';

class Calculator{
  Calculator({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI(){
    _bmi = weight/ pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String result(){
    if(_bmi >=25){
     return 'OVERWEIGHT';
    }else if (_bmi > 18.5){
      return 'NORMAL';
    }else{
      return 'UNDERWEIGHT';
    }
  }
//this is the interpretation on the bmi result
  String interpretation(){
    if(_bmi >=25){
      return 'Your BMI is higher than normal, you should try exercising a bit more';
    }else if (_bmi > 18.5){
      return 'your BMI is just right, Good job!';
    }else{
      return 'Your BMI is lower than normal, you should eat a bit more';
    }
  }


}