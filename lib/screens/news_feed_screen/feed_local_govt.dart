
import 'package:flutter/material.dart';

class FeedLocalGovtTab extends StatefulWidget {
  const FeedLocalGovtTab({Key? key}) : super(key: key);

  @override
  _FeedLocalGovtTabState createState() => _FeedLocalGovtTabState();
}

class _FeedLocalGovtTabState extends State<FeedLocalGovtTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('No Available News', style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}
