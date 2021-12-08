import 'package:adp/components/custom_page_route.dart';

import 'package:adp/components/reuseable_rounded_button.dart';
import 'package:adp/screens/update_profile1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import '../constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final votersCardEditingController = TextEditingController();
  final ninEditingController = TextEditingController();
  final stateEditingController = TextEditingController();
  final localGovtEditingController = TextEditingController();
  final electoralWardEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text.rich(
                        TextSpan(children: const [
                          TextSpan(
                              text: '       Almost set lets \n',
                              style: TextStyle(fontSize: 20)),
                          TextSpan(
                            text: 'Update your profile!',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: kCOLOR_PRIMARY),
                          )
                        ]),
                      ),
                    ),
                  ),
                  Text(
                    'Voters Card No.',
                    style: TextStyle(
                        color: kCOLOR_PRIMARY, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: votersCardEditingController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Input voters card number';
                      }
                    },
                    enableSuggestions: true,
                    decoration: kInputProfileDecoration.copyWith(
                        hintText: 'Enter your voters card No',
                       ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'NIN',
                    style: TextStyle(
                        color: kCOLOR_PRIMARY, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: ninEditingController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your NIN';
                      }
                    },
                    enableSuggestions: true,
                    decoration: kInputProfileDecoration.copyWith(
                        hintText: 'NIN field cannot be empty',
                       ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'State',
                    style: TextStyle(
                        color: kCOLOR_PRIMARY, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: stateEditingController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your state';
                      }
                    },
                    enableSuggestions: true,
                    decoration: kInputProfileDecoration.copyWith(
                        hintText: 'Enter your state '),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'LGA',
                    style: TextStyle(
                        color: kCOLOR_PRIMARY, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      controller: localGovtEditingController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'input your local govt';
                        }
                      },
                      decoration: kInputProfileDecoration.copyWith(
                          hintText: 'Enter your LGA',
                          ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Electoral Ward',
                    style: TextStyle(
                        color: kCOLOR_PRIMARY, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: electoralWardEditingController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'input your elctoral ward';
                      }
                    },
                    decoration: kInputProfileDecoration.copyWith(
                        hintText: 'Electoral ward',
                     ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RoundedButton(
                        text: 'Continue',
                        textColor: kCOLOR_WHITE,
                        buttonColor: kCOLOR_PRIMARY,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              CustomPageRoute(
                                  child: UpdateProfileScreen2(),
                                  direction: AxisDirection.left),
                            );
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUpUser() {}
}
