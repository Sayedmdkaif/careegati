
class   Question {
  final String quizCase;
  final String question;
  final String correctAnswer;
  final List<dynamic> incorrectAnswers;

  Question(this.question,  this.correctAnswer, this.incorrectAnswers, this.quizCase);
}