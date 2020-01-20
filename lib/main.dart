import 'package:flutter/material.dart';
import 'Logo.dart';

import './quiz1.dart';

void main(){
  quiz = new Quiz();
  runApp(
      new MaterialApp(
          debugShowCheckedModeBanner:false,
          home: new Logo(),
      )
  );
}

