
import 'package:flutter/material.dart';

class EvotingLocalGovtTab extends StatefulWidget {
  const EvotingLocalGovtTab({Key? key}) : super(key: key);

  @override
  _EvotingLocalGovtTabState createState() => _EvotingLocalGovtTabState();
}

class _EvotingLocalGovtTabState extends State<EvotingLocalGovtTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('No available Candidate', style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),),
      ),

    );
  }
}
