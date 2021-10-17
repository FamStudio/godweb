import 'package:flutter/material.dart';
import 'package:godweb/Screens/landing.dart';
import 'package:firebase_core/firebase_core.dart';



void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChordsApp());
}

class ChordsApp extends StatelessWidget{

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
        title: 'YourPractice',
        theme: ThemeData(
            primaryColor: Color.fromRGBO(50, 65, 85, 1),
            textTheme: TextTheme(headline6: TextStyle(color: Colors.white))
        ),
        home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot)
          {if(snapshot.hasError){
          print("Error");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return LandingPage();
          }
          return CircularProgressIndicator();
          }
        )
    );
  }
}