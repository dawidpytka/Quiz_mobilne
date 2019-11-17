import 'package:quiz/Stages.dart' as prefix0;

import "database.dart";

class QuestionsData{
  static QuestionsData instance = new QuestionsData();
  List<Question> questionList;
  List<List<Question>> questionsStage = new List.generate(prefix0.stageNumber+1,(i) => []);

  QuestionsData(){
    getList();
  }
  void getList() async{
    await getDatabase();
    await questionsInit();
    questionList = await getQuestions();
    for(var question in questionList)
      {
        questionsStage[question.stageNumber].add(question);
      }
  }
  static QuestionsData getInstance(){
    return instance;
  }
  Future<void> questionsInit() async
  {
    var question1 = Question(
        id: 1,
        stageNumber: 1,
        question: 'Ile lat ma Politechnika Lodzka',
        answers: ['35', '67', '89', '74'],
        correctAnswer: '74',
        done: 0
    );

    var question2 = Question(
        id: 2,
        stageNumber: 1,
        question: 'Ile wydzialow ma Politechnika Lodzka',
        answers: ['10', '11', '17', '9'],
        correctAnswer: '9',
        done: 0
    );
    var question3 = Question(
        id: 3,
        stageNumber: 1,
        question: 'Ile kierunkow studiow ma Politechnika Lodzka',
        answers: ['30', '35', '22', '45'],
        correctAnswer: '45',
        done: 0
    );

    var question4 = Question(
        id: 4,
        stageNumber: 2,
        question: 'Ilu profesorow posiada Politechnika Lodzka',
        answers: ['200', '211', '222', '229'],
        correctAnswer: '229',
        done: 0
    );
    var question5 = Question(
        id: 5,
        stageNumber: 3,
        question: 'Na jakim wydziale naucza dr Kossowski',
        answers: ['WEEIA', 'FTIMS', 'MECHANICZNY', 'ELEKTRYCZNY'],
        correctAnswer: 'FTIMS',
        done: 0
    );
    await insertQuestion(question1);
    await insertQuestion(question2);
    await insertQuestion(question3);
    await insertQuestion(question4);
    await insertQuestion(question5);
  }
}