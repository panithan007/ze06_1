import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<String> questions = [
    'What is the capital of Thailand?',
    'What is the largest city in Brazil?',
    'What is the currency of Australia?',
    'Who is the current President of the United States?',
    'Which country is known as the Land of the Rising Sun?',
    'What is the capital of Canada?',
    'What is the largest city in India?',
    'What is the official language of Argentina?',
    'What is the currency of South Africa?',
    'What is the smallest country in the world?',
  ];

  List<List<String>> options = [
    ['Bangkok', 'Hanoi', 'Seoul', 'Beijing'],
    ['Rio de Janeiro', 'São Paulo', 'Brasília', 'Salvador'],
    ['Euro', 'Peso', 'Dollar', 'Australian Dollar'],
    ['Donald Trump', 'Joe Biden', 'Barack Obama', 'George W. Bush'],
    ['China', 'Japan', 'South Korea', 'Thailand'],
    ['Toronto', 'Vancouver', 'Ottawa', 'Montreal'],
    ['Delhi', 'Mumbai', 'Kolkata', 'Chennai'],
    ['Spanish', 'Portuguese', 'French', 'English'],
    ['Euro', 'Dollar', 'Rand', 'Peso'],
    ['Monaco', 'Maldives', 'Vatican City', 'Liechtenstein'],
  ];

  List<int> answers = [
    0, // Bangkok
    1, // São Paulo
    3, // Australian Dollar
    1, // Joe Biden
    1, // Japan
    2, // Ottawa
    0, // Delhi
    1, // Portuguese
    2, // Rand
    2, // Vatican City
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  void checkAnswer(int selectedOptionIndex) {
    if (selectedOptionIndex == answers[currentQuestionIndex]) {
      setState(() {
        score++;
      });
    }
    moveToNextQuestion();
  }

  void moveToNextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Quiz Finished'),
            content: Text('Your Score: $score out of ${questions.length}'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  restartQuiz();
                },
                child: Text('Restart'),
              ),
            ],
          );
        },
      );
    }
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              questions[currentQuestionIndex],
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Column(
              children: List.generate(
                4,
                (index) => ElevatedButton(
                  onPressed: () => checkAnswer(index),
                  child: Text(options[currentQuestionIndex][index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

