import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/reusable_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'results_page.dart';

enum Sex { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Sex selected;
  int calories = 1500;
  int protein = 154;
  int carbs = 35;
  int fat = 84;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KETO CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kSelectedCardColor,
                    cardChild: PlusMinusCard(
                      value: protein,
                      text: 'protein (g)',
                      onPressAdd: () {
                        setState(() {
                          protein++;
                        });
                      },
                      onPressSubtract: () {
                        setState(() {
                          protein--;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kSelectedCardColor,
                    cardChild: PlusMinusCard(
                      value: carbs,
                      text: 'carbs (g)',
                      onPressAdd: () {
                        setState(() {
                          carbs++;
                        });
                      },
                      onPressSubtract: () {
                        setState(() {
                          carbs--;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kSelectedCardColor,
                    cardChild: PlusMinusCard(
                      value: fat,
                      text: 'fat (g)',
                      onPressAdd: () {
                        setState(() {
                          fat++;
                        });
                      },
                      onPressSubtract: () {
                        setState(() {
                          fat--;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kSelectedCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Text(
                        calories.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'kCal',
                        style: kTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: kTextStyle.color,
                      activeTrackColor: Colors.white,
                      thumbColor: kBottomContainerColor,
                      overlayColor: kOpaceBottomContainerColor,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 35.0),
                      trackHeight: 1.0,
                    ),
                    child: Slider(
                      value: calories.toDouble(),
                      min: 1200.0,
                      max: 3000.0,
                      onChanged: (value) {
                        setState(() {
                          calories = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultsPage()),
              );
            },
            child: Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: Center(child: Text('New Day', style: kBottomButtonText)),
            ),
          ),
        ],
      ),
    );
  }
}

class PlusMinusCard extends StatelessWidget {
  final String text;
  final int value;
  final Function onPressAdd;
  final Function onPressSubtract;

  PlusMinusCard({this.text, this.value, this.onPressAdd, this.onPressSubtract});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: kTextStyle,
        ),
        Text(
          value.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: onPressSubtract,
            ),
            SizedBox(
              width: 1.0,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: onPressAdd,
            ),
          ],
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  RoundIconButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 38.0,
        height: 38.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
