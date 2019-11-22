import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Stages.dart';
import 'questionsData.dart';
import 'quiz1.dart';
import 'Home.dart';

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
      backgroundColor: Colors.black,
      body: new Stack(
        children: <Widget>[
          Container(
            child: new Column(
                children: <Widget>[
                new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1)),
                new Text(
                    "Podejscie nr ${QuestionsData.getInstance().stageAttempts[Stage.index]} do etapu nr ${Stage.index}",
                    textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.white,fontSize: 50)
                ),
                new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1)),
                new Text(
                    "Zdobyles ${quiz.points} punktow. Gratulacje ! Zaliczyłeś ${updateCompletionPercentage()}% etapu!",
                    textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.white,fontSize: 50)
                ),

                  new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1)),
                new Center(
                  child: new MaterialButton(
                      color: Colors.white,
                      onPressed: goBackHome,
                      child: new Text("Powrot do menu głównego")),
                )
      ])

          )

        ],
//        child: new Text(
//                  "Zdobyles $points punktow. Gratulacje !",
//                  textAlign: TextAlign.center,
//                  style: new TextStyle(color: Colors.white,fontSize: 50)
//        ),
      )
    ),
    onWillPop: () {
    return Future.value(false); // if true allow back else block it
    },
    );
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
