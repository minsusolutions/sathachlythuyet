import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'question.g.dart';

// @JsonSerializable()
@HiveType(typeId: 3)
class Question extends Equatable {
  static const questionBoxKey = '__questionBoxKey';
  static const isQuestionsLoadedFromCsv = '__isQuestionsLoadedFromCsv';

  @HiveField(0)
  final int qNumber;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String answer1;
  @HiveField(3)
  final String answer2;
  @HiveField(4)
  final String answer3;
  @HiveField(5)
  final String answer4;
  @HiveField(6)
  final String qImage;
  @HiveField(7)
  final int correctAnswer;
  @HiveField(8)
  final int qCategory;
  @HiveField(9)
  final int qNumberIn200;
  @HiveField(10)
  final int qNumberIn450;
  @HiveField(11)
  final int qNumberIn500;
  @HiveField(12)
  final int extra1;
  @HiveField(13)
  final int extra2;
  @HiveField(14)
  final int extra3;
  @HiveField(15)
  final int extra4;
  @HiveField(16)
  final bool isDeadQuestion;
  @HiveField(17)
  final String hint;
  @HiveField(18)
  final int selectedAnswer;

  const Question({
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
    required this.selectedAnswer,
  });

  Question copyWith({required int? selectedAnswer}) {
    return Question(
      qNumber: qNumber,
      title: title,
      answer1: answer1,
      answer2: answer2,
      answer3: answer3,
      answer4: answer4,
      qImage: qImage,
      correctAnswer: correctAnswer,
      qCategory: qCategory,
      qNumberIn200: qNumberIn200,
      qNumberIn450: qNumberIn450,
      qNumberIn500: qNumberIn500,
      extra1: extra1,
      extra2: extra2,
      extra3: extra3,
      extra4: extra4,
      isDeadQuestion: isDeadQuestion,
      hint: hint,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
    );
  }

  @override
  String toString() {
    return 'Question(qNumber: $qNumber, title: $title, answer1: $answer1,answer2: $answer2, answer3: $answer3, answer4: $answer4), selectedAnswer: $selectedAnswer';
  }

  @override
  List<Object?> get props => [qNumber, selectedAnswer];
}

extension QuestionX on Question {
  String buildQuestioniKeyBaseOn(int licienseId, int examCode, int examSet) =>
      ('${licienseId}__key__${examCode}__${examSet}__${qNumber}');
}
