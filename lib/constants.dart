
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/news_data.dart';
import 'model/referral_data.dart';

const kCOLOR_WHITE = Color(0xffF3F3F3);
const kCOLOR_PRIMARY = Color(0xff030D42);
const kCOLOR_ACCENT = Color(0xff4BA0FD);
const kCOLOR_RED = Color(0xffE60000);
const kCOLOR_LIGHT_GREY = Color(0xffececec);
const kCOLOR_GREY = Color(0xffABA9A9);

const List<String> categoryList = [
  'National Chairman',
  'State Governor',
  'Local govt chairman',
  'House of assembly'
];

final sliderImage = [
  'https://firebasestorage.googleapis.com/v0/b/adp-mobile-6a327.appspot.com/o/sl.png?alt=media&token=07798c19-7e34-4082-a90b-01ea353969fa'
      'https://firebasestorage.googleapis.com/v0/b/adp-mobile-6a327.appspot.com/o/sl.png?alt=media&token=07798c19-7e34-4082-a90b-01ea353969fa'
      'https://firebasestorage.googleapis.com/v0/b/adp-mobile-6a327.appspot.com/o/sl.png?alt=media&token=07798c19-7e34-4082-a90b-01ea353969fa'
  // 'https://images.pexels.com/photos/10260685/pexels-photo-10260685.jpeg?cs=srgb&dl=pexels-%D1%86%D0%B2%D0%B5%D1%82%D0%B0-%D1%82%D0%B8%D1%88%D0%B8%D0%BD%D1%8B-10260685.jpg&fm=jpg'
  // 'https://images.pexels.com/photos/10260685/pexels-photo-10260685.jpeg?cs=srgb&dl=pexels-%D1%86%D0%B2%D0%B5%D1%82%D0%B0-%D1%82%D0%B8%D1%88%D0%B8%D0%BD%D1%8B-10260685.jpg&fm=jpg'
  // 'https://images.pexels.com/photos/10260685/pexels-photo-10260685.jpeg?cs=srgb&dl=pexels-%D1%86%D0%B2%D0%B5%D1%82%D0%B0-%D1%82%D0%B8%D1%88%D0%B8%D0%BD%D1%8B-10260685.jpg&fm=jpg'
];
final List<NewsData> newsList = [
  NewsData(
      image: 'assets/images/fani.png',
      headline:
          'Joining APC doesn’t give me immunity” – Fani-Kayode reacts to six-hour stay in EFCC custody',
      newsType: 'state',
      time: '3hrs'),
  NewsData(
      image: 'assets/images/sunday_igboho.png',
      headline:
          'Proposed Sunday Igboho extradition contradicts Buhari’s promise to negotiate Afenifere',
      time: '4hrs',
      newsType: 'Politics'),
  NewsData(
    image: 'assets/images/institude.png',
    headline: 'Nigerian government to institute formal framework to participate in AfCFTA',
    newsType: 'Politics',
    time: '6hrs'
  ),
  NewsData(
    image: 'assets/images/unveils.png',
    headline: 'Nigeria unveils foundation seed solution company',
    time: '4hrs',
    newsType: 'National',
  ),
  NewsData(
    image: 'assets/images/minister.png',
    headline: 'Minister inaugurates Task Force for Audience Measurement Service',
    newsType: 'National',
    time: '3hrs',
  ),
];

final List<ReferralData> referralList = [
  ReferralData(number: 1, name: 'Samuel Sampson', date: '7 Nov'),
  ReferralData(number: 1, name: 'Samuel Sampson', date: '7 Nov'),
  ReferralData(number: 1, name: 'Samuel Sampson', date: '7 Nov'),
  ReferralData(number: 1, name: 'Samuel Sampson', date: '7 Nov'),
  ReferralData(number: 1, name: 'Samuel Sampson', date: '7 Nov'),
  ReferralData(number: 1, name: 'Samuel Sampson', date: '7 Nov'),
];

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter your password.',
  labelText: 'Email',
  prefixIcon: Icon(Icons.email, color: kCOLOR_PRIMARY),
  labelStyle: TextStyle(
    color: kCOLOR_ACCENT,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kCOLOR_LIGHT_GREY),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kCOLOR_PRIMARY),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

const kInputTextFieldDecoration = InputDecoration(
  prefixIcon: Icon(Icons.search, color: Colors.grey),
  contentPadding: EdgeInsets.all(10.0),
  filled: true,
  focusColor: kCOLOR_PRIMARY,
  fillColor: kCOLOR_LIGHT_GREY,
  hintText: 'search',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide.none,
  ),
);

const kInputProfileDecoration = InputDecoration(
  contentPadding: EdgeInsets.all(10.0),
  filled: true,
  focusColor: kCOLOR_PRIMARY,
  fillColor: kCOLOR_LIGHT_GREY,
  hintText: 'search',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide.none,
  ),
);
