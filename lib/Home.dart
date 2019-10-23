import 'dart:ui';
import './quiz1.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: new Image.asset(
        'assets/images/logo-PL.jpg',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        color: Color.fromRGBO(255, 155, 255, 0.5)
      ),
    );
  }


  void startQuiz(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Quiz1()));
    });
  }
}