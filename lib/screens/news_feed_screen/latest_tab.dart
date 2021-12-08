
import 'package:flutter/material.dart';

class FeedLatestScreen extends StatefulWidget {
  const FeedLatestScreen({Key? key}) : super(key: key);

  @override
  _FeedLatestScreenState createState() => _FeedLatestScreenState();
}

class _FeedLatestScreenState extends State<FeedLatestScreen> {
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
