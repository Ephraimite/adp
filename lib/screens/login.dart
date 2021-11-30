import 'dart:ui';

import 'package:adp/auth_state.dart';
import 'package:adp/components/custom_page_route.dart';
import 'package:adp/components/reuseable_rounded_button.dart';
import 'package:adp/model/users.dart';
import 'package:adp/screens/bottom_navigation.dart';
import 'package:adp/screens/forgot_password_screen.dart';
import 'package:adp/screens/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final UsersModel _usersModel = UsersModel();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var memberId ='';
  var name ='';

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    AuthState _authenticationProvider =
    Provider.of<AuthState>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: kCOLOR_PRIMARY,
        body: ProgressHUD(
          backgroundColor: kCOLOR_PRIMARY,
          child: Form(
            key: formKey,
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
                          child: Icon(Icons.person_outlined,
                              color: Colors.grey, size: 140),
                        ),
                        SizedBox(height: 13),
                        Text(
                          'Email or Phone',
                          style: TextStyle(
                            color: kCOLOR_WHITE,
                          ),
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
                              hintText: 'Enter your email',
                              prefixIcon: Icon(
                                Icons.email,
                                color: kCOLOR_ACCENT,
                              )),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Password',
                          style: TextStyle(
                            color: kCOLOR_WHITE,
                          ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgotPassword())),
                              child: const Text(
                                'Forgot password?',
                                style: TextStyle(
                                  color: kCOLOR_ACCENT,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        Builder(
                          builder: (BuildContext context) => Container(
                            width: double.infinity,
                            child: RoundedButton(
                                text: 'Login',
                                textColor: kCOLOR_WHITE,
                                buttonColor: kCOLOR_RED,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    final progressBar =
                                        ProgressHUD.of((context));
                                    progressBar!.showWithText(
                                        "Authenticating pls wait....");
                                    loginUser(
                                        emailEditingController.text,
                                        passwordEditingController.text,
                                        context);
                                  }
                                }),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Dont have an account?',
                              style: TextStyle(
                                  fontSize: 16.0, color: kCOLOR_WHITE),
                            ),
                            const SizedBox(width: 10),
                            TextButton(
                              child: const Text('Sign up',
                                  style: TextStyle(
                                    color: kCOLOR_ACCENT,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp())),
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
      ),
    );
  }

  Future<void> loginUser(
      String email, String password, BuildContext context) async {
    AuthState authenticationProvider =
        Provider.of<AuthState>(context, listen: false);
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      if (await authenticationProvider.loginUser(email, password)) {
        final progressBar = ProgressHUD.of(context);
        progressBar!.dismiss();
        Navigator.push(context,
            CustomPageRoute(child: BottomNavigationScreen()));
        authenticationProvider.getUserDetails(_usersModel).then((value) => {
          pref.setString('mID', _usersModel.membershipID!),
        });
      } else {
        Fluttertoast.showToast(
            msg: "An error occured pls try again", backgroundColor: Colors.red);
        final progressBar = ProgressHUD.of(context);
        progressBar!.dismiss();
      }
    } catch (e) {
      print(e);
    }
  }
}
