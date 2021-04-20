import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/views/reused_container.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/views/bottom_container.dart';

class Result extends StatelessWidget {

  Result({@required this.bmiResult, @required this.bmiText, @required this.interpretation});
  
  final String bmiResult;
  final String bmiText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR'
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'YOUR RESULT',
                style: kLargeTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusedContainer(
              containerColor: kActiveColor,
              containerChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    bmiText,
                    style: kResultStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMIFigure,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  )
                ],
              ),
            ),
          ),
          BottomContainer(
            bottomContainerText: 'RE-CALCULATE YOUR BMI',
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
