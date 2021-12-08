
import 'package:flutter/material.dart';

class FeedStateScreen extends StatefulWidget {
  const FeedStateScreen({Key? key}) : super(key: key);

  @override
  _FeedStateScreenState createState() => _FeedStateScreenState();
}

class _FeedStateScreenState extends State<FeedStateScreen> {
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
