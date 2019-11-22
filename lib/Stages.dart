import 'dart:ui';
import 'package:flutter/material.dart';
import 'questionsData.dart';
import 'quiz1.dart';

int unlockedStage = 1;

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
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          for(var i in getTileList(stagesNames)) i
        ],
      ),
    );
  }

    List<Widget> getTileList(List<String> stagesNames) {
      IconData icon;
      List<Widget> tileList = new List<Widget>();
      for(int i =1;i<stagesNames.length+1;i++)
      {
        if(checkIfNotComplete(i))
          {
            icon = Icons.lock_open;
          }
        else if(checkIfAvailable(i) == true)
          {
            icon = Icons.lock;
          }
        else
          {
            icon = Icons.done;
          }
        tileList.add(_tile(stagesNames[i-1],QuestionsData.getInstance().stagePercentage[i].toString(),icon));
      }
      return tileList;
    }

  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
    title: Text(title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        )),
    subtitle: Text(subtitle),
    leading: Icon(
      icon,
      color: Colors.blue[500],
    ),
    enabled: checkIfNotComplete(stagesNames.indexOf(title)+1),
    onTap: () {
      Stage.index = stagesNames.indexOf(title)+1;
      startQuiz1();
    }
  );


  void startQuiz1(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Quiz1()));
    });
  }
}

bool checkIfNotComplete(int stageNumber)
{
  for(var question in QuestionsData.getInstance().questionsStage[stageNumber])
  {
    if(question.done == 0)
      return true;
  }
  return false;
}

bool checkIfAvailable(int number)
{
  if(number <= unlockedStage) {
    return false;
  }
  return true;
}





List<String> stagesNames = [
  "Etap 1: Wstęp",
  "Etap 2: Prawa i obowiązki studenta",
  "Etap 3: Organizacja studiów",
  "Etap 4: Zasady zaliczania przedmiotów i rejestracji studentów",
  "Etap 5: Studiowanie osób z niepełnosprawnością, urlopy, wznawianie studiów i zmiany kierunków studiów ",
  "Etap 6: Studiowanie przedmiotów ponadprogramowych oraz studia na kierunku dodatkowym",
  "Etap 7: Warunki odbywania studiów przez studentów przyjętych na studia w wyniku potwierdzenia efektów uczenia się",
  "Etap 8: Nagrody, wyróżnienia i kary",
  "Etap 9: Praca dyplomowa",
  "Etap 10: Egzamin dyplomowy",
  "Etap 11: Ukończenie studiów",
  "Etap 12: Warunki i tryb uczestniczenia wybitnie uzdolnionych uczniów w zajęciach przewidzianych programem studiów",
  "Etap 13: Przepisy przejściowe",
  "Etap 14: Przepisy końcowe"
];
