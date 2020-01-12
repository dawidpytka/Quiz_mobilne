import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'EndResult.dart';
import 'Home.dart';
import 'Settings.dart';
import 'Stages.dart';
import 'questionsData.dart';
import 'quiz1.dart';


class ConfettiSample extends StatelessWidget {
  const ConfettiSample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child:MaterialApp(
          debugShowCheckedModeBanner: false,
          showPerformanceOverlay: false,
          title: 'Confetti',
          home: Scaffold(
            body: Result(),
          )),
      onWillPop: () {
        return Future.value(false); // if true allow back else block it
      },
    );
  }
}

class Result extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new ResultState();
  }
}

class ResultState extends State<Result> {
  ConfettiController _controllerTopCenter;
  @override
  void initState() {new Result();
    super.initState();
    _controllerTopCenter = ConfettiController(duration: Duration(seconds: 5));
    if(updateCompletionPercentage()==100)
        _controllerTopCenter.play();
  }

  @override
  void dispose() {
    _controllerTopCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.1),
          child: AppBar(
            backgroundColor: Settings.color,
            title: const Text(
                "Podsumowanie",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 35.0)),
            leading: new Container(),
        )),
        backgroundColor: Colors.white,
        body: new Stack(
          children: <Widget>[
            Container(
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05)),
                    new CircularPercentIndicator(
                      radius: 220.0,
                      lineWidth: 23.0,
                      animation: true,
                      animationDuration: 2000,
                      percent: updateCompletionPercentage()/100.0,
                      center: new Text("${updateCompletionPercentage()} %",
                        style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40.0),
                      ),
                      footer:
                        descriptionText(),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.purple,
                    ),
                    completeText(),
                  new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05)),
                    new Container(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new RichText(
                              textAlign: TextAlign.center,
                              text: new TextSpan(
                                  style: new TextStyle(
                                      color: Colors.black,
                                      fontSize: 20
                                  ),
                                  children: <TextSpan>[
                                    new TextSpan(
                                        text: "${quiz.points} ",
                                        style: new TextStyle(
                                            fontFamily: "Helvetica",
                                            fontSize: 42,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                    new TextSpan(
                                        text: "\nZdobyte punkty"
                                    )
                                  ]
                              )
                          ),
                          new RichText(
                              textAlign: TextAlign.center,
                              text: new TextSpan(
                                  style: new TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  children: <TextSpan>[
                                    new TextSpan(
                                        text: " ${QuestionsData.getInstance().stageAttempts[Stage.index]}",
                                        style: new TextStyle(
                                            fontFamily: "Helvetica",
                                            fontSize: 42,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                    new TextSpan(
                                        text: "\nNumer podejścia"
                                    )
                                  ]
                              )
                          ),
                        ],
                      ),
                    ),
                    new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05)),
                    new LinearPercentIndicator(
                      alignment: MainAxisAlignment.center,
                      width: MediaQuery.of(context).size.width *0.7,
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 2000,
                      percent: totalProgress(),
                      leading: new Text("Etap ",
                          style: new TextStyle(
                              color: Colors.black,
                              fontSize: 20)
                      ),
                      center: Text("${Stage.index}/${QuestionsData.stageCount}"),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Settings.color,
                    ),
                    new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05)),
                    new Center(
                      child: new MaterialButton(
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        color: Settings.color,
                        onPressed: goBackHome,
                        child: new Text("Powrót")
                      ),
                  )]
              )
            ),
            //TOP CENTER
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _controllerTopCenter,
                blastDirection: pi / 2,
                maxBlastForce: 20,
                minBlastForce: 2,
                emissionFrequency: 0.05,
                numberOfParticles: 50,
              ),
            ),
        ],)
    );
  }

  Text descriptionText()
  {
    Text text;
    if(updateCompletionPercentage()==100)
      text = new Text(
        "Gratulacje!",
        textAlign: TextAlign.center,
        style: new TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 40),
      );
    else if(Stage.index == QuestionsData.stageCount)
      text=new Text(
        "Do zakończenia ostatniego \netapu pozostało ${100-updateCompletionPercentage()}%",
        textAlign: TextAlign.center,
          style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17.0)
      );
    else
      {
        text = new Text(
          "Do odblokowania kolejnego \netapu pozostało ${100-updateCompletionPercentage()}%",
          textAlign: TextAlign.center,
            style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17.0)
        );
      }
    return text;
  }

  Text completeText()
  {
    Text text=new Text("");
    if(updateCompletionPercentage()==100)
      text = new Text(
        "Udało Ci się zaliczyć etap ${Stage.index}",
        textAlign: TextAlign.center,
        style: new TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
      );
    return text;
  }

  double totalProgress()
  {
    return Stage.index/QuestionsData.stageCount;
  }

  int updateCompletionPercentage()
  {
    int percentage = (100-(quiz.questionsStage.length-quiz.points)/QuestionsData.getInstance().questionsStage[Stage.index].length*100).round();
    QuestionsData.getInstance().stagePercentage[Stage.index] = percentage;
    return percentage;
  }

  void goBackHome(){
    if(updateCompletionPercentage() == 100)
    {
      QuestionsData.getInstance().unlockedStage++;
    }
    if(QuestionsData.getInstance().unlockedStage > QuestionsData.stageCount)
    {
      setState(() {
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new EndResult()));
      });
    }
    else
      {
        setState(() {
          Navigator.push(context, new MaterialPageRoute(builder: (context)=> new EndResult()));
        });
      }
    }
}
