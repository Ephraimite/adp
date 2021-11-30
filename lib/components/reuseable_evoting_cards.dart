// ignore_for_file: use_key_in_widget_constructors

import 'package:adp/components/reuseable_rounded_button.dart';
import 'package:adp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VoteCandidateCard extends StatelessWidget {
  final String image;
  final String name;


  VoteCandidateCard( {required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        margin: EdgeInsets.all(10),
        clipBehavior: Clip.antiAlias,
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(image),
              fit: BoxFit.fitWidth,

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
            // Text(description),
            TextButton(onPressed: (){}, child: Text('View Profile')),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: RoundedButton(
                  onPressed: () {},
                  buttonColor: kCOLOR_PRIMARY,
                  text: 'Vote',
                  textColor: kCOLOR_WHITE,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
