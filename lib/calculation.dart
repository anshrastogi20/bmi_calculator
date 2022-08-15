

class Calculator {

  Calculator({required this.height,required this.weight});
  int height;
  int weight;
  double _bmi = 0;

  double BMI() {
    double _bmi = (weight*10000)/(height*height);
    return _bmi;
  }
  String Result(bmi){
    if(bmi>=25){
      return 'Overweight';
    }
    else if(bmi>=18.5){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }
  String Description(bmi){
    if(bmi>=25){
      return 'You are overweight. Try to exercise more.';
    }
    else if(bmi>=18.5){
      return 'You have a normal body weight. Good job!';
    }
    else{
      return 'You have a lower than normal body weight. You can eat more.';
    }
  }
}