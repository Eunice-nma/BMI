import 'package:bmi_calculator/pages/homepage.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:flutter/material.dart';

void main() {
   runApp(MaterialApp(
     theme: ThemeData.dark().copyWith(
       primaryColor:  Color(0XFF0A0E21),
       scaffoldBackgroundColor:  Color(0XFF0A0E21),
     ),
     debugShowCheckedModeBanner: false,
     initialRoute: '/',
     routes: {
        '/': (context) => HomePage(),
        '/result_Page': (context) => Result(),
      }
  ));
}


