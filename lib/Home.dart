import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './regulations.dart';
import 'Stages.dart';
import './quiz1.dart';


class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          Container(
              child :new Image.asset(
                'assets/images/logo-PL-tlo.jpeg',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
              )
          ),
          Center(
            child: Container(
              child:new Column(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.15)
                  ),
                  startGameButton('Rozpocznij grę'),
                  new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.05)),
                  infoButton("Informacje o politechnice"),
                ],
              )
            )
          )
        ],
      )
    );
  }

  MaterialButton infoButton(var text)
  {
    return new MaterialButton(
      color: Colors.lightBlueAccent,
      onPressed:startMyApp,
      minWidth: MediaQuery.of(context).size.width * 0.4,
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
      color: Colors.lightBlueAccent,
      onPressed: startQuiz1,
      minWidth: MediaQuery.of(context).size.width * 0.4,
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
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Viewer()));
    });
  }
}