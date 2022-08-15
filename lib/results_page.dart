import 'constants.dart';
import 'reusable_card.dart';
import 'package:flutter/material.dart';
import 'calculation.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({required this.bmiResult,required this.resultText,required this.descText});

  final String bmiResult;
  final String resultText;
  final String descText;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch ,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                colour: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,
                      style: TextStyle(
                        color: Color(0XFF24D876),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bmiResult,
                      style: TextStyle(
                        fontSize: 100.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      descText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              color: bottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 10.0),
              width: double.infinity,
              height: bottomBarHeight,
            ),
          )
        ],
      ),
    );
  }

}