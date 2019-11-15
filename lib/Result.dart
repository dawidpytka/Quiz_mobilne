import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
        children: <Widget>[
          new Text(
              "Zdobyles ${quiz.points} punktow. Gratulacje !",
              textAlign: TextAlign.center,
              style: new TextStyle(color: Colors.white,fontSize: 50)
          ),
          new Center(
            child: new MaterialButton(
                color: Colors.white,
                onPressed: goBackHome),
          )
        ],
//        child: new Text(
//                  "Zdobyles $points punktow. Gratulacje !",
//                  textAlign: TextAlign.center,
//                  style: new TextStyle(color: Colors.white,fontSize: 50)
//        ),
      )
    );
  }

  void goBackHome(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Home()));
    });
  }


}
