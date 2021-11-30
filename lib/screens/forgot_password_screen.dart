
import 'package:adp/components/reuseable_rounded_button.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child:
                      Center(child: Image.asset('assets/images/forgot_password.png',height: 200,)),
                    ),
                    Text(
                      'Reset Password!',
                      style: TextStyle(
                        fontSize: 21.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Dont worry! it happens. Please enter your email address or phone number associated with your account',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Email Address', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kCOLOR_PRIMARY
                      ),),
                    ),
                    TextFormField(
                      decoration: kInputTextFieldDecoration.copyWith(
                          prefixIcon: Icon(null),
                          hintText: 'xxxxxx'
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

              // SizedBox(
              //   width: double.infinity,
              //   height: 167,
              //   child: Stack(
              //     children: [
              //       Row(
              //         children: [
              //           Image.asset('assets/images/ellipse1.png',),
              //           Expanded(child: Image.asset('assets/images/ellipse2.png')),
              //           Positioned(
              //             left:100.0,
              //             child: Expanded(child: Image.asset('assets/images/ellipse3.png')),
              //           ),
              //         ],
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
