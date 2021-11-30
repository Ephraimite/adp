import 'package:adp/components/reuseable_rounded_button.dart';
import 'package:adp/screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:min_id/min_id.dart';
import 'package:provider/provider.dart';
import 'package:short_uuids/short_uuids.dart';

import '../auth_state.dart';
import '../constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final fullNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final referralCodeEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final id = MinId.getId();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProgressHUD(
        backgroundColor: kCOLOR_PRIMARY,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/left.png'),
                    Image.asset('assets/images/elis.png'),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Register!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: Text(
                          'Action Democratic Party',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        'Full Name',
                        style: TextStyle(
                            color: kCOLOR_PRIMARY, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: fullNameEditingController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name cannot be empty';
                          }
                        },
                        enableSuggestions: true,
                        decoration: kInputTextFieldDecoration.copyWith(
                            hintText: 'Enter your Full Name',
                            prefixIcon: Icon(
                              Icons.person,
                              color: kCOLOR_ACCENT,
                            )),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Email',
                        style: TextStyle(
                            color: kCOLOR_PRIMARY, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: emailEditingController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email cannot be empty';
                          }
                        },
                        enableSuggestions: true,
                        decoration: kInputTextFieldDecoration.copyWith(
                            hintText: 'Enter your Email',
                            prefixIcon: Icon(
                              Icons.email,
                              color: kCOLOR_ACCENT,
                            )),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Referral (optional)',
                        style: TextStyle(
                            color: kCOLOR_PRIMARY, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: referralCodeEditingController,
                        enableSuggestions: true,
                        decoration: kInputTextFieldDecoration.copyWith(
                            hintText: 'Enter your Referral Code ',
                            prefixIcon: Icon(
                              Icons.groups,
                              color: kCOLOR_ACCENT,
                            )),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Password',
                        style: TextStyle(
                            color: kCOLOR_PRIMARY, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: TextFormField(
                          controller: passwordEditingController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password cannot be empty';
                            }
                          },
                          decoration: kInputTextFieldDecoration.copyWith(
                              hintText: 'Enter your password',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: kCOLOR_ACCENT,
                              )),
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                            color: kCOLOR_PRIMARY, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: confirmPasswordEditingController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Confirm password cannot be empty';
                          }else if(value != passwordEditingController.text){
                            return 'passwords do not match';
                          }
                        },
                        decoration: kInputTextFieldDecoration.copyWith(
                            hintText: 'Confirm password',
                            prefixIcon: Icon(
                              Icons.password,
                              color: kCOLOR_ACCENT,
                            )),
                        obscureText: true,
                      ),
                      Builder(
                        builder: (BuildContext context) => Container(
                          width: double.infinity,
                          child: RoundedButton(
                              text: 'Register',
                              textColor: kCOLOR_WHITE,
                              buttonColor: kCOLOR_PRIMARY,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  final progressBar = ProgressHUD.of((context));
                                  progressBar!.showWithText(
                                      "Authenticating pls wait....");
                                  signUpUser(
                                    fullNameEditingController.text,
                                    emailEditingController.text,
                                    referralCodeEditingController.text,
                                    passwordEditingController.text,
                                    confirmPasswordEditingController.text,
                                    context,
                                  );
                                }
                              }),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style:
                                TextStyle(fontSize: 16.0, color: kCOLOR_GREY),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            child: const Text('Sign in',
                                style: TextStyle(
                                  color: kCOLOR_ACCENT,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                )),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen())),
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
      ),
    );
  }

  Future<void> signUpUser(fullName, email, refferalCode, password, confirmPassword,
      BuildContext context) async {
    AuthState authenticationProvider =
        Provider.of<AuthState>(context, listen: false);
    try {
      if (await authenticationProvider.signUpUser(email, password)) {
        saveUserDetails(fullName, email, refferalCode, password,
            confirmPassword, authenticationProvider);
        final progressBar = ProgressHUD.of(context);
        progressBar!.dismiss();
        Fluttertoast.showToast(
            msg: "Registration successful");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        Fluttertoast.showToast(
            msg: "something went wrong pls try again",
            backgroundColor: Colors.red);
        final progressBar = ProgressHUD.of(context);
        progressBar!.dismiss();
      }
    } catch (e) {
      print(e);
    }
  }

  void saveUserDetails(fullName, email, refferalCode, password, confirmPassword,
      AuthState authenticationProvider) {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(authenticationProvider.getUid)
        .set({
      'uid': authenticationProvider.getUid,
      'fullName': fullNameEditingController.text,
      'email': authenticationProvider.getEmail,
      'referral': referralCodeEditingController.text,
      'password': confirmPasswordEditingController.text,
      'membershipID': id,

    });
  }
}
