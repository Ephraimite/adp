import 'package:adp/constants.dart';
import 'package:adp/screens/dashboard.dart';
import 'package:adp/screens/onboarding_screen.dart';
import 'package:adp/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_navigation.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 5), () => checkFirstSeen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCOLOR_PRIMARY,
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/splash.png'),
            fit: BoxFit.fill,
          ))),
    );
  }

  checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    var email = prefs.getString('email');

    if (email != null) {
      return Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    } else if (_seen) {
      return Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      // Set the flag to true at the end of onboarding screen if everything is successfull and so I am commenting it out
      await prefs.setBool('seen', true);
      return Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
    }
  }
}
