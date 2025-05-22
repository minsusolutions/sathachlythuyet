import 'package:hive_flutter/hive_flutter.dart';

part 'question_data.g.dart';

@HiveType(typeId: 5)
class QuestionData {
  @HiveField(0)
  final int questionId;
  @HiveField(1)
  final QuestionStatus questionStatus;

  QuestionData({required this.questionId, required this.questionStatus});
}

@HiveType(typeId: 10)
enum QuestionStatus {
  @HiveField(0)
  unanswer,
  @HiveField(1)
  incorrect,
  @HiveField(2)
  correct,
}
