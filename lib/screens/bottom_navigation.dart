import 'package:adp/screens/dashboard.dart';
import 'package:adp/screens/referral_screen.dart';
import 'package:adp/screens/settings_screen.dart';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'news_feed_screen/feeds_main.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;
  int? index;
  final bottomNavigationScreens = [
    Dashboard(),
    FeedScreen(),
    ReferralScreen(),
    SettingScreen(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
          duration: Duration(milliseconds: 1200),
          transitionBuilder: (Widget child, Animation<double> primaryAnimation,
                  Animation<double> secondaryAnimation) =>
              FadeThroughTransition(
                  animation: primaryAnimation,
                  secondaryAnimation: secondaryAnimation,
                child: child,
              ),
          child: bottomNavigationScreens[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onItemTap,
        elevation: 16,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    _currentIndex == 0 ? kCOLOR_LIGHT_GREY : Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ImageIcon(
                  AssetImage('assets/images/home.png'),
                  color: kCOLOR_PRIMARY,
                ),
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    _currentIndex == 1 ? kCOLOR_LIGHT_GREY : Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ImageIcon(
                  AssetImage('assets/images/feeds.png'),
                  color: kCOLOR_PRIMARY,
                ),
              ),
            ),
            label: 'Feeds',
          ),
          BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == 2
                      ? kCOLOR_LIGHT_GREY
                      : Colors.transparent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ImageIcon(
                    AssetImage('assets/images/referral.png'),
                    color: kCOLOR_PRIMARY,
                    size: 20,
                  ),
                ),
              ),
              label: 'Referral'),
          BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == 3
                      ? kCOLOR_LIGHT_GREY
                      : Colors.transparent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ImageIcon(
                    AssetImage('assets/images/settings.png'),
                    color: kCOLOR_PRIMARY,
                  ),
                ),
              ),
              label: 'Settings'),
        ],
        selectedItemColor: kCOLOR_PRIMARY,
      ),
    );
  }
}
