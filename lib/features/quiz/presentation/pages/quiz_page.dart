import 'package:flutter/material.dart';
import '../widgets/answer.dart';
import '../widgets/question.dart';
import '../widgets//result.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var _currentIndex = 0;
  var _questions = [
    {
      'textQuestion':
          'What is your favorite color? What is your favorite color? What is your favorite color? What is your favorite color? What is your favorite color? What is your favorite color?',
      'answers': ['Blue', 'Yellow', 'Green', 'Black'],
    },
    {
      'textQuestion': 'What is your favorite animal?',
      'answers': ['Elephant', 'Dog', 'Cat', 'Lion'],
    },
    {
      'textQuestion': 'What is your favorite movie?',
      'answers': [
        'How I met your mother',
        'Modern family',
        'The big bang theory',
        'BOF'
      ],
    },
  ];

  selectAnswer() {
    setState(() {
      _currentIndex++;
    });

    print("selected");
  }

  restart() {
    setState(() {
      _currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        image: DecorationImage(
          image: AssetImage('assets/graphics/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: (_currentIndex < _questions.length)
          ? Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Question(_questions[_currentIndex]["textQuestion"]),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ...(_questions[_currentIndex]["answers"]
                                as List<String>)
                            .map((answer) {
                          return Answer(selectAnswer, answer);
                        }).toList()
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Result(restart),
    );
  }
}
