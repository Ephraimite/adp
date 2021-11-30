import 'package:flutter/material.dart';

class ReuseableNewsItem extends StatelessWidget {
  String? image;
  String? headline;
  String? time;
  String? newsType;


  ReuseableNewsItem({this.image, this.headline, this.time, this.newsType});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.all(12),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      headline!,
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Image.asset(image!),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Expanded(
                child: Text('$time . $newsType', style: TextStyle(
                  fontSize: 14,
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}