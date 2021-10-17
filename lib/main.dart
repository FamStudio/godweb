import 'package:flutter/material.dart';
import 'package:godweb/Screens/landing.dart';


void main() => runApp(ChordsApp());

class ChordsApp extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
        title: 'YourPractice',
        theme: ThemeData(
            primaryColor: Color.fromRGBO(50, 65, 85, 1),
            textTheme: TextTheme(headline6: TextStyle(color: Colors.white))
        ),
        home: LandingPage()
    );
  }
}