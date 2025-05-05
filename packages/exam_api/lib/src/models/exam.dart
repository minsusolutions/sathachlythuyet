import 'package:equatable/equatable.dart';

class Exam extends Equatable {
  const Exam({
    required this.examCode,
    required this.setCode,
    required this.questionId,
  });

  final int examCode;
  final int setCode;
  final int questionId;

  @override
  List<Object?> get props => [examCode, setCode, questionId];
}
