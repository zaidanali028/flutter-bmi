import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'CardReuse.dart';
import 'cardContent.dart';
import 'ResultsPage.dart';
import 'bottomBtn.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

import 'BMIlogic.dart';

enum sexType { male, female }

void main() {
  runApp(MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0XFF0A0E21),
          scaffoldBackgroundColor: Color(0XFF0E21)),
      initialRoute: '/',
      routes: {
        '/': (context) => FlutterBMI(),
        '/results': (context) => ResultsPage(),
      }));
}

class FlutterBMI extends StatefulWidget {
  @override
  _FlutterBMIState createState() => _FlutterBMIState();
}

class _FlutterBMIState extends State<FlutterBMI> {
  var femaleCardColor = inActivateCardColor;
  var maleCardColor = inActivateCardColor;

  void activateColor(sexType sex) {
    if (sex == sexType.male) {
      if (maleCardColor == inActivateCardColor) {
        maleCardColor = activateCardColor;
        femaleCardColor = inActivateCardColor;
      }
    } else {
      maleCardColor = inActivateCardColor;
    }

    if (sex == sexType.female) {
      if (femaleCardColor == inActivateCardColor) {
        femaleCardColor = activateCardColor;
        maleCardColor = inActivateCardColor;
      }
    } else {
      femaleCardColor = inActivateCardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF0A0E21),
      appBar: AppBar(
        backgroundColor: Color(0XFF0E21),
        centerTitle: true,
        title: Text('BMI CALCULATOR '),
      ),
      body: SafeArea(
        child: Expanded(
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            activateColor(sexType.male);
                          });
                        },
                        child: CardReuse(
                            color: maleCardColor,
                            cardChild: mOrfchild(
                                sexIcon: FontAwesomeIcons.mars,
                                sexText: "MALE")),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            activateColor(sexType.female);
                          });
                        },
                        child: CardReuse(
                          color: femaleCardColor,
                          cardChild: mOrfchild(
                              sexIcon: FontAwesomeIcons.venus,
                              sexText: "FEMALE"),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: CardReuse(
                  width: MediaQuery.of(context).size.width,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT', style: kSexStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(kSliderValue.toString(), style: kNumStyle),
                          Text('cm', style: kSexStyle),
                        ],
                      ),
                      Slider(
                        inactiveColor: Colors.grey,
                        activeColor: Colors.pink,
                        value: kSliderValue.toDouble(),
                        min: kSliderMinVal.toDouble(),
                        max: kSliderMaxVal.toDouble(),
                        onChanged: (double currentValue) {
                          // print(currentValue);
                          setState(() {
                            kSliderValue = currentValue.round();
                          });
                        },
                      )
                    ],
                  ),
                  color: activateCardColor,
                )),
                Row(
                  children: [
                    Expanded(
                      child: CardReuse(
                          cardChild: Column(
                            children: [
                              Text('WEIGHT', style: kSexStyle),
                              Text(kWeightValue.toString(), style: kNumStyle),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingIconButton(
                                    btFunction: () {
                                      setState(() {
                                        kWeightValue++;
                                      });
                                    },
                                    icon: FontAwesomeIcons.plus,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  FloatingIconButton(
                                    btFunction: () {
                                      setState(() {
                                        if (kWeightValue <= 0) {
                                          kWeightValue = 0;
                                        } else {
                                          kWeightValue--;
                                        }
                                      });
                                    },
                                    icon: FontAwesomeIcons.minus,
                                  ),
                                ],
                              )
                            ],
                          ),
                          color: activateCardColor),
                    ),
                    Expanded(
                      child: CardReuse(
                          cardChild: Column(
                            children: [
                              Text('AGE', style: kSexStyle),
                              Text(kAgeValue.toString(), style: kNumStyle),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingIconButton(
                                    btFunction: () {
                                      setState(() {
                                        kAgeValue++;
                                      });
                                    },
                                    icon: FontAwesomeIcons.plus,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  FloatingIconButton(
                                    btFunction: () {
                                      setState(() {
                                        if (kAgeValue <= 0) {
                                          kAgeValue = 0;
                                        } else {
                                          kAgeValue--;
                                        }
                                      });
                                    },
                                    icon: FontAwesomeIcons.minus,
                                  ),
                                ],
                              )
                            ],
                          ),
                          color: activateCardColor),
                    ),
                  ],
                ),
                CalcBtn(
                    btText: "CALCULATE",
                    onTap: () {
                      // Navigator.pushNamed(context, '/results');
                      BMIlogic calculateBMI =
                          BMIlogic(height: kSliderValue, weight: kWeightValue);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultsPage(
                                    BMI: calculateBMI.calculateBmi(),
                                    healthStatus: calculateBMI.getResults(),
                                    healthStatusDetail:
                                        calculateBMI.getDetailedResult(),
                                  )));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FloatingIconButton extends StatelessWidget {
  final IconData icon;
  final Function btFunction;
  FloatingIconButton({@required this.icon, this.btFunction});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 11.0,
      child: Icon(icon, color: Colors.white),
      backgroundColor: Color(0xFF4C4F5E),
      onPressed: () {
        btFunction();
      },
    );
  }
}
