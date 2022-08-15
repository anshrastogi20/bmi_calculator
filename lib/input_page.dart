import 'results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'calculation.dart';

enum Gender  {
  male,
  female,
  none
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender = Gender.none;
  int height = 170;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0A0E21),
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        child: ReusableCard(
                            colour: selectedGender == Gender.male
                                ? activeCardColour
                                : inactiveCardColour,
                            cardChild: IconContent(
                              icon: FontAwesomeIcons.person, text: 'MALE',)
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        child: ReusableCard(
                            colour: selectedGender == Gender.female
                                ? activeCardColour
                                : inactiveCardColour,
                            cardChild: IconContent(
                              icon: FontAwesomeIcons.personDress,
                              text: 'FEMALE',)
                        ),
                      ),
                    )
                  ],
                )
            ),
            Expanded(
              child: ReusableCard(
                colour: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: numberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: labelTextStyle,
                        )
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: minHeight,
                      max: maxHeight,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    )

                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: activeCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: labelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: numberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RawMaterialButton(
                                  child: Icon(FontAwesomeIcons.minus),
                                  onPressed: (){
                                    setState((){
                                      weight--;
                                    });
                                  },
                                  elevation: 5.0,
                                  constraints: BoxConstraints.tightFor(
                                    width: 55.0,
                                    height: 55.0,
                                  ),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xFF4C4F5E),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RawMaterialButton(
                                  child: Icon(FontAwesomeIcons.plus),
                                  onPressed: (){
                                    setState((){
                                      weight++;
                                    });
                                  },
                                  elevation: 5.0,
                                  constraints: BoxConstraints.tightFor(
                                    width: 55.0,
                                    height: 55.0,
                                  ),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xFF4C4F5E),
                                  ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: activeCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: labelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: numberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RawMaterialButton(
                                  child: Icon(FontAwesomeIcons.minus),
                                  onPressed: (){
                                    setState((){
                                      age--;
                                    });
                                  },
                                  elevation: 5.0,
                                  constraints: BoxConstraints.tightFor(
                                    width: 55.0,
                                    height: 55.0,
                                  ),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xFF4C4F5E),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RawMaterialButton(
                                  child: Icon(FontAwesomeIcons.plus),
                                  onPressed: (){
                                    setState((){
                                      age++;
                                    });
                                  },
                                  elevation: 5.0,
                                  constraints: BoxConstraints.tightFor(
                                    width: 55.0,
                                    height: 55.0,
                                  ),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xFF4C4F5E),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
            ),
            GestureDetector(
              onTap: (){
                Calculator result = Calculator(height: height,weight: weight);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> ResultsPage(
                    bmiResult: result.BMI().toStringAsFixed(1),
                    resultText: result.Result(result.BMI()),
                    descText: result.Description(result.BMI()),
                  ),
                ),);
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
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
        )
    );
  }
}