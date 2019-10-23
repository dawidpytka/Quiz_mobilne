import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/Opening.dart';

class Logo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new LogoState();
  }
}

class LogoState extends State<Logo>{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return new MaterialApp(
      home:new GestureDetector(
          onTap: () {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => new Opening()),
            );
          },
          child:new Scaffold(
            body: new Image.asset(
              'assets/images/logo-PL.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          )
      ),
    );
  }
}