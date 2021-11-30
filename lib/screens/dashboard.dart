import 'package:adp/components/Navigation_drawer.dart';
import 'package:adp/model/users.dart';
import 'package:adp/utills/sharedPrefUtills.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

import '../auth_state.dart';
import '../constants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

int activeIndex = 0;

class _DashboardState extends State<Dashboard> {
  final UsersModel _usersModel = UsersModel();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String memberID = '';


  @override
  void initState() {
    super.initState();
    // AuthState _authenticationProvider =
    // Provider.of<AuthState>(context, listen: false);
    //
    // _authenticationProvider.getUserDetails(_usersModel).then((value) => {
    // memberId = _usersModel.membershipID!,
    //   sharedPref.saveStr('mID', memberId)
    // });
    getUserID(_usersModel).then((value) =>{

      memberID = _usersModel.membershipID!
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: kCOLOR_PRIMARY,
          ),
        ),
        toolbarHeight: 70,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          icon: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: kCOLOR_PRIMARY,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Icon(
              Icons.menu,
              size: 20.0,
              color: kCOLOR_WHITE,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.notifications_outlined,
              color: kCOLOR_PRIMARY,
              size: 30,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  color: kCOLOR_ACCENT,
                  margin: EdgeInsets.all(10),
                  clipBehavior: Clip.antiAlias,
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/referral.png',
                              color: kCOLOR_WHITE,
                              width: 50,
                            ),
                            Text(
                              '23',
                              style: TextStyle(
                                  color: kCOLOR_WHITE,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          'Total Referrals',
                          style: TextStyle(
                              color: kCOLOR_WHITE,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: kCOLOR_PRIMARY,
                  margin: EdgeInsets.all(10),
                  clipBehavior: Clip.antiAlias,
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 25),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:Consumer(
                            builder: (BuildContext context, value, Widget? child)=> Text(
                                      memberID,
                                      style: TextStyle(
                                          color: kCOLOR_WHITE,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                          ),
                          ),

                        Text(
                          'Membership ID',
                          style: TextStyle(
                            color: kCOLOR_WHITE,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: sliderImage.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    final urlImage = sliderImage[index];
                    return buildImage(urlImage, index);
                  },
                  options: CarouselOptions(
                    // aspectRatio: 2.0,
                    height: 160,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) =>
                        () {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  ),
                ),
                Positioned(
                  top: 170,
                  right: 150,
                  child: buildIndicator(),
                ),
              ],
            ),
            Padding(
              padding:
              const EdgeInsets.only(right: 12.0, left: 12.0, top: 12.0),
              child: Card(
                color: kCOLOR_LIGHT_GREY,
                margin: EdgeInsets.all(10),
                clipBehavior: Clip.antiAlias,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SizedBox(
                  height: 310,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 20,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Party Calendar',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: kCOLOR_PRIMARY),
                            ),
                            SizedBox(width: 30),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: TextField(
                                  decoration:
                                  kInputTextFieldDecoration.copyWith(
                                    fillColor: kCOLOR_WHITE,
                                    hintText: 'Search for events',
                                    hintStyle: TextStyle(
                                      fontSize: 12,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      TableCalendar(
                        lastDay: DateTime.utc(2022, 2, 30),
                        firstDay: DateTime.utc(2021, 11, 24),
                        focusedDay: DateTime.now(),
                        headerVisible: true,
                        rowHeight: 30.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildIndicator() =>
      AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 4,
        effect: JumpingDotEffect(
          activeDotColor: kCOLOR_ACCENT,
          dotColor: kCOLOR_WHITE,
          dotWidth: 7,
          dotHeight: 7,
        ),
      );

  Widget buildImage(String urlImage, int index) =>
      Card(
        margin: EdgeInsets.symmetric(horizontal: 5),
        color: Colors.grey,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Image.network(urlImage, fit: BoxFit.fill),
      );

  Future getUserID(UsersModel usersModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _usersModel.membershipID = pref.getString('mID');
    });

    debugPrint('membershipID down $memberID');
  }
}
