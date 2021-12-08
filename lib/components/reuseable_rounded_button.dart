
import 'dart:ui';

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final Color? buttonColor;
  final Function()? onPressed;
  final Color? textColor;
  final int? quantity;

  RoundedButton({this.text, this.buttonColor, required this.onPressed, this.textColor, this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5.0,
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        child: SizedBox(
          width: double.infinity,
          child: MaterialButton(
            onPressed: onPressed,
            // minWidth: 200.0,
            // height: 30.0,
            child: Text(
              text!,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}