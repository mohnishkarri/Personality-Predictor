import 'package:flutter/material.dart';
import 'package:flutter_guide/question.dart';
//void main(){

//  runApp(MyApp());

//}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });

    print(questionIndex);
  }

  Widget build(BuildContext context) {
    var questions = [
      'What\s your favourite color?',
      'What\s your favourite animal? '
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(
              questions[questionIndex],
            ),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: _answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: () => print('Answer 2 chosen'),
            ),
            RaisedButton(
                child: Text('Answer 3'),
                onPressed: () {
                  print('Answer 3 chosen');
                }),
            RaisedButton(
              child: Text('Answer 4'),
              onPressed: () {
                print('Answer 4 chosen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
