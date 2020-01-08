

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './quiz1.dart';
var backgroundColorr = Colors.lightBlue;
bool soundSwitchControl = true;
bool colorSwitchControl = true;

var soundTextHolder = 'Dżwięk jest włączony';
var colorsTextHolder = 'Kolor ustwiony na niebieski';


class Settings extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new SettingsState();
  }
}

class SettingsState extends State<Settings> {


  void toggleSwitchSound(bool value) {
    if (soundSwitchControl == false) {
      setState(() {
        soundSwitchControl = true;
        soundTextHolder = 'Dźwięk jest włączony';
      });
      sound = true;
    }
    else {
      setState(() {
        soundSwitchControl = false;
        soundTextHolder = 'Dżwięk jest wyłączony';
      });
      sound = false;
    }
  }


  void toggleSwitchColors(bool value) {
    if (colorSwitchControl == false) {
      setState(() {
        colorSwitchControl = true;
        colorsTextHolder = 'Kolor ustawiony na niebieski';
        backgroundColorr = Colors.lightBlue;
      });
      sound = true;
    }
    else {
      setState(() {
        colorSwitchControl = false;
        colorsTextHolder = 'Kolory ustawiony na różowy';
        backgroundColorr = Colors.pink;
      });
      sound = false;
    }
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Ustawienia',style: TextStyle( fontSize: 35)),
            centerTitle: true,
            leading: new Container()),

        body: new Column(
//            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.05)),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: <Widget>[
                Container(
                  child: Text('$soundTextHolder', style: TextStyle(fontSize: 15)) ,
                  width: 200,
                ),


                Transform.scale(
                    scale: 1.5,
                    child: Container(

                      child: Switch(
                      onChanged: toggleSwitchSound,
                      value: soundSwitchControl,
                      activeColor: Colors.blue,
                      activeTrackColor: Colors.green,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                    ),
                      width: 100,)

                )
              ],),


              Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05)),

              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: <Widget>[
                Container(
                  child: Text('$colorsTextHolder', style: TextStyle(fontSize: 15)) ,
                  width: 200,
                ),

                Transform.scale(
                    scale: 1.5,
                    child: Container(child: Switch(
                      onChanged: toggleSwitchColors,
                      value: colorSwitchControl,
                      activeColor: Colors.blue,
                      activeTrackColor: Colors.green,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                    ),
                      width: 100,)

                )
              ],
              ),
              Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2)),

              Opacity(
                opacity: 0.8,
                child:  Image.asset("assets/images/ustawienia.png",
                  height: 300,
                  width: 700,
                ),
              )



            ])
    );
  }
}

