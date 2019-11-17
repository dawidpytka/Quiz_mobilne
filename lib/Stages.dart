import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:quiz/questionsData.dart';
import 'package:quiz/quiz1.dart';

int stageNumber = 3;

class Stage extends StatefulWidget{
  static int index=1;
  @override
  State<StatefulWidget> createState() {
    return new StageState();
  }
}

class StageState extends State<Stage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black26,
        body: new SingleChildScrollView(
        //margin: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
        child: new Column(
          children: <Widget>[
            new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.08)),
            new Text("Przejdz wszystkie etapy, aby rozpoczac nowe wyzwania !",
            style: new TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontFamily: 'Verdana',
              fontWeight: FontWeight.bold
            ),
              textAlign: TextAlign.center,
            ),
            new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.06)),
            for ( var i in getStageButtonList(stagesNames) ) i,

          ],
        ),
      )
    );
  }


  List<Widget> buttonList;
  List<Widget> getStageButtonList(List<String> stagesNames)
  {
    buttonList = new List<Widget>();
    for(var name in stagesNames)
      {
        buttonList.add(stageButton(name));
        buttonList.add(new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01)));
      }
    return buttonList;
  }


  Color color(var text)
  {
    if(stagesNames.indexOf(text)<stageNumber)
      return Colors.pink;
    else if(stagesNames.indexOf(text)==stageNumber)
      return Colors.green;
    else return Colors.grey;
  }

  SizedBox stageButton(var text)
  {
    return new SizedBox(
      width:MediaQuery.of(context).size.width * 0.9,
      height: 35.0,
      child: new RaisedButton(
        color: color(text),
        onPressed: () {
          Stage.index = stagesNames.indexOf(text)+1;
          if(checkIfComplete(Stage.index))
            {
              startQuiz1();
            }
          },
        child: new Text(text,
          style: new TextStyle(
              color: Colors.black
          ),
          textAlign: TextAlign.center,
        ),

      )
    );
  }

  void startQuiz1(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Quiz1()));
    });
  }
}

bool checkIfComplete(int stageNumber)
{
  if(stageNumber > stageNumber) {
    return false;
  }
  for(var question in QuestionsData.getInstance().questionsStage[stageNumber])
  {
    if(question.done == 0)
      return true;
  }
  return false;
}





List<String> stagesNames = [
  "Etap 1: Wstęp",
  "Etap 2: Prawa i obowiązki studenta",
  "Etap 3: Organizacja studiów",
  "Etap 4: Zasady zaliczania przedmiotów i rejestracji studentów",
  "Etap 5: Studiowanie osób z niepełnosprawnością",
  "Etap 6: Urlopy",
  "Etap 7: Wznawianie studiów i zmiany kierunków studiów",
  "Etap 8: Studiowanie przedmiotów ponadprogramowych oraz studia na kierunku dodatkowym",
  "Etap 9: Warunki odbywania studiów przez studentów przyjętych na studia w wyniku potwierdzenia efektów uczenia się",
  "Etap 10: Nagrody, wyróżnienia i kary",
  "Etap 11: Praca dyplomowa",
  "Etap 12: Egzamin dyplomowy",
  "Etap 13: Ukończenie studiów",
  "Etap 14: Warunki i tryb uczestniczenia wybitnie uzdolnionych uczniów w zajęciach przewidzianych programem studiów",
  "Etap 15: Przepisy przejściowe",
  "Etap 16: Przepisy końcowe"
];
