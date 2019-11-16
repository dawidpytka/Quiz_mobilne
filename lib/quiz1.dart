import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import './database.dart';
import './Result.dart';
import 'Stages.dart';


int questionNumber = 0;
Quiz quiz;
var answerColor = Colors.lightBlueAccent;
bool wVisible = false;
bool cVisible = false;
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
      questionsInit();


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

class Quiz1State extends State<Quiz1> with SingleTickerProviderStateMixin  {
  //Uses a Ticker Mixin for Animations
  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
            milliseconds:
            250)); //specify the duration for the animation & include `this` for the vsyc
    _animation = ColorTween(begin: Colors.white, end: Colors.white).animate(
        _animationController); //use Tween animation here, to animate between the values of 1.0 & 2.5.

    _animation.addListener(() {
      //here, a listener that rebuilds our widget tree when animation.value chnages
      setState(() {

      });
    });

    _animation.addStatusListener((status) {
      //AnimationStatus gives the current status of our animation, we want to go back to its previous state after completing its animation
      if (status == AnimationStatus.completed) {

        _animationController
            .reverse(); //reverse the animation back here if its completed
        wVisible = false;
        cVisible = false;
        sleep(Duration(seconds: 1));
        nextQuestion();

      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child:Scaffold(
      backgroundColor: _animation.value,
        body: new Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
          child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1)),
                new Text ("Pytanie ${questionNumber+1} z ${Stage.index} masz tyle ${quiz.points}",
                    style: new TextStyle(
                        fontSize: 25.0
                    )),
                new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.08)),
                new AnimatedOpacity(opacity: wVisible ? 1.0 : 0.0, duration: Duration(milliseconds: 250),child:Text("Zła odpowiedź !", style: new TextStyle(fontSize:30.0))),
                new AnimatedOpacity(opacity: cVisible ? 1.0 : 0.0, duration: Duration(milliseconds: 250),child:Text("Poprawna odpowiedź !", style: new TextStyle(fontSize:30.0))),
                new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.08)),
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
    ),
      onWillPop: () {
        return Future.value(false); // if true allow back else block it
      },
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
    setState(() {
      Question currentQuestion = quiz.questionsStage[questionNumber];
      if(text == currentQuestion.correctAnswer)
      {
        _animation = ColorTween(begin: Colors.white, end: Colors.greenAccent).animate(
            _animationController);
        cVisible = true;
        quiz.points++;
        currentQuestion.done = 1;
        updateQuestion(currentQuestion);
      }
      else {
        wVisible = true;
        _animation = ColorTween(begin: Colors.white, end: Colors.redAccent).animate(
            _animationController);
      }
    });

  }

  Container answerButton(var text)
  {

    return Container(
      width: MediaQuery.of(context).size.width * 0.45
      ,
      height: MediaQuery.of(context).size.height * 0.13, //multiply the static height value with current animation.value value
      child: RaisedButton(
        color: Colors.lightBlueAccent,
        child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15.0),
          maxLines: 2,
        ),
        onPressed: () {
          checkAnswer(text);
          _animationController
              .forward(); // tapping the button, starts the animation.
        },
      ),
    );}
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




