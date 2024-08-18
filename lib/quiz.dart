import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/question_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;
  var activeScreen2 = 'start-screen';

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen2 = 'results-screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      activeScreen2="question-screen";
      selectedAnswers=[];
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
      activeScreen2 = 'question-screen';
    });
  }

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    switch (activeScreen2) {
      case "start-screen":
        screenWidget = StartScreen(switchScreen);
      case "question-screen":
        screenWidget = QuestionScreen(
          onSelectAnswer: chooseAnswer,
        );
      case "results-screen":
        screenWidget = ResultScreen(
          chosenAnswers: selectedAnswers,
          onRestartQuiz: restartQuiz,
        );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 84, 18, 198),
                Color.fromARGB(221, 185, 109, 236),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
