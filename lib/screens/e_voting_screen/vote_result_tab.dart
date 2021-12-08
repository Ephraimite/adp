
import 'package:adp/components/reuseable_referral_list.dart';
import 'package:adp/components/reuseable_voting_result_list.dart';
import 'package:adp/constants.dart';
import 'package:flutter/material.dart';

class VoteResultScreen extends StatefulWidget {
  const VoteResultScreen({Key? key}) : super(key: key);

  @override
  _VoteResultScreenState createState() => _VoteResultScreenState();
}

class _VoteResultScreenState extends State<VoteResultScreen> {
  String? selectedElectionCategory;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                electionCategoryPicker(),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: kCOLOR_GREY)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0, left: 20, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Polls Result', style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                            ),),
                            Text('Voting in progress', style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: kCOLOR_RED,
                                fontStyle: FontStyle.italic
                            ),),
                          ],
                        ),
                      ),
                      Divider(
                        height: 30,
                        thickness: 1.0,
                        color: kCOLOR_GREY,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('3455',style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: kCOLOR_ACCENT
                            ),),
                            Text('10,700', style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: kCOLOR_PRIMARY
                            ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Casted votes', style: TextStyle(
                              color: kCOLOR_GREY,
                              fontWeight: FontWeight.bold
                            ),),
                            Text('Available Voters', style: TextStyle(
                                color: kCOLOR_GREY,
                                fontWeight: FontWeight.bold
                            ),),
                          ],
                        ),
                      ),
                    ],

                  ),
                ),
                SizedBox(height: 20,),
                Text('Result Table', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: kCOLOR_PRIMARY
                ),),

                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                      color: kCOLOR_LIGHT_GREY
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Name', style: TextStyle(
                            color: kCOLOR_PRIMARY,
                            fontWeight: FontWeight.w500
                        ),),
                        Text('Votes', style: TextStyle(
                            color: kCOLOR_PRIMARY,
                            fontWeight: FontWeight.w500
                        ),),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    // color: kCOLOR_LIGHT_GREY,
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: referralList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ReuseableVotingResultListItem(
                        name: referralList[index].name,
                        date: referralList[index].date,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                          color: kCOLOR_GREY,
                        ),
                  ),
                )
              ],
            ),
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
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            color: kCOLOR_LIGHT_GREY, borderRadius: BorderRadius.circular(15)),
        child: DropdownButton<String>(
          elevation: 6,
          hint: Text('Result Category'),
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
