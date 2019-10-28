import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Center(
        child: new Text(
                  "Zdobyles $points punktow. Gratulacje !",
                  textAlign: TextAlign.center,
                  style: new TextStyle(color: Colors.white,fontSize: 50)
        ),
      )
    );
  }




}
