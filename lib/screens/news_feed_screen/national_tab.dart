import 'package:adp/components/reuseable_news_items.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class FeedNationalTab extends StatefulWidget {
  const FeedNationalTab({Key? key}) : super(key: key);

  @override
  _FeedNationalTabState createState() => _FeedNationalTabState();
}

class _FeedNationalTabState extends State<FeedNationalTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
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
    );
  }
}
