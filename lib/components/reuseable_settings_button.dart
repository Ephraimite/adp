
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../constants.dart';

class ReuseableSettingsButton extends StatelessWidget {

  final IconData icon;
  final String text;


  ReuseableSettingsButton({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
              color: kCOLOR_LIGHT_GREY,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children:  [
                Icon(icon, color: kCOLOR_PRIMARY,),
                SizedBox(width: 10,),
                Text(text)
              ],
            ),
          ),
        ),
      ),
    );
  }
}