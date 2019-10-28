import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/database.dart';
int points = 0;
var questionNumber = 0;
Quiz quiz;

class Quiz{
//  var questions = [
//    "Placeholder question ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd",
//    "Placeholder question 2"
//  ];

  List<Question> questionList;


//  List choices = new List();
//  var correctAnswers = [
//    "Right, Right2"
//  ];
//  List question1;
//  List question2;

    Quiz() {




      getList();


    }

    void getList()async{
      await getDatabase();
      questionList = await getQuestions();

//      question1 = new List();
//      question2 = new List();
//
//
//      question1.add(q[0].answers[0]);
//      question1.add(q[0].answers[1]);
//      question1.add(q[0].answers[2]);
//      question1.add(q[0].answers[3]);
//      question2.add(q[1].answers[0]);
//      question2.add(q[1].answers[1]);
//      question2.add(q[1].answers[2]);
//      question2.add(q[1].answers[3]);
      for(var i in questionList)
        {
          i.answers.shuffle();
        }


//      choices.add(question1);
//      choices.add(question2);
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
                new Text ("Pytanie ${questionNumber+1} z ${quiz.questionList.length} masz tyle $points",
                    style: new TextStyle(
                        fontSize: 25.0
                    )),
                new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.2)),
                new Text ("${quiz.questionList[questionNumber].question}"),
                new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    answerButton(quiz.questionList[questionNumber].answers[0]),
                    answerButton(quiz.questionList[questionNumber].answers[1])

                 ],
                ),
                new Padding(padding: EdgeInsets.only(top:20.0)),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      answerButton(quiz.questionList[questionNumber].answers[2]),
                      answerButton(quiz.questionList[questionNumber].answers[3])

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
  void checkAnswer(var text)
  {
    if(text == quiz.questionList[questionNumber].correctAnswer)
      {
        points++;
      }

  }

  MaterialButton answerButton(var text)
  {
    return new MaterialButton(
      color: Colors.lightBlueAccent,
      onPressed: (){checkAnswer(text); nextQuestion();},
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

//void questionsInit() async
//{
//  var question1 = Question(
//      id: 1,
//      question: 'Ile lat ma Politechnika Lodzka',
//      answerA: '35',
//      answerB: '67',
//      answerC: '89',
//      answerD: '74',
//      correctAnswer: '74'
//  );
//
//  var question2 = Question(
//      id: 2,
//      question: 'Ile wydzialow ma Politechnika Lodzka',
//      answerA: '10',
//      answerB: '11',
//      answerC: '17',
//      answerD: '9',
//      correctAnswer: '9'
//  );
//  var question3 = Question(
//      id: 3,
//      question: 'Ile kierunkow studiow ma Politechnika Lodzka',
//      answerA: '30',
//      answerB: '35',
//      answerC: '22',
//      answerD: '45',
//      correctAnswer: '45'
//  );
//
//  var question4 = Question(
//      id: 4,
//      question: 'Ilu profesorow posiada Politechnika Lodzka',
//      answerA: '200',
//      answerB: '211',
//      answerC: '222',
//      answerD: '229',
//      correctAnswer: '229'
//  );
//  var question5 = Question(
//      id: 5,
//      question: 'Na jakim wydziale naucza dr Kossowski',
//      answerA: 'WEEIA',
//      answerB: 'FTIMS',
//      answerC: 'MECHANICZNY',
//      answerD: 'ELEKTRYCZNY',
//      correctAnswer: 'FTIMS'
//  );
//  await insertQuestion(question1);
//  await insertQuestion(question2);
//  await insertQuestion(question3);
//  await insertQuestion(question4);
//  await insertQuestion(question5);
//
//}




