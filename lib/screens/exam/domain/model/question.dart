import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class Question {
  static const questionBoxKey = '__questionBoxKey';
  static const isQuestionsLoadedFromCsv = '__isQuestionsLoadedFromCsv';

  @HiveField(0)
  int qNumber;
  @HiveField(1)
  String title;
  @HiveField(2)
  String answer1;
  @HiveField(3)
  String answer2;
  @HiveField(4)
  String answer3;
  @HiveField(5)
  String answer4;
  @HiveField(6)
  String qImage;
  @HiveField(7)
  int correctAnswer;
  @HiveField(8)
  int qCategory;
  @HiveField(9)
  int qNumberIn200;
  @HiveField(10)
  int qNumberIn450;
  @HiveField(11)
  int qNumberIn500;
  @HiveField(12)
  int extra1;
  @HiveField(13)
  int extra2;
  @HiveField(14)
  int extra3;
  @HiveField(15)
  int extra4;
  @HiveField(16)
  bool isDeadQuestion;
  @HiveField(17)
  String hint;

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
    required this.extra1,
    required this.extra2,
    required this.extra3,
    required this.extra4,
    required this.isDeadQuestion,
    required this.hint,
  });
}
