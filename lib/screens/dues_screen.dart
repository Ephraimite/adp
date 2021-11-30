import 'package:adp/components/reuseable_rounded_button.dart';
import 'package:adp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DuesScreen extends StatefulWidget {
  const DuesScreen({Key? key}) : super(key: key);

  @override
  _DuesScreenState createState() => _DuesScreenState();
}

class _DuesScreenState extends State<DuesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kCOLOR_PRIMARY),
        toolbarHeight: 70,
        title: Text(
          'Dues',
          style: TextStyle(color: kCOLOR_PRIMARY),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: kCOLOR_LIGHT_GREY,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You are yet to make payment for the year 2021.'),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 70,
                      width: double.infinity,
                      child: RoundedButton(
                          textColor: kCOLOR_WHITE,
                          text: 'Make Payment',
                          buttonColor: kCOLOR_PRIMARY,
                          onPressed: () {}),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Payment History',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: kCOLOR_PRIMARY),
            ),
            SizedBox(height: 15,),
            Container(
              decoration: BoxDecoration(
                color: kCOLOR_LIGHT_GREY
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('Year', style: TextStyle(
                      color: kCOLOR_PRIMARY,
                      fontWeight: FontWeight.w500
                    ),),
                    Text('Status', style: TextStyle(
                        color: kCOLOR_PRIMARY,
                        fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
