import 'package:equatable/equatable.dart';

enum ExamType { exam, revise, wrong, death }

class ExamInfo extends Equatable {
  final int examCode;
  final int? examSetId;
  final String examTitle;
  final ExamType examType;
  final Map<int, bool?> questions;

  const ExamInfo({
    required this.examCode,
    required this.examTitle,
    required this.examType,
    required this.questions,
    this.examSetId,
  });

  @override
  List<Object?> get props => [examCode, examTitle, examType, questions];
}
