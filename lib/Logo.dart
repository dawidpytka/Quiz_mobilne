import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './Opening.dart';
import './Routes.dart';


class Logo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new LogoState();
  }
}

class LogoState extends State<Logo>{
  Timer _timer;
  LogoState(){
    _timer = new Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        Navigator.push(context, FadeRoute(page: Opening()),);
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return new MaterialApp(
      home:new GestureDetector(
//          onTap: () {
//            Navigator.push(
//              context,
//              FadeRoute(page: AnimatedFlutterLogo()),
//            );
//          },
          child:new Scaffold(
            body: new Image.asset(
              'assets/images/logo-PL-start.jpeg',
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