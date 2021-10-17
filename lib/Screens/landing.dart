import 'package:flutter/cupertino.dart';
import 'package:godweb/Screens/auth.dart';
import 'package:godweb/Screens/home.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = false;


    return isLoggedIn ? HomePage() : AuthorizationPage();
  }
}
