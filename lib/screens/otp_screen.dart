import 'package:adp/components/reuseable_rounded_button.dart';
import 'package:adp/constants.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child:
                      Center(child: Image.asset('assets/images/enter_otp.png')),
                    ),
                    Text(
                      'Enter OTP!',
                      style: TextStyle(
                        fontSize: 21.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Please enter the code that was sent to some@example.com  or 07xxxxxx ',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Enter OTP Code', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kCOLOR_PRIMARY
                      ),),
                    ),
                    TextFormField(
                      decoration: kInputTextFieldDecoration.copyWith(
                          prefixIcon: Icon(null),
                          hintText: '07xxxxxx'
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: double.infinity,
                      child: RoundedButton(
                        onPressed: () {  },
                        text: 'Submit',
                        textColor: kCOLOR_WHITE,
                        buttonColor: kCOLOR_PRIMARY,


                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 200,
                child: Stack(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/ellipse1.png',),
                          Positioned(
                            left: 20.0,
                            child: Expanded(child: Image.asset('assets/images/ellipse2.png')),
                          ),
                          Positioned(
                            left:40.0,
                            child: Expanded(child: Image.asset('assets/images/ellipse3.png')),
                          ),
                        ],
                      ),
                    ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
