import 'dart:ui';
import './quiz1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:quiz/Home.dart';


class Opening extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new OpeningState();
  }
}

class OpeningState extends State<Opening>{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
    home: new GestureDetector(
      onTap: () {
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Quiz1()));
      },
      child: new Scaffold(

      backgroundColor: Colors.white70,
      body: new Container(
        child: new Column(
            children: <Widget>[
              new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.01)),
              new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Image.asset("assets/images/logo-pl.png",
                    height: 120,
                width: 220,),
              ]
              ),
              new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.05)),
              new Text ("QUIZ",textScaleFactor: 4,),
              new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.06)),
              new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  new Image.asset("assets/images/quiz-icon.png",
                  scale:1.7),
              ]
              )
            ]
        )
      ),
    )));

  }

}