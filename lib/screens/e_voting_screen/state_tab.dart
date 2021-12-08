import 'package:flutter/material.dart';

class EvotingStateTab extends StatefulWidget {
  const EvotingStateTab({Key? key}) : super(key: key);

  @override
  _EvotingStateTabState createState() => _EvotingStateTabState();
}

class _EvotingStateTabState extends State<EvotingStateTab> {
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
