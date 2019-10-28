import 'package:flutter/material.dart';
import 'package:quiz/Logo.dart';
import 'package:quiz/database.dart';
import './quiz1.dart';

void main()async{
  await getDatabase();
  quiz = new Quiz();




  runApp(
      new MaterialApp(
        home: new Logo(),
      )
  );
}

