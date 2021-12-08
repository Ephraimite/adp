import 'package:adp/components/reuseable_settings_button.dart';
import 'package:adp/constants.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: kCOLOR_PRIMARY,
          ),
        ),
        toolbarHeight: 70,
        leading: IconButton(
          onPressed: () {

          },
          icon: Icon(
            Icons.arrow_back,
            size: 20.0,
            color: kCOLOR_PRIMARY,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children:  [
            ReuseableSettingsButton(
              text: 'Change Password',
              icon: Ionicons.lock_closed,
            ),
            ReuseableSettingsButton(
              icon: Ionicons.refresh,
              text: 'Update Social Media Handles',
            ),
            ReuseableSettingsButton(
              icon: Ionicons.information_circle,
              text: 'About',

            ),
            ReuseableSettingsButton(icon: Ionicons.help_circle, text: 'Help'),
            ReuseableSettingsButton(icon: Ionicons.log_out, text: 'Logout')
          ],
        ),
      ),
    );
  }
}


