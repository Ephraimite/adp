import 'package:adp/components/reuseable_evoting_cards.dart';
import 'package:adp/constants.dart';
import 'package:flutter/material.dart';

class EvotingScreen extends StatefulWidget {
  const EvotingScreen({Key? key}) : super(key: key);

  @override
  _EvotingScreenState createState() => _EvotingScreenState();
}

class _EvotingScreenState extends State<EvotingScreen> {
  String? selectedElectionCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kCOLOR_WHITE,
        iconTheme: IconThemeData(
          color: kCOLOR_PRIMARY,
        ),
        elevation: 0,
        title: Text(
          'eVoting', style: TextStyle(
            color: kCOLOR_PRIMARY
        ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
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

          DefaultTabController(
            length: 4,
            child: TabBar(
                padding: EdgeInsets.all(8),
                labelPadding: EdgeInsets.all(8),
                tabs: const [
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
                  Text(
                    'RESULT',
                    style: TextStyle(color: kCOLOR_GREY, fontSize: 13),
                  ),
                ]),
          ),
          electionCategoryPicker(),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 256
            ),
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                child: VoteCandidateCard(
                  image: 'assets/images/sunday_igboho.png',
                  name: 'Sunday Igboho',

                ),
              );
            },

          )],
          ),
        ),
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
          color: kCOLOR_LIGHT_GREY,
              borderRadius: BorderRadius.circular(15)
        ),
        child: DropdownButton<String>(
          elevation: 6,

          hint: Text("Select food category"),
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
