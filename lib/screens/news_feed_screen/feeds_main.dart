import 'package:adp/components/reuseable_app_bar.dart';
import 'package:adp/components/reuseable_news_items.dart';
import 'package:adp/constants.dart';
import 'package:adp/screens/bottom_navigation.dart';
import 'package:adp/screens/dashboard.dart';
import 'package:adp/screens/news_feed_screen/feed_local_govt.dart';
import 'package:adp/screens/news_feed_screen/latest_tab.dart';
import 'package:adp/screens/news_feed_screen/state_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'national_tab.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kCOLOR_PRIMARY),
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          'Feeds',
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
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Headlines',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: kInputTextFieldDecoration,
              ),
            ),
            TabBar(
                controller: _tabController,
                padding: EdgeInsets.all(8),
                labelPadding: EdgeInsets.all(5),
                labelColor: kCOLOR_ACCENT,
                unselectedLabelColor: kCOLOR_GREY,

                tabs: const [
                  Tab(
                    text: 'LATEST',
                  ),
                  Tab(
                    text: 'NATIONAL',
                  ),
                  Tab(
                    text: 'STATE',
                  ),
                  Tab(
                    text: 'LGA',
                  ),
                ]),
            Expanded(
              child: TabBarView(controller: _tabController, children: const [
                FeedNationalTab(),
                FeedLatestScreen(),
                FeedStateScreen(),
                FeedLocalGovtTab(),

              ]),
            ),
          ],
        ),
      ),
    );
  }
}

