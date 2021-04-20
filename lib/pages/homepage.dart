import 'package:flutter/material.dart';
import 'package:bmi_calculator/views/reused_container.dart';
import 'package:bmi_calculator/views/gender_selector.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/views/bottom_container.dart';
import 'package:bmi_calculator/views/round_icon_button.dart';
import 'package:bmi_calculator/calculate.dart';

enum Gender {
  male, female
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender selectedGender;
  int height= 180;
  int weight= 60;
  int age= 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //THIS IS THE GENDER PICKER ROW
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusedContainer(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    containerColor: selectedGender == Gender.male? kActiveColor: kInactiveColor,
                    containerChild: GenderSelector(
                        genderIcon: FontAwesomeIcons.mars,
                        label: 'MALE'
                    )
                  ),
                ),
                Expanded(
                  child: ReusedContainer(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    containerColor: selectedGender == Gender.female? kActiveColor: kInactiveColor,
                    containerChild: GenderSelector(
                        genderIcon: FontAwesomeIcons.venus, 
                        label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),

          //THIS IS THE HEIGHT ROW
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusedContainer(
                      containerColor: kActiveColor,
                      containerChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                              'HEIGHT',
                              style: kLabelTextStyle
                           ),
                          //THIS IS THE ROW FOR THE HEIGHT FIGURE AND UNIT
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                height.toString(),
                                style: kNumberStyle
                              ),
                              Text(
                                'cm',
                                style: kLabelTextStyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: kGrey,
                              thumbColor: kPink,
                              overlayColor: Color(0X29EB1555),
                              thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                              overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0)
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue){
                                setState(() {
                                  height= newValue.round();
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

          //THIS IS THE WEIGHT AND AGE ROW
          Expanded(
            child: Row(
              children: <Widget>[
                //THIS IS THE WEIGHT CONTAINER
                Expanded(
                    child: ReusedContainer(
                      containerColor: kActiveColor,
                      containerChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),

                              SizedBox(width: 10.0),

                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                              )
                            ],
                          )

                        ],
                      ),
                    )
                ),

                //THIS IS THE AGE CONTAINER
                Expanded(
                    child: ReusedContainer(
                      containerColor: kActiveColor,
                      containerChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),

                              SizedBox(width: 10.0),

                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ],
                          )

                        ],
                      ),
                    )
                ),
              ],
            ),
          ),

          BottomContainer(
            bottomContainerText: 'CALCULATE',
            onTap: (){
              Calculator calc= Calculator(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) => Result(
                bmiResult: calc.calculateBMI(),
                bmiText: calc.result(),
                interpretation: calc.interpretation(),
              )));
            },
          )
        ],
      )
    );
  }
}

