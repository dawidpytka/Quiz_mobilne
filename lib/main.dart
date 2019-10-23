import 'package:flutter/material.dart';
import './quiz1.dart';

void main(){
  runApp(
      new MaterialApp(
        home: new Home(),
      )
  );
}

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home:new GestureDetector(
          onTap: startQuiz,
          child:new Scaffold(
            body: Center(
                child: Text("Press anywhere to start")
            ),
            backgroundColor: Colors.tealAccent,
          )

      ),
    );
  }

  void startQuiz(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Quiz1()));
    });
  }
}