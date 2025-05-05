class Question {
  int id;
  String title;
  String answer1;
  String answer2;
  String answer3;
  String answer4;
  String qImage;
  int correctAnswer;
  int category;
  int qNumberIn200;
  int qNumberIn450;
  int qNumberIn500;
  String arg1;
  String arg2;
  String arg3;
  String arg4;
  bool isDeadQuestion;

  Question({
    required this.id,
    required this.title,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.answer4,
    required this.qImage,
    required this.correctAnswer,
    required this.category,
    required this.qNumberIn200,
    required this.qNumberIn450,
    required this.qNumberIn500,
    required this.arg1,
    required this.arg2,
    required this.arg3,
    required this.arg4,
    required this.isDeadQuestion,
  });
}
