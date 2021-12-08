
import 'package:adp/components/reuseable_evoting_cards.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class EvotingNationalTab extends StatefulWidget {
  const EvotingNationalTab({Key? key}) : super(key: key);

  @override
  _EvotingNationalTabState createState() => _EvotingNationalTabState();
}

class _EvotingNationalTabState extends State<EvotingNationalTab> {
  String? selectedElectionCategory;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // electionCategoryPicker(),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 256),
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return VoteCandidateCard(
                image: 'assets/images/sunday_igboho.png',
                name: 'Sunday Igboho',
              );
            },
          ),
        ],
      ),
    );
  }
  Widget electionCategoryPicker() {
    List<DropdownMenuItem<String>> dropDownItem = [];
    for (String category in categoryList) {
      var newItem = DropdownMenuItem(child: Text(category), value: category);
      dropDownItem.add(newItem);
    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(12),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: kCOLOR_LIGHT_GREY, borderRadius: BorderRadius.circular(15)),
        child: DropdownButton<String>(
          elevation: 6,

          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.black87),
          underline: SizedBox(),
          iconSize: 36.0,
          isExpanded: true,
          value: selectedElectionCategory,
          items: dropDownItem,
          onChanged: (value) {
            setState(
                  () {
                selectedElectionCategory = value!;
              },
            );
          },
        ),
      ),
    );
  }
}
