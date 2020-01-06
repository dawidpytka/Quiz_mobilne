import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './questionsData.dart';
import './Settings.dart';
import 'Stages.dart';

import 'package:pdftron_flutter/pdftron_flutter.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    QuestionsData.getInstance();
    return new HomeState();
  }
}

class HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: new Scaffold(
          appBar: AppBar(centerTitle: true,
            title: Text('QuizPOL',style: TextStyle( fontSize: 35)),
          leading: new Container()),
      body: new Stack(
        children: <Widget>[
          Container(
              child :new Image.asset("assets/images/logo-pl.png",
                height: 120,
                width: 230,
              )
          ),
          Center(
            child: Container(
              child:new Column(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.025)
                  ),
                  new IconButton(icon: new Icon(Icons.settings, color: Colors.black, size: 40),
                      padding: EdgeInsets.only(left :MediaQuery.of(context).size.width*0.75 ),
                      onPressed: () {
                        startSettings();
                      }),
                  new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.1)
                  ),
                  startGameButton('Rozpocznij grę'),

                  new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.03)),
                  infoButton("Informacje o politechnice"),
                ],
              )
            )
          )
        ],
      )
    ),
      onWillPop: () {
        return Future.value(false); // if true allow back else block it
      },
    );

  }


  MaterialButton infoButton(var text)
  {
    return new MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      color: Colors.lightBlueAccent,
      onPressed:startMyApp,
      minWidth: MediaQuery.of(context).size.width * 0.5,
      height: 100.0,
      child: new Text(text,
          style: new TextStyle(
              color: Colors.black
          )
      ),
    );
  }

  MaterialButton startGameButton(var text)
  {
    return new MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      color: Colors.lightBlueAccent,
      onPressed: startQuiz1,
      minWidth: MediaQuery.of(context).size.width * 0.5,
      height: 100.0,
      child: new Text(text,
          style: new TextStyle(
              color: Colors.black
          )
      ),
    );
  }
  void startQuiz1(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Stage()));
    });
  }

  void startMyApp(){
    PdftronFlutter.initialize("pDww-i5EZrU7KB2UKnHSRllTIloP4njHnGKQ421kdiYFxiJskqP1239ZNpS4BWJW8xYjDOunNfySI2DyF5NSPjUYGhFMBQbaOBQfOWu-PJPsatqd6y7wXaJeLHJTV7uR0CTOdvFXcSckP0BDQbIyp_TKEQwqRfQhMm-kwcxZ1nMb5T24F8gwzWI8UpigN_8GJxBZg_AS_VyEBbDJ6_nk9KyLuoAw5oFsMcJO64zaIwSCGYjdvOsPpiokg309ZO3DKBJre3NIUCnXLOFyHh8i51uiCPE5iQhE96P-LP5DcTask8gIWjIrJf93e6WAZSBgCJpPpfaZlsDmPoNaO5ixuqsGHA1peSNjV-zDaIvdhqFfgYR9zu2v2JQc9XPLBd17O1lZ9XMeyN0hG8oA6yUtMLZWxe948BtdQUcQusUBLQ5DLXF0MQBCC0uFCpaF4IBU");
    PdftronFlutter.openDocument("https://site-868571.mozfiles.com/files/868571/001_regulamin_studiow.pdf");

  }

  void startSettings(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Settings()));
    });
  }
}