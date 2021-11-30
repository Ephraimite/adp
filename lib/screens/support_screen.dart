import 'dart:ui';

import 'package:adp/components/reuseable_app_bar.dart';
import 'package:adp/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kCOLOR_WHITE,
          toolbarHeight: 70,
          elevation: 0,
          iconTheme: IconThemeData(
            color: kCOLOR_PRIMARY,
          ),
          title: Text(
            'Support',
            style: TextStyle(
              color: kCOLOR_PRIMARY,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: kCOLOR_LIGHT_GREY),
                    child: Image.asset('assets/images/support_icon.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'How can we help you?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: (){
                  Fluttertoast.showToast(msg: 'Live support clicked');
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: kCOLOR_LIGHT_GREY,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.headset),
                      Text('Contact Live Chat', style: TextStyle(
                        fontSize: 16,
                        color: kCOLOR_PRIMARY
                      ),),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 100,),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kCOLOR_LIGHT_GREY
                ),
                child: Icon(Icons.email),
              ),
              SizedBox(height: 10,),
              Text('Send us a message', style: TextStyle(
                fontSize: 17,
                color: Colors.grey,
              ),),
              SizedBox(height: 10,),
              Text('suppport@adpmobille.ng', style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
