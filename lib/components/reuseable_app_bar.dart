

import 'package:flutter/material.dart';

import '../constants.dart';

class ReuseableAppBar extends StatelessWidget {
  final IconData? iconButton;
  final String? text;
final Function()? onpressed;
  ReuseableAppBar({this.iconButton, this.text, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: kCOLOR_PRIMARY),
      title: Text(text!, style: TextStyle(
        color: kCOLOR_PRIMARY
      ),),
      actions: [
        IconButton(
          color: kCOLOR_PRIMARY,
          onPressed: () {},
          icon: Icon(iconButton, size: 24, color: kCOLOR_PRIMARY),
        ),
      ],
    );
  }
}