import 'package:bmi_calculator/calculatorBrain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableCard.dart';
import 'cardChild.dart';
import 'contants.dart';
import 'calculatorBrain.dart';
import 'resultPage.dart';

enum gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color initialMaleCardColor = Color(0xFF1D1E33);
  Color initialFemaleCardColor = Color(0xFF1D1E33);

  gender cardGender;
  int height = 100, weight = 10;
  CalculatorBrain cal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.lightBlueAccent),
        )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // first row to select gender
          Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          cardGender = gender.male;
                        });
                      },
                      colour: cardGender == gender.male
                          ? kMaleCardColor
                          : kCardColor,
                      // child of card is CardChild which is a custom class
                      cardWidget: CardChild(
                        cardIcon: FontAwesomeIcons.male,
                        cardText: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          cardGender = gender.female;
                        });
                      },
                      colour: cardGender == gender.female
                          ? kFemaleCardColor
                          : kCardColor,
                      // child of card is CardChild which is a custom class
                      cardWidget: CardChild(
                        cardIcon: FontAwesomeIcons.female,
                        cardText: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              )),
          //row to select height
          Expanded(
              flex: 4,
              child: ReusableCard(
                colour: kCardColor,
                cardWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                            fontSize: 50,
                          ),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text('cm'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // slider
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: kSliderColor,
                        inactiveTrackColor: Colors.white,
                        thumbColor: kSliderColor,
                        overlayColor: Colors.white,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 10.0),
                        overlayShape:
                            RoundSliderThumbShape(enabledThumbRadius: 25.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100,
                        max: 300,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        },
                      ),
                    )
                  ],
                ),
              )),
          //row to select weight and age
          Expanded(
            flex: 4,
            child: ReusableCard(
              colour: kCardColor,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WEIGHT',
                    style: kTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        weight.toString(),
                        style: TextStyle(
                          fontSize: 50,
                        ),
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Text('KG'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // slider
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: kSliderColor,
                      inactiveTrackColor: Colors.white,
                      thumbColor: kSliderColor,
                      overlayColor: Colors.white,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape:
                          RoundSliderThumbShape(enabledThumbRadius: 25.0),
                    ),
                    child: Slider(
                      value: weight.toDouble(),
                      min: 10,
                      max: 250,
                      onChanged: (double newValue) {
                        setState(() {
                          weight = newValue.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          // button "calculate"
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(10.0),
              width: double.infinity,
              child: FlatButton(
                color: kButtonColor,
                onPressed: () {
                  cal = CalculatorBrain(height: height, weight: weight);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Result(
                                bmi: cal.getBMI(),
                                status: cal.getStatus(),
                              )));
                },
                child: Text(
                  'CALCULATE BMI',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
