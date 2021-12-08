import 'package:adp/screens/raffle_draw_screen/daily.dart';
import 'package:adp/screens/raffle_draw_screen/monthly.dart';
import 'package:adp/screens/raffle_draw_screen/weekly.dart';
import 'package:adp/screens/raffle_draw_screen/yearly.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class RaffleDrawScreen extends StatefulWidget {
  const RaffleDrawScreen({Key? key}) : super(key: key);

  @override
  _RaffleDrawScreenState createState() => _RaffleDrawScreenState();
}

class _RaffleDrawScreenState extends State<RaffleDrawScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: kCOLOR_PRIMARY,
        ),
        elevation: 0,
        title: Text(
          'Draws',
          style: TextStyle(color: kCOLOR_PRIMARY),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              'Raffle Draws winners',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: kInputTextFieldDecoration,
            ),
            TabBar(
                controller: _tabController,
                padding: EdgeInsets.all(8),
                labelPadding: EdgeInsets.all(5),
                labelColor: kCOLOR_ACCENT,
                unselectedLabelColor: kCOLOR_GREY,

                tabs: const [
                  Tab(
                    text: 'YEARLY',
                  ),
                  Tab(
                    text: 'MONTHLY',
                  ),
                  Tab(
                    text: 'WEEKLY',
                  ),
                  Tab(
                    text: 'DAILY',
                  ),
                ]),
            Expanded(
              child: TabBarView(controller: _tabController, children: const [
                RaffleDrawYearly(),
                RaffleDrawMonthly(),
                RaffleDrawWeekly(),
                RaffleDrawDaily(),

              ]),
            ),
          ],
        ),
      ),
    );
  }
}
