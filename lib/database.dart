import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Question {
  final int id;
  final int stageNumber;
  final String question;
  final List<String> answers;
  final String correctAnswer;
  int done;
//  final String description;


  Question({this.id, this.stageNumber, this.question, this.answers, this.correctAnswer, this.done});
//  Question({this.id,this.question, this.answers, this.correctAnswer,this.description});


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'stageNumber': stageNumber,
      'question': question,
      'answerA': answers[0],
      'answerB': answers[1],
      'answerC': answers[2],
      'answerD': answers[3],
      'correctAnswer': correctAnswer,
      'done': done,
    };
  }
  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Question{id: $id, question: $question, answerA: $answers[0], answerB: $answers[1], answerC: $answers[2],answerD: $answers[3],correct: $correctAnswer}';
  }
}

Future<Database> questionsDatabase;
Future<void> getDatabase()async {

  // Open the database and store the reference.
  questionsDatabase = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'quiz_db2.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        "CREATE TABLE Questions(id INTEGER PRIMARY KEY, stageNumber INTEGER, question TEXT, answerA TEXT, answerB TEXT, answerC TEXT, answerD TEXT, correctAnswer TEXT, done INTEGER)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
}

// Define a function that inserts dogs into the database
Future<void> insertQuestion(Question question) async {
  // Get a reference to the database.
  final Database db = await questionsDatabase;

  // Insert the Dog into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'Questions',
    question.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Question>> getQuestions() async {
  // Get a reference to the database.
  final Database db = await questionsDatabase;

  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.query('Questions');

  // Convert the List<Map<String, dynamic> into a List<Question>.
  return List.generate(maps.length, (i) {
    return Question(
      id: maps[i]['id'],
      stageNumber: maps[i]['stageNumber'],
      question: maps[i]['question'],
      answers: [maps[i]['answerA'],maps[i]['answerB'],maps[i]['answerC'],maps[i]['answerD']],
      correctAnswer: maps[i]['correctAnswer'],
      done: maps[i]['done']
    );
  });
}

Future<void> updateQuestion(Question question) async {
  // Get a reference to the database.
  final db = await questionsDatabase;

  // Update the given Question.
  await db.update(
    'Questions',
    question.toMap(),
    // Ensure that the Question has a matching id.
    where: "id = ?",
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [question.id],
  );
}

Future<void> deleteQuestion(int id) async {
  // Get a reference to the database.
  final db = await questionsDatabase;

  // Remove the Question from the database.
  await db.delete(
    'Questions',
    // Use a `where` clause to delete a specific question.
    where: "id = ?",
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}