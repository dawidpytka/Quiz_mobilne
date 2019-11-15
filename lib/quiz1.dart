import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './database.dart';
import './Result.dart';
import 'Stages.dart';


int questionNumber = 0;
Quiz quiz;

class Quiz{
  int points = 0;
  List<Question> questionList;
  List<Question> questionsStage;

  int stageMax=0;

    Quiz() {
      getList();
    }

    void getList()async{
      await getDatabase();

      questionList = await getQuestions();
    }
}

class Quiz1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    questionNumber=0;
    quiz.points=0;
    quiz.questionsStage = new List();
    for(var i in quiz.questionList) {
      i.answers.shuffle();
      if (i.stageNumber == Stage.index && i.done == 0 ) {
//        quiz.stageMax++;
        quiz.questionsStage.add(i);
      }
    }
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
                new Text ("Pytanie ${questionNumber+1} z ${Stage.index} masz tyle ${quiz.points}",
                    style: new TextStyle(
                        fontSize: 25.0
                    )),
                new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.2)),
                new Text ("${quiz.questionsStage[questionNumber].question}"),
                new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    answerButton(quiz.questionsStage[questionNumber].answers[0]),
                    answerButton(quiz.questionsStage[questionNumber].answers[1])

                 ],
                ),
                new Padding(padding: EdgeInsets.only(top:20.0)),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      answerButton(quiz.questionsStage[questionNumber].answers[2]),
                      answerButton(quiz.questionsStage[questionNumber].answers[3])

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
      if(questionNumber == quiz.questionsStage.length-1)
      {
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Result()));
      }
      else questionNumber++;
    });
  }

  void checkAnswer(var text)
  {
    Question currentQuestion = quiz.questionsStage[questionNumber];
    if(text == currentQuestion.correctAnswer)
      {
        quiz.points++;
        currentQuestion.done = 1;
        updateQuestion(currentQuestion);
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

void questionsInit() async
{
  var question1 = Question(
      id: 1,
      stageNumber: 1,
      question: 'Ile lat ma Politechnika Lodzka',
      answers: ['35','67','89','74'],
      correctAnswer: '74',
      done: 0
  );

  var question2 = Question(
      id: 2,
      stageNumber: 1,
      question: 'Ile wydzialow ma Politechnika Lodzka',
      answers: ['10','11','17','9'],
      correctAnswer: '9',
      done: 0
  );
  var question3 = Question(
      id: 3,
      stageNumber: 1,
      question: 'Ile kierunkow studiow ma Politechnika Lodzka',
      answers: ['30','35','22','45'],
      correctAnswer: '45',
      done: 0
  );

  var question4 = Question(
      id: 4,
      stageNumber: 2,
      question: 'Ilu profesorow posiada Politechnika Lodzka',
      answers: ['200','211','222','229'],
      correctAnswer: '229',
      done: 0
  );
  var question5 = Question(
      id: 5,
      stageNumber: 3,
      question: 'Na jakim wydziale naucza dr Kossowski',
      answers: ['WEEIA','FTIMS','MECHANICZNY','ELEKTRYCZNY'],
      correctAnswer: 'FTIMS',
      done: 0
  );
  await insertQuestion(question1);
  await insertQuestion(question2);
  await insertQuestion(question3);
  await insertQuestion(question4);
  await insertQuestion(question5);

}




