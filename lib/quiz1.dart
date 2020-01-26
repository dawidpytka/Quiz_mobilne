import 'dart:io';
import 'dart:ui';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import './Result.dart';
import './database.dart';
import 'Settings.dart';
import 'Stages.dart';
import 'questionsData.dart';



final player = AudioCache();
bool sound = true;

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
    QuestionsData.getInstance().stageAttempts[Stage.index]+=1;
    QuestionsData.getInstance().serializeAttempts();
    questionNumber=0;
    quiz.points=0;
    quiz.questionsStage = new List();
    for(var question in QuestionsData.getInstance().questionsStage[Stage.index])
      {
        if( question.done == 0)
          quiz.questionsStage.add(question);
      }
    quiz.questionsStage.shuffle();
    for(var i in quiz.questionsStage) {
      i.answers.shuffle();
    }
    return new Quiz1State();
  }
}

class Quiz1State extends State<Quiz1> with SingleTickerProviderStateMixin  {
  //Uses a Ticker Mixin for Animations
  int animationNumber = 0;
  bool blockButtons = false;
  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
            milliseconds:
            400)); //specify the duration for the animation & include `this` for the vsyc
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
            .reverse();
        wVisible = false;
        cVisible = false;
        sleep(Duration(milliseconds: 500));
      }
      else if(status == AnimationStatus.dismissed)
        {
          nextQuestion();
        }
    });
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child:AbsorbPointer(
          absorbing: blockButtons,
          child:Scaffold(
              appBar: AppBar(
                  title: Text('QuizPOL',style: TextStyle( fontSize: 35)),
                  centerTitle: true,
                  leading: new Container(),
                  backgroundColor: Settings.color
              ),
              backgroundColor: _animation.value,
              body:new OnlyOnePointerRecognizerWidget(
                child: new Container(
                  margin: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
                  child: new Column(
                      children: <Widget>[
                        new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04)),
                        new Text ("Pytanie ${questionNumber+1} z ${quiz.questionsStage.length}", textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontSize: 34.0
                            )),
                        new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.05)),
                        new AnimatedOpacity(opacity: wVisible ? 1.0 : 0.0, duration: Duration(milliseconds: 500),child:Text("Zła odpowiedź !", style: new TextStyle(fontSize:30.0))),
                        new AnimatedOpacity(opacity: cVisible ? 1.0 : 0.0, duration: Duration(milliseconds: 500),child:Text("Poprawna odpowiedź !", style: new TextStyle(fontSize:30.0))),
                        new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.05)),
                        new Container(
                          width: MediaQuery.of(context).size.width * 0.80,
                          height: MediaQuery.of(context).size.height * 0.13,
                          child: Text ("${quiz.questionsStage[questionNumber].question}",textAlign: TextAlign.center,
                              style: new TextStyle(
                                fontSize:18.0,
                              )),
                        ),
                        new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04)),
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
              )
          ),
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
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new StageConfetti()));
      }
      else{
        questionNumber++;
      }
      blockButtons = false;
    }
    );
  }

  void checkAnswer(var text)
  {
    setState(() {
      Question currentQuestion = quiz.questionsStage[questionNumber];
      if(text == currentQuestion.correctAnswer)
      {
        if( sound ==true) {
          player.play('music/CorrectAnswer.mp3');
        }
        _animation = ColorTween(begin: Colors.white, end: Colors.greenAccent).animate(
            _animationController);
        cVisible = true;
        quiz.points++;
        currentQuestion.done = 1;
        updateQuestion(currentQuestion);
      }
      else {
        if ( sound == true) {
          player.play('music/WrongAnswer.mp3',volume: 0.5);
        }
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
      child:AbsorbPointer(
        absorbing: blockButtons,
       child:RaisedButton(
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),

         color: Settings.color,
        child: Text(text,
          textAlign: TextAlign.center,


          style: TextStyle(fontSize: 13.0),
          maxLines: 5,
        ),
        onPressed: () {
              blockButtons = true;
              checkAnswer(text);
              _animationController
                  .forward();
//reverse the animation back here if its completed// tapping the button, starts the animation.
        },
      ),
      ),
    );}
}


class OnlyOnePointerRecognizer extends OneSequenceGestureRecognizer {
  int _p = 0;
  @override
  void addPointer(PointerDownEvent event) {
    startTrackingPointer(event.pointer);
    if (_p == 0) {
      resolve(GestureDisposition.rejected);
      _p = event.pointer;
    } else {
      resolve(GestureDisposition.accepted);
    }
  }

  @override
  String get debugDescription => 'only one pointer recognizer';

  @override
  void didStopTrackingLastPointer(int pointer) {}

  @override
  void handleEvent(PointerEvent event) {
    if (!event.down && event.pointer == _p) {
      _p = 0;
    }
  }
}

class OnlyOnePointerRecognizerWidget extends StatelessWidget {
  final Widget child;
  OnlyOnePointerRecognizerWidget({this.child});
  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: <Type, GestureRecognizerFactory>{
        OnlyOnePointerRecognizer: GestureRecognizerFactoryWithHandlers<OnlyOnePointerRecognizer>(
              () => OnlyOnePointerRecognizer(),
              (OnlyOnePointerRecognizer instance) {},
        ),
      },
      child: child,
    );
  }
}