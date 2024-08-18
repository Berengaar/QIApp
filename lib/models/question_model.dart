class QuestionModel {
  QuestionModel(
      {required this.question,
      required this.answerA,
      required this.answerB,
      required this.answerC,
      required this.answerD,
      required this.correctAnswer});

  final String question;
  final String answerA;
  final String answerB;
  final String answerC;
  final String answerD;
  final String correctAnswer;
}
