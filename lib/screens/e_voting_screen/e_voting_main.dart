import 'package:adp/components/reuseable_evoting_cards.dart';
import 'package:adp/constants.dart';
import 'package:adp/screens/e_voting_screen/state_tab.dart';
import 'package:adp/screens/e_voting_screen/vote_result_tab.dart';
import 'package:flutter/material.dart';

import 'local_govt_tab.dart';
import 'national_tab.dart';

class EvotingScreen extends StatefulWidget {
  const EvotingScreen({Key? key}) : super(key: key);

  @override
  _EvotingScreenState createState() => _EvotingScreenState();
}

class _EvotingScreenState extends State<EvotingScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kCOLOR_WHITE,
        iconTheme: IconThemeData(
          color: kCOLOR_PRIMARY,
        ),
        elevation: 0,
        title: Text(
          'eVoting',
          style: TextStyle(color: kCOLOR_PRIMARY),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ADP eVoting',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: kInputTextFieldDecoration,
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: TabBar(
                  controller: _tabController,
                  padding: EdgeInsets.all(8),
                  labelPadding: EdgeInsets.all(5),
                  labelColor: kCOLOR_ACCENT,
                  unselectedLabelColor: kCOLOR_GREY,
                  tabs: const [
                    Tab(
                      text: 'NATIONAL',
                    ),
                    Tab(
                      text: 'STATE',
                    ),
                    Tab(
                      text: 'LGA',
                    ),
                    Tab(
                      text: 'RESULT',
                    ),
                  ]),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  EvotingNationalTab(),
                  EvotingStateTab(),
                  EvotingLocalGovtTab(),
                  VoteResultScreen(),
                ],
              ),
            ),
            // electionCategoryPicker(),
          ],
        ),
      ),
    );
  }
}
