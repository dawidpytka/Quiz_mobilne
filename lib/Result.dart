import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Home.dart';
import 'Stages.dart';
import 'questionsData.dart';
import 'quiz1.dart';

class Result extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new ResultState();
  }
}

class ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child:
      new Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.1),
          child: AppBar(
            title: const Text(
                "Podsumowanie",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 35.0)),
            leading: new Container(
          ),
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
                      footer: new Text(
                        descriptionText(),
                        textAlign: TextAlign.center,
                        style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17.0),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.purple,
                    ),
                  new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.08)),
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
                          style: new TextStyle(color: Colors.black,fontSize: 20)),
                      center: Text("${Stage.index}/${QuestionsData.stageCount}"),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Colors.blueAccent,
                    ),
                    new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05)),
                    new Center(
                      child: new MaterialButton(
                        color: Colors.blue,
                        onPressed: goBackHome,
                        child: new Text("Powrot do menu głównego")),
                  )]
              )
            )],
        )
      ),
      onWillPop: () {
        return Future.value(false); // if true allow back else block it
    },);
  }

  Alert _alertOfSuccess(BuildContext context) {
    return Alert(
      context: context,
      title: "RFLUTTER ALERT",
      desc: "Flutter is better with RFlutter Alert.",
      image: Image.asset("assets/success.png"),
    );
  }

  String descriptionText()
  {
    String text;
    if(Stage.index == QuestionsData.stageCount)
      text="Do zakończenia ostatniego \netapu pozostało ${100-updateCompletionPercentage()}%";
    else
      {
        text = "Do odblokowania kolejnego \netapu pozostało ${100-updateCompletionPercentage()}%";
      }
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
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Home()));
    });
  }


}
