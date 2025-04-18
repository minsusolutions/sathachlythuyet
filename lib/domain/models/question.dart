class Question {
  String qNumber;
  String title;
  String answer1;
  String answer2;
  String answer3;
  String answer4;
  String qImage;
  String correctAnswer;
  String qCategory;
  String qNumberIn200;
  String qNumberIn450;
  String qNumberIn500;
  String booF1;
  String booF2;
  String booF3;
  String booF4;
  bool isDeadQuestion;

  Question({
    required this.qNumber,
    required this.title,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.answer4,
    required this.qImage,
    required this.correctAnswer,
    required this.qCategory,
    required this.qNumberIn200,
    required this.qNumberIn450,
    required this.qNumberIn500,
    required this.booF1,
    required this.booF2,
    required this.booF3,
    required this.booF4,
    required this.isDeadQuestion,
  });
}
