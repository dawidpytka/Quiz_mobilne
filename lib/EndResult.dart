import 'dart:async';
import 'dart:math';

import 'package:QuizPOL/questionsData.dart';

import 'Home.dart';
import 'Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class EndResult extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new EndResultState();
  }

  }

class  EndResultState extends State<EndResult> {

  Map<String,int> attemptsData;
  List<String> names;

  @override
  void initState() {
    new EndResult();
    super.initState();
    attemptsData = groupData();
    names = attemptsData.keys.toList();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          showPerformanceOverlay: false,
          title: 'Podsumowanie',
          home: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(MediaQuery
                    .of(context)
                    .size
                    .height * 0.1),
                child: AppBar(
                  backgroundColor: Settings.color,
                  title: const Text(
                      "Podsumowanie",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 35.0)),
                  leading: new Container(),
                )),
            body: new Stack(
              children: <Widget>[
                Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02),),
                      Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),),
                      SingleChildScrollView(
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text('Kandydat')),
                            DataColumn(label: Text('Suma podejść'))
                          ],
                          rows: [
                            DataRow(
                                selected: true,
                                cells: [
                                  DataCell(Text("Ty")),
                                  DataCell(Text(attemptsData["Ty"].toString()))
                                ]
                            ),
                            DataRow(
                                cells: [
                                  DataCell(Text(this.names[1])),
                                  DataCell(Text(attemptsData[this.names[1]].toString()))
                                ]
                            ),
                            DataRow(
                                cells: [
                                  DataCell(Text(this.names[2])),
                                  DataCell(Text(attemptsData[this.names[2]].toString()))
                                ]
                            )
                          ],
                        ),
                      ),

                      Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),),
                      Text(finalText(),style: textStyle(20),),
                      Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),),
                      MaterialButton(
                        shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        onPressed: goBackHome,
                        color: Settings.color,
                        child: new Text("Powrót do menu głównego"),
                      ),

                    ],
                  ),
                )
              ],
            ),
          )),
      onWillPop: () {
        return Future.value(false); // if true allow back else block it
      },
    );
  }

  int attemptsCount(){
    int attempts = 0;
    for(int i =1;i<QuestionsData.stageCount + 1;i++){
      attempts += QuestionsData.getInstance().stageAttempts[i];
    }
    return attempts;
  }

  TextStyle textStyle(double size){
    return new TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
      );
}

  void goBackHome(){
    Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Home()));
  }

  Map<String,int> groupData(){
    var faker = new Faker();
    Map<String,int> data = new Map();
    Random rd = new Random();
    data["Ty"] = attemptsCount();
    data[faker.person.firstName()] = randomAttempts(20);
    data[faker.person.firstName()] = randomAttempts(25);
    return data;
  }

  int randomAttempts(int init){
    Random rd = new Random();
    int returned = -1;
    returned = rd.nextInt(9) + init;
    if(returned == attemptsCount()){
      returned +=1;
    }
    return returned;
  }

  bool playersIsTop(){
    var values = attemptsData.values;
    var valuesList = values.toList();
    for(int value in valuesList){
      if (value < attemptsCount())
        return false;
    }
    return true;
  }

  String finalText(){
    if(playersIsTop()){
      return "Gratulacje! Udało ci się zdobyć najwyższe miejsce w grupie!";
    }
    else
    {
      return "Niestety nie udało ci się zdobyć najwyższego miejsca w grupie. Spróbuj ponownie!";
    }
  }
}
