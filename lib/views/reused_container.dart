import 'package:flutter/material.dart';

class ReusedContainer extends StatelessWidget {

  ReusedContainer({@required this.containerColor, this.containerChild, this.onPress});

  final Color containerColor;
  final Widget containerChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: containerChild,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: containerColor,
        ),
        margin: EdgeInsets.all(15.0),
      ),
    );
  }
}

