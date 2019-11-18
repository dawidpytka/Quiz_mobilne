import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'questionsData.dart';
import 'dart:io';
import './database.dart';
import './Result.dart';
import 'Stages.dart';

var _firstPress = true ;
int questionNumber = 0;
Quiz quiz;
var answerColor = Colors.lightBlueAccent;
bool wVisible = false;
bool cVisible = false;
class Quiz{
  int points = 0;
  List<Question> questionList;
  List<Question> questionsStage ;

  int stageMax=0;
    Quiz();
}

class Quiz1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    questionNumber=0;
    quiz.points=0;
    quiz.questionsStage = new List();
    for( var question in QuestionsData.getInstance().questionsStage[Stage.index])
      {
        if( question.done == 0)
          quiz.questionsStage.add(question);
      }
//    quiz.questionsStage = QuestionsData.getInstance().questionsStage[Stage.index];
    quiz.questionsStage.shuffle();
    for(var i in quiz.questionsStage) {
      i.answers.shuffle();
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
                new Text ("Pytanie ${questionNumber+1} z ${quiz.questionsStage.length} \n masz ${quiz.points} punktów", textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontSize: 30.0
                    )),
                new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.06)),
                new AnimatedOpacity(opacity: wVisible ? 1.0 : 0.0, duration: Duration(milliseconds: 250),child:Text("Zła odpowiedź !", style: new TextStyle(fontSize:30.0))),
                new AnimatedOpacity(opacity: cVisible ? 1.0 : 0.0, duration: Duration(milliseconds: 250),child:Text("Poprawna odpowiedź !", style: new TextStyle(fontSize:30.0))),
                new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.05)),
                new Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: MediaQuery.of(context).size.height * 0.13,
                  child: Text ("${quiz.questionsStage[questionNumber].question}",textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize:18.0,
                      )),
                ),
                new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05)),
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
          maxLines: 5,
        ),
        onPressed: () {


              checkAnswer(text);
              _animationController
                  .forward(); // tapping the button, starts the animation.


        },
      ),
    );}
}





