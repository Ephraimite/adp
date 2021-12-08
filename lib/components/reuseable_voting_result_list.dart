
import 'package:flutter/material.dart';

class ReuseableVotingResultListItem extends StatelessWidget {

  final String? image;
  final String? name;
  final String? date;


   ReuseableVotingResultListItem({this.image, this.name, this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text('$image'),
              Text(name!),
              Text(date!),
            ],
          ),
        ),
      ],
    );
  }
}
