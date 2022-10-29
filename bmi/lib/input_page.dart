import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bottom_bottom.dart';
import 'calculator_brain.dart';
import 'constants.dart';
import 'icon_content.dart';
import 'results_page.dart';
import 'reusableCard.dart';
import 'roundIcon.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  kGender selectedGender = kGender.none;
  // Color maleCardColor = InactiveCardColor;
  // Color FemaleCardColor = InactiveCardColor;
  //
  // void updateColor(Gender gender) {
  //   if (gender == Gender.male) {
  //     if (maleCardColor == activeCardColor) {
  //       maleCardColor = InactiveCardColor;
  //       FemaleCardColor = activeCardColor;
  //     } else {
  //       maleCardColor = activeCardColor;
  //       FemaleCardColor = InactiveCardColor;
  //     }
  //   }
  //   if (gender == Gender.female) {
  //     if (FemaleCardColor == activeCardColor) {
  //       FemaleCardColor = InactiveCardColor;
  //       maleCardColor = activeCardColor;
  //     } else {
  //       FemaleCardColor = activeCardColor;
  //       maleCardColor = InactiveCardColor;
  //     }
  //   }
  //}
  int Height = 180;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = kGender.male;
                        });
                      },
                      child: Reusablecard(
                        colour: selectedGender == kGender.male
                            ? kactiveCardColor
                            : kInactiveCardColor,
                        cardChild: Icon_Contents(
                          text: "MALE",
                          icon: FontAwesomeIcons.mars,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = kGender.female;
                        });
                      },
                      child: Reusablecard(
                          colour: selectedGender == kGender.female
                              ? kactiveCardColor
                              : kInactiveCardColor,
                          cardChild: Icon_Contents(
                            text: "FEMALE",
                            icon: FontAwesomeIcons.venus,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Reusablecard(
                  colour: kactiveCardColor,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 165.0),
                        child: Text(
                          "Height",
                          style: TextStyle(
                              color: Color(0xFF8D8E98), fontSize: 22.0),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            Height.toString(),
                            style: kbodyTextStyle,
                          ),
                          Text(
                            'cm',
                            style: klabelTextStyle,
                          ),
                        ],
                      ),
                      Slider(
                        value: Height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Colors.red,
                        inactiveColor: Colors.grey,
                        onChanged: (double newValue) {
                          setState(() {
                            Height = newValue.round();
                          });
                        },
                      ),
                    ],
                  )),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Reusablecard(
                      colour: kactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            child: Text(
                              "Weight",
                              style: TextStyle(
                                  color: Color(0xFF8D8E98), fontSize: 20.0),
                            ),
                          ),
                          Text(
                            weight.toString(),
                            style: kbodyTextStyle,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RoundIconButton(
                                  Child: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                                RoundIconButton(
                                  Child: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Reusablecard(
                      colour: kactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            child: Text(
                              "Age",
                              style: TextStyle(
                                  color: Color(0xFF8D8E98), fontSize: 20.0),
                            ),
                          ),
                          Text(
                            age.toString(),
                            style: kbodyTextStyle,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RoundIconButton(
                                  Child: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                                RoundIconButton(
                                  Child: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            BottomButton(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: Height, weight: weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmiResults: calc.calculateBMI(),
                              resultText: calc.getResult(),
                              Interpretation: calc.getInterpretation(),
                            )));
              },
              buttonTitle: "CALCULATE",
            )
          ],
        ));
  }
}
