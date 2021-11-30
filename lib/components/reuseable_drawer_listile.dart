import 'package:flutter/material.dart';

import '../constants.dart';

class ReuseableDrawerListTile extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Function()? onTap;


  ReuseableDrawerListTile({required this.iconData, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        iconData,
        color: kCOLOR_WHITE,
        size: 30,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'Poppins',
          color: kCOLOR_WHITE,
          fontSize: 15,
        ),
      ),
    );
  }
}
