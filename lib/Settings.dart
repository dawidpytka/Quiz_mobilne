import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './quiz1.dart';
import 'Home.dart';

bool soundSwitchControl = true;
bool colorSwitchControl = true;

var soundTextHolder = 'Dżwięk jest włączony';
var colorsTextHolder = 'Kolor ustwiony na niebieski';


class Settings extends StatefulWidget{
  static var color = Colors.lightBlue;
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
        Settings.color = Colors.lightBlue;
      });
      sound = true;
    }
    else {
      setState(() {
        colorSwitchControl = false;
        colorsTextHolder = 'Kolory ustawiony na różowy';
        Settings.color = Colors.pink;
      });
      sound = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: new Scaffold(
          appBar: AppBar(
              title: Text('Ustawienia',style: TextStyle( fontSize: 35)),
              centerTitle: true,
              leading: new IconButton(
                  icon: new Icon(Icons.arrow_back),
                  onPressed: goBackHome)
          ),
          body: new Column(
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
                        width: 100,
                      )
                  ),
                ],),

                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.15)),
                Opacity(
                  opacity: 0.8,
                  child:  Image.asset("assets/images/ustawienia.png",
                    height: 300,
                    width: 700,
                  ),
                )
              ])
      ),
      onWillPop: () {
        return Future.value(false); // if true allow back else block it
      },
    );

  }

  void goBackHome(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Home()));
    });
  }
}
