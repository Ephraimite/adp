import 'package:adp/components/reuseable_referral_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({Key? key}) : super(key: key);

  @override
  _ReferralScreenState createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kCOLOR_PRIMARY),
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          'Referrals',
          style: TextStyle(color: kCOLOR_PRIMARY),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
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

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
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
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: kCOLOR_RED,
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
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                'xxxxxxxx',
                                style: TextStyle(
                                    color: kCOLOR_WHITE,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Referral Code',
                          style: TextStyle(
                            color: kCOLOR_WHITE,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 250,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: kCOLOR_PRIMARY,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Share My Referral Code',
                      style: TextStyle(
                        color: kCOLOR_WHITE,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.share,
                      color: kCOLOR_WHITE,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text('My Referrals', style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: kCOLOR_PRIMARY
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kCOLOR_LIGHT_GREY,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: referralList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ReuseableReferralList(
                    number: referralList[index].number,
                    name: referralList[index].name,
                    date: referralList[index].date,
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
