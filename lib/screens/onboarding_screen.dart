
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../constants.dart';
import 'login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Action Democratic Party ',
            body: 'We are building the future with digitalized tools',
            image: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 100.0, left: 20.0, right: 20.0),
                child: Image.asset('assets/images/digitalized_voting.png'),
              ),
            ),
          ),
          PageViewModel(
            title: 'Action Democratic Party',
            body: 'Unlock your Potential, vote your favourite candidate',
            image: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 100.0, left: 20.0, right: 20.0),
                child: Image.asset('assets/images/favourite_candidate.png'),
              ),
            ),
          ),
          PageViewModel(
            title: 'Action Democratic Party',
            body: 'We are building the future, get up to date news with our mobile app',
            image: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 100.0, left: 20.0, right: 20.0),
                child: Image.asset('assets/images/news.png'),
              ),
            ),
          ),
        ],
        showDoneButton: true,
        showSkipButton: true,
        showNextButton: true,
        done: Container(
          decoration: BoxDecoration(
            color: Color(0xff030D42),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Get started',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        onDone: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        skip: Text(
          'Skip',
          style: TextStyle(
            color: kCOLOR_PRIMARY,
            fontWeight: FontWeight.bold,
          ),
        ),
        onSkip: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        next: Icon(
          Icons.arrow_forward,
          color: kCOLOR_PRIMARY,
        ),
        globalBackgroundColor: Colors.grey[200],
        dotsDecorator: DotsDecorator(
            activeColor: kCOLOR_PRIMARY,
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            activeSize: Size(20.0, 10.0)),
      ),
    );

  }
}
