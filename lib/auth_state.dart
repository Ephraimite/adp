import 'package:adp/utills/sharedPrefUtills.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/users.dart';

class AuthState with ChangeNotifier{
  String? _uid;
  String? _email;

  String? get getUid => _uid;

  String? get getEmail => _email;

  final userRef = FirebaseFirestore.instance.collection('Users');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;



  Future<void> get getCurrentUser async {
    user = _auth.currentUser;
  }

  Future<void> signOut() async {
    _auth.signOut();
  }

  Future<bool> signUpUser(String email, String password) async {
    bool value = false;

    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (_authResult.user != null) {
        _uid = _authResult.user!.uid;
        _email = _authResult.user!.email;
        value = true;
      }
    } on FirebaseException catch (error) {
      print(error);
    }
    return value;
  }

  Future<bool> loginUser(String email, String password) async {
    bool value = false;

    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (_authResult.user != null) {
        _uid = _authResult.user!.uid;
        _email = _authResult.user!.email;
        return true;
      }
    } on FirebaseException catch (error) {
      print(error);
    }

    return value;
  }


  Future getUserDetails(UsersModel usersModel) async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    await userRef.doc(firebaseUser!.uid).get().then((value) async {
      usersModel.fullName = value.data()!['fullName'];
      usersModel.email = value.data()!['email'];
      usersModel.membershipID = value.data()!['membershipID'];
      usersModel.referral = value.data()!['referral'];
      
      Pref().saveStr('memberID', usersModel.membershipID!);

    }).catchError((onError) {
      debugPrint(onError);
    });
    notifyListeners();
  }
}