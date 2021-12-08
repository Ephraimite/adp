

import 'package:flutter/material.dart';

class RaffleDrawYearly extends StatefulWidget {
  const RaffleDrawYearly({Key? key}) : super(key: key);

  @override
  _RaffleDrawYearlyState createState() => _RaffleDrawYearlyState();
}

class _RaffleDrawYearlyState extends State<RaffleDrawYearly> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('2018 winners'),
          SizedBox(height: 10,),
          Wrap(
            children: const [

            ],
          )
        ],
      ),

    );
  }
}