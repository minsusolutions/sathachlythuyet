import 'package:hive/hive.dart';

part 'answer_status.g.dart';

@HiveType(typeId: 12)
enum AnswerStatus {
  @HiveField(0)
  unanswered,

  @HiveField(1)
  correct,

  @HiveField(2)
  incorrect,
}
