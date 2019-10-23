import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var questionNumber = 0;
var quiz = new Quiz();

class Quiz{
  var questions = [
    "Placeholder question ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd",
    "Placeholder question 2"
  ];

  List choices = new List();
  var correctAnswers = [
    "Right, Right2"
  ];
    Quiz(){
      List question1 = new List();         //for testing , TODO loading questions and answers from file
      List question2 = new List();
      question1.add("Wrong1");
      question1.add("Wrong2");
      question1.add("Wrong3");
      question1.add("Right");

      question2.add("Wrong4");
      question2.add("Wrong5");
      question2.add("Wrong6");
      question2.add("Right2");
      question1.shuffle();
      question2.shuffle();


      choices.add(question1);
      choices.add(question2);
    }
}

class Quiz1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new Quiz1State();
  }
}

class Quiz1State extends State<Quiz1> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.tealAccent,
        body: new Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
          child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05)),
                new Text ("Pytanie ${questionNumber+1} z ${quiz.questions.length}",
                    style: new TextStyle(
                        fontSize: 25.0
                    )),
                new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.01)),
                new Text ("${quiz.questions[questionNumber]}"),
                new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    answerButton(quiz.choices[questionNumber][0]),
                    answerButton(quiz.choices[questionNumber][1])

                 ],
                ),
                new Padding(padding: EdgeInsets.only(top:20.0)),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      answerButton(quiz.choices[questionNumber][2]),
                      answerButton(quiz.choices[questionNumber][3])

                    ],
                )
                      ]
          )
        )
    );
  }


  void nextQuestion()
  {
    setState(() {
      questionNumber++;
    });
  }

  MaterialButton answerButton(var text)
  {
    return new MaterialButton(
      color: Colors.lightBlueAccent,
      onPressed: nextQuestion,
      minWidth: MediaQuery.of(context).size.width * 0.4,
      height: 100.0,
      child: new Text(text,
          style: new TextStyle(
              color: Colors.black
          )
      ),
    );
  }
}






