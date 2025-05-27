import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'question_data.g.dart';

@HiveType(typeId: 11)
class QuestionData extends Equatable {
  @HiveField(0)
  final int questionId;
  @HiveField(1)
  final QuestionStatus questionStatus;

  const QuestionData({required this.questionId, required this.questionStatus});

  @override
  String toString() {
    return 'questionId $questionId, questionStatus: ${questionStatus.name}';
  }

  @override
  List<Object?> get props => [questionId, questionStatus];

  QuestionData copyWith({
    required int? questionId,
    required QuestionStatus? questionStatus,
  }) {
    return QuestionData(
      questionId: questionId ?? this.questionId,
      questionStatus: questionStatus ?? this.questionStatus,
    );
  }
}

@HiveType(typeId: 10)
enum QuestionStatus {
  @HiveField(0)
  unanswer,
  @HiveField(1)
  incorrect,
  @HiveField(2)
  correct,
  @HiveField(3)
  current,
}
