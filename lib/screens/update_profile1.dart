
import 'package:adp/components/reuseable_rounded_button.dart';
import 'package:adp/constants.dart';
import 'package:flutter/material.dart';

class UpdateProfileScreen2 extends StatefulWidget {
  const UpdateProfileScreen2({Key? key}) : super(key: key);

  @override
  _UpdateProfileScreen2State createState() => _UpdateProfileScreen2State();
}

class _UpdateProfileScreen2State extends State<UpdateProfileScreen2> {
  final votersCardEditingController = TextEditingController();
  final ninEditingController = TextEditingController();
  final stateEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Center(
                    child: Text.rich(
                      TextSpan(children: const [
                        TextSpan(
                            text: '  The last step \n',
                            style: TextStyle(fontSize: 20)),
                        TextSpan(
                          text: 'To joining us!',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: kCOLOR_PRIMARY),
                        )
                      ]),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: kCOLOR_LIGHT_GREY,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(Icons.add, size: 50, ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  Text(
                    'Account Name',
                    style: TextStyle(
                        color: kCOLOR_PRIMARY, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: votersCardEditingController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Input your account name';
                      }
                    },
                    enableSuggestions: true,
                    decoration: kInputProfileDecoration.copyWith(
                        hintText: 'Bank Account Name',
                       ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Account Number',
                    style: TextStyle(
                        color: kCOLOR_PRIMARY, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: ninEditingController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Input your account number';
                      }
                    },
                    enableSuggestions: true,
                    decoration: kInputProfileDecoration.copyWith(
                        hintText: 'Account number',
                      ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Bank Name',
                    style: TextStyle(
                        color: kCOLOR_PRIMARY, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: stateEditingController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Input your bank name';
                      }
                    },
                    enableSuggestions: true,
                    decoration: kInputProfileDecoration.copyWith(
                        hintText: 'Enter your bank name ',
                     ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,
                    child: RoundedButton(
                        text: 'Update Profile',
                        textColor: kCOLOR_WHITE,
                        buttonColor: kCOLOR_PRIMARY,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Navigator.push(
                            //   context,
                            //   CustomPageRoute(
                            //       child: UpdateProfileScreen2(),
                            //       direction: AxisDirection.left
                            //   ),
                            // );
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
}
