import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:bmi_calculator/contants.dart';
import 'package:bmi_calculator/reusableCard.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result({this.bmi, this.status});
  final double bmi;
  final String status;

  Color updateColor() {
    if (bmi >= 18.5 && bmi <= 24.9)
      return Colors.lightBlueAccent;
    else
      return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
            style: TextStyle(color: Colors.lightBlueAccent),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                child: Text(
                  'Your Result',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.lightBlueAccent),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kCardColor,
                cardWidget: Column(
                  children: [
                    Text(
                      bmi.toStringAsFixed(1),
                      style: TextStyle(fontSize: 30, color: updateColor()),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      status,
                      style: TextStyle(fontSize: 15, color: updateColor()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SfRadialGauge(
                      axes: [
                        RadialAxis(
                          minimum: 10,
                          maximum: 30,
                          ranges: [
                            GaugeRange(
                                startValue: 10,
                                endValue: 18.5,
                                color: Colors.red),
                            GaugeRange(
                                startValue: 18.5,
                                endValue: 24.9,
                                color: Colors.lightBlueAccent),
                            GaugeRange(
                                startValue: 24.9,
                                endValue: 30,
                                color: Colors.red),
                          ],
                          pointers: [
                            NeedlePointer(value: bmi),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
