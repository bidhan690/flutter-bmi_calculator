// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, empty_constructor_bodies, prefer_const_constructors_in_immutables, must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'icons_data.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'brain.dart';
import 'result_page.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  void changeColor(Gender selectedGender) {
    (selectedGender == Gender.male) && (maleCardColor == inactiveCardColor)
        ? [maleCardColor = activeCardColor, femaleCardColor = inactiveCardColor]
        : maleCardColor = inactiveCardColor;

    (selectedGender == Gender.female) && (femaleCardColor == inactiveCardColor)
        ? [femaleCardColor = activeCardColor, maleCardColor = inactiveCardColor]
        : femaleCardColor = inactiveCardColor;
  }

  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
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
                        changeColor(Gender.male);
                      });
                    },
                    child: ReusableConatiner(maleCardColor, 'Male', Icons.male),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeColor(Gender.female);
                      });
                    },
                    child: ReusableConatiner(
                        femaleCardColor, 'Female', Icons.female),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: activeCardColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Height', style: labelTextStyle),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: heightTextStyle,
                            ),
                            Text(
                              'cm',
                              style: heightLabelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xffeb1555),
                            overlayColor: Color(0x29eb1555),
                            overlayShape:
                                RoundSliderThumbShape(enabledThumbRadius: 16),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 220,
                            inactiveColor: Colors.grey,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: activeCardColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: labelTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          weight.toString(),
                          style: heightTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(Icons.remove, () {
                              setState(() {
                                weight--;
                              });
                            }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(Icons.add, () {
                              setState(() {
                                weight++;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: activeCardColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: labelTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          age.toString(),
                          style: heightTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(Icons.remove, () {
                              setState(() {
                                age--;
                              });
                            }),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(Icons.add, () {
                              setState(() {
                                age++;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Calculator calc = Calculator(height, weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                      calc.calculateBmi(), calc.getResult(), calc.comment()),
                ),
              );
            },
            child: Container(
              color: Colors.pink,
              height: 60,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              child: Center(
                child: Text(
                  "CALCULATE",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
