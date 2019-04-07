import 'package:flutter/material.dart';

class MemberAnswerScreen extends StatelessWidget {
  final List<Map<String, dynamic>> answers = [
    {"id": 0, "answer": 'Is the online marketing'},
    {"id": 1, "answer": 'As electronic commerce or internet commerce'},
    {"id": 2, "answer": 'Is the happy sell'},
    {"id": 3, "answer": 'Is the bussiness online'}
  ];

  final int selectedAnswer;
  final String memberName;

  MemberAnswerScreen({this.selectedAnswer, this.memberName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Answered By $memberName"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _questionBuilder(),
            _giveButtonBuilder(),
          ],
        ),
      ),
    );
  }

  Widget _questionBuilder() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 25, bottom: 15),
            child: Text(
              "What is the Ecommerce?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _answerBuilder(),
          ),
          Text(
            "Score: 1pt",
            style: TextStyle(fontStyle: FontStyle.italic),
          )
        ],
      ),
    );
  }

  List<Widget> _answerBuilder() {
    return answers.map((anwser) {
      return CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(anwser["answer"]),
        value: selectedAnswer == anwser["id"],
        onChanged: (value) {},
      );
    }).toList();
  }

  Widget _giveButtonBuilder() {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: FlatButton(
              child: Text("Give"),
              textColor: Colors.white,
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
