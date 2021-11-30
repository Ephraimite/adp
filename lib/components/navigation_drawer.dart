import 'package:adp/auth_state.dart';
import 'package:adp/components/reuseable_drawer_listile.dart';
import 'package:adp/constants.dart';
import 'package:adp/model/users.dart';
import 'package:adp/screens/dues_screen.dart';
import 'package:adp/screens/e_voting_screen/e_voting_main.dart';
import 'package:adp/screens/login.dart';
import 'package:adp/screens/news_feed_screen/feeds_main.dart';
import 'package:adp/screens/referral_screen.dart';
import 'package:adp/screens/settings_screen.dart';
import 'package:adp/screens/support_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custom_page_route.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);


  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final AuthState _authenticationProvider = AuthState();
  final UsersModel _usersModel = UsersModel();
  String memberId = '';


  @override
  void initState()  {
    super.initState();
    getUserMemberID(_usersModel).then((value) =>{

      memberId = _usersModel.membershipID!
    });

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kCOLOR_PRIMARY,
        body: Column(children: [
          Padding(


            padding: EdgeInsets.only(top: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 40.0),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              AssetImage('assets/images/circleImage.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Abubakar Usman",
                          style: TextStyle(
                              fontSize: 14.0,
                              color: kCOLOR_WHITE,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Poppins'),
                        ),
                        Consumer<AuthState>(
                          builder: (BuildContext context, value, Widget? child)=>
                          Text(
                            memberId,
                            style: TextStyle(
                                fontSize: 14.0,
                                color: kCOLOR_ACCENT,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 5.0, top: 5.0),
                              child: Image.asset(
                                'assets/images/facebook.png',
                                width: 25,
                                height: 25,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 5.0, top: 5),
                              child: Image.asset(
                                'assets/images/twitter.png',
                                width: 25,
                                height: 25,
                              ),
                            ),
                            Image.asset(
                              'assets/images/instagram.png',
                              width: 25,
                              height: 25,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ReuseableDrawerListTile(
            text: 'Feeds',
            iconData: Ionicons.newspaper,
            onTap: (){
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FeedScreen(),
                ),
              );
            },
          ),
          ReuseableDrawerListTile(
            iconData: Ionicons.people,
            text: 'My Referrals',
            onTap: (){
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReferralScreen(),
                ),
              );
            },
          ),
          ReuseableDrawerListTile(
            iconData: Ionicons.cash,
            text: 'Dues',
            onTap: (){
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DuesScreen(),
                ),
              );
            },
          ),
          ReuseableDrawerListTile(
            iconData: Ionicons.thumbs_up,
            text: 'E voting',
            onTap: (){
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EvotingScreen(),
                ),
              );
            },
          ),
          ReuseableDrawerListTile(
            iconData: Ionicons.help_circle,
            text: 'Support',
            onTap: (){
              Navigator.pop(context);
              Navigator.push(
                context,
                CustomPageRoute(child:SupportScreen()),
                );
            },
          ),
          Divider(
            height: 30,
            thickness: 5.0,
          ),
          ReuseableDrawerListTile(
            iconData: Ionicons.log_out,
            text: 'Logout',
            onTap: () {
              _authenticationProvider.signOut().then((value){
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
              });
            },
          ),
        ]),
      ),
    );
  }

  getUserMemberID(UsersModel usersModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _usersModel.membershipID = pref.getString('mID');
    });

    debugPrint('membershipID down $memberId');
  }



}
