import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/database.dart';

var questionNumber = 0;
var quiz;

class Quiz{
  var questions = [
    "Placeholder question ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd",
    "Placeholder question 2"
  ];

  List choices = new List();
  var correctAnswers = [
    "Right, Right2"
  ];
  List question1;
  List question2;

    Quiz() {
//      List question1 = new List();         //for testing , TODO loading questions and answers from file
//      List question2 = new List();
//      question1.add("Wrong1");
//      question1.add("Wrong2");
//      question1.add("Wrong3");
//      question1.add("Right");
//
//      question2.add("Wrong4");
//      question2.add("Wrong5");
//      question2.add("Wrong6");
//      question2.add("Right2");
//      question1.shuffle();
//      question2.shuffle();
//      questionsInit();

      getList();

//      choices.add(question1);
//      choices.add(question2);
    }

    void getList()async{
//      await getDatabase();
      //questionsInit();
      List<Question> q = await getQuestions();
//      sleep(Duration(seconds: 15));
//      List<Question> q = await questions;
      question1 = new List();
      question2 = new List();

//      question1.add(q[0].answerA);
//      question1.add(q[0].answerB);
//      question1.add(q[0].answerC);
//      question1.add("Right");
//
//      question2.add("Wrong4");
//      question2.add("Wrong5");
//      question2.add("Wrong6");
//      question2.add("Right2");

      question1.add(q[0].answerA);
      question1.add(q[0].answerB);
      question1.add(q[0].answerC);
      question1.add(q[0].answerD);
      question2.add(q[1].answerA);
      question2.add(q[1].answerB);
      question2.add(q[1].answerC);
      question2.add(q[1].answerD);
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
                new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1)),
                new Text ("Pytanie ${questionNumber+1} z ${quiz.questions.length}",
                    style: new TextStyle(
                        fontSize: 25.0
                    )),
                new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.2)),
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

void questionsInit() async
{
  var question1 = Question(
      id: 1,
      question: 'Ile lat ma Politechnika Lodzka',
      answerA: '35',
      answerB: '67',
      answerC: '89',
      answerD: '74',
      correctAnswer: '74'
  );

  var question2 = Question(
      id: 2,
      question: 'Ile wydzialow ma Politechnika Lodzka',
      answerA: '10',
      answerB: '11',
      answerC: '17',
      answerD: '9',
      correctAnswer: '9'
  );
  var question3 = Question(
      id: 3,
      question: 'Ile kierunkow studiow ma Politechnika Lodzka',
      answerA: '30',
      answerB: '35',
      answerC: '22',
      answerD: '45',
      correctAnswer: '45'
  );

  var question4 = Question(
      id: 4,
      question: 'Ilu profesorow posiada Politechnika Lodzka',
      answerA: '200',
      answerB: '211',
      answerC: '222',
      answerD: '229',
      correctAnswer: '229'
  );
  var question5 = Question(
      id: 5,
      question: 'Na jakim wydziale naucza dr Kossowski',
      answerA: 'WEEIA',
      answerB: 'FTIMS',
      answerC: 'MECHANICZNY',
      answerD: 'ELEKTRYCZNY',
      correctAnswer: 'FTIMS'
  );
  await insertQuestion(question1);
  await insertQuestion(question2);
  await insertQuestion(question3);
  await insertQuestion(question4);
  await insertQuestion(question5);

}




