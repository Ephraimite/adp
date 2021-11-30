
import 'package:adp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReuseableReferralList extends StatelessWidget {
  int? number;
  String? name;
  String? date;


  ReuseableReferralList({ this.number, this.name, this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('$number'),
              Text(name!),
              Text(date!),
            ],
          ),
        ),
      ],
    );
  }
}
