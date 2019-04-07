import 'package:flutter/material.dart';

class AnswerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnswerScreenState();
  }
}

class _AnswerScreenState extends State<StatefulWidget> {
  final List<Map<String, dynamic>> answers = [
    {"id": 0, "answer": 'Is the online marketing'},
    {"id": 1, "answer": 'As electronic commerce or internet commerce'},
    {"id": 2, "answer": 'Is the happy sell'},
    {"id": 3, "answer": 'Is the bussiness online'}
  ];

  int selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Answer the Question"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _introductionBuilder(),
            _questionBuilder(),
            _saveButtonBuilder(),
          ],
        ),
      ),
    );
  }

  Widget _introductionBuilder() {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "INTRODUCTION",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Text(
            "Choose an answer that you think it conrrect. Please check and save your answer clearly",
            style: TextStyle(fontSize: 14),
          ),
        ],
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
        onChanged: (value) {
          if (value) {
            setState(() {
              selectedAnswer = anwser["id"];
            });
            return;
          }
          setState(() {
            selectedAnswer = null;
          });
        },
      );
    }).toList();
  }

  Widget _saveButtonBuilder() {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: FlatButton(
              child: Text("Save"),
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
