import 'package:adp/components/reuseable_app_bar.dart';
import 'package:adp/components/reuseable_news_items.dart';
import 'package:adp/constants.dart';
import 'package:adp/screens/bottom_navigation.dart';
import 'package:adp/screens/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feeds',
          style: TextStyle(
            color: kCOLOR_PRIMARY,
          ),
        ),
        toolbarHeight: 70,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            size: 20.0,
            color: kCOLOR_PRIMARY,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
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
              DefaultTabController(
                length: 4,
                child: TabBar(
                    padding: EdgeInsets.all(8),
                    labelPadding: EdgeInsets.all(8),
                    tabs: const [
                      Text(
                        'LATEST',
                        style: TextStyle(color: kCOLOR_GREY, fontSize: 13),
                      ),
                      Text(
                        'NATIONAL',
                        style: TextStyle(color: kCOLOR_GREY, fontSize: 13),
                      ),
                      Text(
                        'STATE',
                        style: TextStyle(color: kCOLOR_GREY, fontSize: 13),
                      ),
                      Text(
                        'LGA',
                        style: TextStyle(color: kCOLOR_GREY, fontSize: 13),
                      ),
                    ]),
              ),
              ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    return ReuseableNewsItem(
                      image: newsList[index].image,
                      headline: newsList[index].headline,
                      newsType: newsList[index].newsType,
                      time: newsList[index].time,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
