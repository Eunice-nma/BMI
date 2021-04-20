import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';

class BottomContainer extends StatelessWidget {

  BottomContainer({this.bottomContainerText, this.onTap});

  final String bottomContainerText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            bottomContainerText,
            style: kBottomContainerText,
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        color: kPink,
        width: double.infinity,
        height: 80.0,
        padding: EdgeInsets.only(bottom: 20.0),
      ),
    );
  }
}

