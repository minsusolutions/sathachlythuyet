import 'package:hive/hive.dart';
import 'package:sathachlaixe/screens/exam/domain/model/answer_status.dart';

part 'user_answer.g.dart';

@HiveType(typeId: 13)
class UserAnswer extends HiveObject {
  static const userAnswerBoxKey = '_userAnswerBoxKey';

  @HiveField(0)
  final int questionId;

  @HiveField(1)
  int? selectedOptionValue;

  @HiveField(2)
  AnswerStatus status;

  UserAnswer({
    required this.questionId,
    this.selectedOptionValue,
    this.status = AnswerStatus.unanswered,
  });

  UserAnswer copyWith({AnswerStatus? status}) {
    return UserAnswer(
      questionId: questionId,
      selectedOptionValue: selectedOptionValue,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'questionId: $questionId,  selectedOptionValue: $selectedOptionValue, status: $status ';
  }
}
