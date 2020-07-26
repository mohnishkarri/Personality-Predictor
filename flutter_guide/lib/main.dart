import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
//void main(){

//  runApp(MyApp());

//}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //static const questions = const[ |next line concept is also fine
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favourite animal? ?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9}
      ],
    },
    {
      'questionText': 'Who\'s your favourite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Lax', 'score': 1},
        {'text': 'Snak', 'score': 1},
        {'text': 'Back', 'score': 1}
      ],
    },
  ];
  var _questionIndex = 0;
  //var aBool=true;
  // aBool=false;  dart method
  var _totalScore=0;

  void _resetQuiz(){
    setState(() {

     _questionIndex = 0;
     _totalScore=0;

    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more Question');
    } else {
      print('No more questions');
    }
  }

  Widget build(BuildContext context) {
    // questions=[]; This does not work if questions is a const
    //var dummy=['hello']; if const then not possible
    //dummy.add('Max');
    //print(dummy);
    // dummy=[] allow to assign new values
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personality Predictor'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
