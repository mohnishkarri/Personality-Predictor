import 'package:flutter/material.dart';
import 'package:flutter_guide/question.dart';
// ignore: unused_import
import 'package:flutter_guide/answer.dart';
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
    final  questions = const[
      {
        'questionText': 'What\'s your favourite color?',
        'answers': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText': 'What\'s your favourite animal? ?',
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
      },
      {
        'questionText': 'Who\'s your favourite instructor?',
        'answers': ['Max', 'Lax', 'Snak', 'Back'],
      },

    ];
  var _questionIndex = 0;
  //var aBool=true;
 // aBool=false;  dart method
  void _answerQuestion() {

    

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if(_questionIndex < questions.length){

      print('We have more Question');

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
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers']as List<String>).map((answer){

                  return Answer(_answerQuestion,answer);

             }).toList()
          ],
        ),
      ),
    );
  }
}
